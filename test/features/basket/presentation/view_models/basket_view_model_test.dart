import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layout2/features/basket/data/repositories/item_repository.dart';
import 'package:layout2/features/basket/data/repositories/item_repository_db.dart';
import 'package:layout2/features/basket/domain/entities/item.dart';
import 'package:layout2/features/basket/presentation/view_models/basket_view_model.dart';

class _MockItemRepository extends ItemRepository {
  List<Item> items;
  Item? lastAdded;
  String? lastDeletedId;

  _MockItemRepository(this.items);

  @override
  Future<Item> addRemoteItem(Item item) async {
    lastAdded = item;
    items = [...items, item];
    return item;
  }

  @override
  Future<void> deleteRemoteItem(String id) async {
    lastDeletedId = id;
    items = items.where((e) => e.name != id).toList();
  }

  @override
  Future<List<Item>> fetchItems() async {
    return items;
  }
}

void main() {
  test('works when initial state is empty', () async {
    final container = ProviderContainer(
      overrides: [
        itemRepositoryProvider.overrideWith(
              (ref) => _MockItemRepository([]),
        ),
      ],
    );

    addTearDown(container.dispose);

    await expectLater(
      container.read(itemNotifierProvider.future),
      completion(isEmpty),
    );

    final state = container.read(itemNotifierProvider);

    expect(state, isA<AsyncData<List<Item>>>());
    expect(state.value, isEmpty);
  });

  test('build loads initial items from repository', () async {
    final initial = [
      Item(name: 'Item 1'),
      Item(name: 'Item 2'),
    ];

    final container = ProviderContainer(
      overrides: [
        itemRepositoryProvider.overrideWith(
              (ref) => _MockItemRepository(initial),
        ),
      ],
    );

    addTearDown(container.dispose);

    final result = await container.read(itemNotifierProvider.future);

    expect(result, initial);
    expect(
      container.read(itemNotifierProvider),
      AsyncValue<List<Item>>.data(initial),
    );
  });

  test('addItem appends created item to current state', () async {
    final initial = [Item(name: 'Initial')];
    final newItem = Item(name: 'New');

    final mockRepo = _MockItemRepository(initial);

    final container = ProviderContainer(
      overrides: [
        itemRepositoryProvider.overrideWith((ref) => mockRepo),
      ],
    );

    addTearDown(container.dispose);

    await container.read(itemNotifierProvider.future);

    final notifier = container.read(itemNotifierProvider.notifier);

    await notifier.addItem(newItem);

    final state = container.read(itemNotifierProvider);

    expect(state, isA<AsyncData<List<Item>>>());
    expect(state.value, [...initial, newItem]); // repo returns the same item
    expect(mockRepo.lastAdded, newItem);
  });

  test('pullItem does nothing when there are no items', () async {
    final mockRepo = _MockItemRepository([]);

    final container = ProviderContainer(
      overrides: [
        itemRepositoryProvider.overrideWith((ref) => mockRepo),
      ],
    );

    addTearDown(container.dispose);

    // Build with empty list
    await container.read(itemNotifierProvider.future);
    final notifier = container.read(itemNotifierProvider.notifier);

    final before = container.read(itemNotifierProvider);

    await notifier.pullItem();

    final after = container.read(itemNotifierProvider);

    // State unchanged
    expect(after, before);
    // No delete call
    expect(mockRepo.lastDeletedId, isNull);
  });

  test('pullItem removes last item and calls deleteRemoteItem', () async {
    final item1 = Item(name: 'Item 1');
    final item2 = Item(name: 'Item 2');
    final mockRepo = _MockItemRepository([item1, item2]);

    final container = ProviderContainer(
      overrides: [
        itemRepositoryProvider.overrideWith((ref) => mockRepo),
      ],
    );

    addTearDown(container.dispose);

    // Load initial items
    await container.read(itemNotifierProvider.future);
    final notifier = container.read(itemNotifierProvider.notifier);

    await notifier.pullItem();

    final state = container.read(itemNotifierProvider);

    expect(state, isA<AsyncData<List<Item>>>());
    expect(state.value, [item1]); // last item removed
    expect(mockRepo.lastDeletedId, item2.name);
  });
}

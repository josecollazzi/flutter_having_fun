import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/item_repository.dart';
import '../../data/repositories/item_repository_db.dart';
import '../../domain/entities/item.dart';

final itemNotifierProvider = AsyncNotifierProvider.autoDispose<ItemNotifier, List<Item>>(ItemNotifier.new);

class ItemNotifier extends AsyncNotifier<List<Item>> {
  ItemRepository get _repository => ref.read(itemRepositoryProvider);

  @override
  Future<List<Item>> build() async {
    return _repository.fetchItems();
  }

  Future<void> addItem(Item item) async {
    final current = state.value ?? [];
    state = const AsyncValue.loading();

    final created = await _repository.addRemoteItem(item);
    state = AsyncValue.data([...current, created]);
  }

  Future<void> pullItem() async {
    final current = state.value ?? [];
    if (current.isEmpty) return;

    final last = current.last;
    state = const AsyncValue.loading();

    await _repository.deleteRemoteItem(last.name);
    state = AsyncValue.data([...current]..removeLast());
  }
}

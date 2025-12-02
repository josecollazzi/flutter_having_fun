import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layout2/features/basket/domain/entities/item.dart';
import 'package:layout2/features/basket/presentation/widgets/basket_screen.dart';
import 'package:layout2/features/basket/presentation/view_models/basket_view_model.dart';

void main() {
  testWidgets('shows loading state', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          itemNotifierProvider.overrideWithBuild((ref, itemNotifier) {
            itemNotifier.state = const AsyncValue<List<Item>>.loading();
            return Completer<List<Item>>().future;
          }),
        ],
        child: const MaterialApp(
          home: BasketScreen(),
        ),
      ),
    );

    expect(find.text('Demo'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('shows error state', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          itemNotifierProvider.overrideWithBuild((ref, itemNotifier) {
            itemNotifier.state = const AsyncValue<List<Item>>.error(Object(),StackTrace.empty);
            return Completer<List<Item>>().future;
          }),
        ],
        child: const MaterialApp(
          home: BasketScreen(),
        ),
      ),
    );

    expect(find.text('Demo'), findsOneWidget);
    expect(find.text('error'), findsOneWidget);
  });

  testWidgets('shows list of items in data state', (WidgetTester tester) async {

        final List<Item> items = [
          Item(name: 'Apple'),
          Item(name: 'Banana'),
        ];

        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              itemNotifierProvider.overrideWithBuild((ref, itemNotifier) {
                itemNotifier.state = AsyncValue<List<Item>>.data(items);
                return Completer<List<Item>>().future;
              }),
            ],
            child: const MaterialApp(
              home: BasketScreen(),
            ),
          ),
        );

        // AppBar title
        expect(find.text('Demo'), findsOneWidget);

        // Items rendered in the ListView
        expect(find.text('Apple'), findsOneWidget);
        expect(find.text('Banana'), findsOneWidget);

        // Buttons visible
        expect(find.text('Add Item'), findsOneWidget);
        expect(find.text('Delete Item'), findsOneWidget);
      });
}

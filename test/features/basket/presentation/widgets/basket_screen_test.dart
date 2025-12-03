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

    expect(find.text('Home'), findsOneWidget);
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

    expect(find.text('Home'), findsOneWidget);
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

        expect(find.byIcon(Icons.more_vert), findsOneWidget);
        await tester.tap(find.byIcon(Icons.more_vert));
        // to wait until Flutter is "done doing stuff".
        await tester.pumpAndSettle();


        expect(find.text('Home'), findsWidgets);
        expect(find.text('Sign Up'), findsOneWidget);

        expect(find.text('Apple'), findsOneWidget);
        expect(find.text('Banana'), findsOneWidget);

        expect(find.text('Add Item'), findsOneWidget);
        expect(find.text('Delete Item'), findsOneWidget);
      });
}

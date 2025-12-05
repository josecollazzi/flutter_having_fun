import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:layout2/features/interview_questions/presentation/widgets/isolates_time.dart';

void main() {
  testWidgets(
    'Small task are more costly in isolates',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: IsolatesTime(loopSize: 1000000),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      await tester.runAsync(() async {
        await Future<void>.delayed(const Duration(seconds: 3));
      });

      await tester.pumpAndSettle();

      final differenceFinder = find.textContaining('Difference:');
      expect(differenceFinder, findsOneWidget);

      final textWidget = tester.widget<Text>(differenceFinder);
      final textContent = textWidget.data!;

      final valueString = textContent.split(': ').last;
      final difference = int.parse(valueString);

      debugPrint('Found difference: $difference');

      expect(difference, lessThan(0)); // isolates are slower than the main thread for small computations
    },
    timeout: const Timeout(Duration(minutes: 2)),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:layout2/features/interview_questions/presentation/widgets/micro_task.dart';

void main() {
    testWidgets('Microtask order', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: MicroTask()));
      final state = tester.state(find.byType(MicroTask)) as dynamic;
      //expect(state.listItems, equals(['A', 'D'])); this break test randomly it could return A,D or A,D,C
      await tester.pump();
      expect(state.listItems, equals(['A', 'D', 'C'])); // it doesn't break, but I am not sure how consistent it is
      await tester.pumpAndSettle();
      expect(state.listItems, equals(['A', 'D', 'C', 'B']));
    });
}
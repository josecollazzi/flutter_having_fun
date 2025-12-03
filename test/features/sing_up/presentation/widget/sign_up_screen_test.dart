import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layout2/features/core/view_models/current_user_provider.dart';
import 'package:layout2/features/sing_up/domain/entities/user.dart';
import 'package:layout2/features/sing_up/presentation/widgets/sign_up_screen.dart';

void main() {
  testWidgets('shows form user logged in', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          currentUserProvider.overrideWithBuild((ref, userNotifier) {
            userNotifier.state = const AsyncValue<User?>.loading();
            return Stream<User?>.value(null);
          }),
        ],
        child: const MaterialApp(
          home: SignUpScreen(),
        ),
      ),
    );

    expect(find.text('Sign Up'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('shows form user logged out', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          currentUserProvider.overrideWithBuild((ref, userNotifier) {
            var user = User(email: "test@test.com");
            userNotifier.state =  AsyncValue<User?>.data(user);
            return Stream<User?>.value(user);
          }),
        ],
        child: const MaterialApp(
          home: SignUpScreen(),
        ),
      ),
    );

    expect(find.text('Sign Up'), findsOneWidget);
    expect(find.text('Welcome to having fun app'), findsOneWidget);
  });

  testWidgets('shows form with errors', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          currentUserProvider.overrideWithBuild((ref, userNotifier) {
            userNotifier.state = const AsyncValue<User?>.data(null);
            return Stream<User?>.value(null);
          }),
        ],
        child: const MaterialApp(
          home: SignUpScreen(),
        ),
      ),
    );

    await tester.tap(find.text("Save"));
    // to wait until Flutter is "done doing stuff".
    await tester.pumpAndSettle();

    expect(find.text("Email is required"), findsOneWidget);
    expect(find.text("You must agree with Terms & Conditions."), findsOneWidget);

  });

  testWidgets('validate email in form', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          currentUserProvider.overrideWithBuild((ref, userNotifier) {
            // Expose user == null so form will show
            userNotifier.state = const AsyncValue<User?>.data(null);
            return Stream<User?>.value(null);
          }),
        ],
        child: const MaterialApp(
          home: SignUpScreen(),
        ),
      ),
    );


    await tester.enterText(find.byType(TextFormField), 'not-an-email');

    await tester.tap(find.text("Save"));
    await tester.pumpAndSettle();


    expect(find.text("Enter a valid email"), findsOneWidget);

    await tester.enterText(find.byType(TextFormField), 'test@example.com');
    await tester.tap(find.text("Save"));
    await tester.pumpAndSettle();

    // Now "Enter a valid email" must disappear
    expect(find.text("Enter a valid email"), findsNothing);
  });
}

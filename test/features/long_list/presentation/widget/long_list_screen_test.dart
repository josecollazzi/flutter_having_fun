import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:layout2/features/long_list/presentation/widget/long_list_screen.dart';
import 'package:layout2/features/sing_up/domain/entities/user.dart';
import 'package:layout2/features/core/view_models/bloc/current_user_bloc.dart';

void main() {
  testWidgets('shows "logged out" when user is null', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: BlocProvider<CurrentUserBloc>(
            // initial state should be null => logged out
            create: (_) => CurrentUserBloc(),
            child: const LongListScreen(),
          ),
        ),
      ),
    );

    expect(find.text('logged out'), findsOneWidget);
  });

  testWidgets('shows user email when user is set in bloc', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: BlocProvider<CurrentUserBloc>(
            create: (_) => CurrentUserBloc()
              ..add(
                UserUpdateFromRiverpodProvider(
                  const User(email: 'fake_email.com'),
                ),
              ),
            child: const LongListScreen(),
          ),
        ),
      ),
    );

    await tester.pump();
    expect(find.text('fake_email.com'), findsOneWidget);
  });
}

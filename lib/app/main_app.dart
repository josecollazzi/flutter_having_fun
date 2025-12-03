import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layout2/features/core/view_models/bloc/current_user_bloc.dart';
import 'package:layout2/features/core/view_models/current_user_provider.dart';
import 'package:layout2/routing/router.dart';

class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  ConsumerState createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MainApp> {
  @override
  Widget build(BuildContext context) {
    final router = ref.watch(routerProvider);

    // this listener update the block provider with the current user
    ref.listen(currentUserProvider, (oldValue, newValue) {
      if (newValue.hasValue) {
        context.read<CurrentUserBloc>().add(UserUpdateFromRiverpodProvider(newValue.value));
      }
    });

    return MaterialApp.router(
      title: "Flutter Demo",
      localizationsDelegates: [
        // GlobalWidgetsLocalizations.delegate,
        // GlobalMaterialLocalizations.delegate,
        // AppLocalizationDelegate(),
      ],
      theme: ThemeData(),
      darkTheme: ThemeData(),
      themeMode: ThemeMode.system,
      routerConfig: router,
    );
  }
}
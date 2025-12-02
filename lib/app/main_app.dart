import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
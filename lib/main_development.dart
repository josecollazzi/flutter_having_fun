import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layout2/app/main_app.dart';
import 'package:logging/logging.dart';
import 'app/config/environment/environment_providers.dart';

/// Staging config entry point.
/// Launch with `flutter run --target lib/main_development.dart`.
/// Uses remote data from a server.
void main() {
  Logger.root.level = Level.ALL;
  runApp(ProviderScope(
      overrides: [
        isDevelopment.overrideWithValue(true),
      ],
      child: const MainApp()));
}
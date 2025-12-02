import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layout2/app/main_app.dart';
import 'package:logging/logging.dart';

void main() {
  Logger.root.level = Level.ALL;

  runApp(ProviderScope(child: const MainApp()));
}
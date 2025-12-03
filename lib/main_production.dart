import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layout2/app/main_app.dart';
import 'package:layout2/features/core/view_models/bloc/current_user_bloc.dart';
import 'package:logging/logging.dart';
import 'data/simple_bloc_observer.dart';

void main() {
  Logger.root.level = Level.ALL;
  Bloc.observer = SimpleBlocObserver();
  runApp(
      ProviderScope(
          child: BlocProvider(
          create: (context) => CurrentUserBloc(),
      child: const MainApp())));
}
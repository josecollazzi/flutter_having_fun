import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:layout2/features/sing_up/domain/entities/user.dart';

sealed class UserUpdateEvent {}

final class UserUpdateFromRiverpodProvider extends UserUpdateEvent {
  final User? user;
  UserUpdateFromRiverpodProvider(this.user);
}

class CurrentUserBloc extends Bloc<UserUpdateEvent, User?> {
  CurrentUserBloc() : super(null) {
    on<UserUpdateFromRiverpodProvider> ((event, emit) {
      emit(event.user);
    });
  }
}
import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layout2/features/sing_up/data/repositiories/user_repository.dart';
import 'package:layout2/features/sing_up/data/repositiories/user_repository_db.dart';
import 'package:layout2/features/sing_up/domain/entities/user.dart';

final signUpNotifierProvider = AsyncNotifierProvider<SignUpViewModel, User?>(SignUpViewModel.new);

class SignUpViewModel extends AsyncNotifier<User?> {
  UserRepository get _repository => ref.read(userRepositoryProvider);

  @override
  Future<User?> build() async {
    state = AsyncValue.data(null);
    return null;
  }

  Future<void> signUpUser(String email) async {
    state = AsyncValue.loading();
    var user = await _repository.signUp(email);
    state = AsyncValue.data(user.copyWith());
  }

  Future<void> logout() async {
    state = AsyncValue.data(null);
  }
}
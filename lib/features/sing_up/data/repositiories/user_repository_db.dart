import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layout2/features/sing_up/data/repositiories/user_repository.dart';
import 'package:layout2/features/sing_up/domain/entities/user.dart';

final userRepositoryProvider = Provider.autoDispose<UserRepository>((ref) => UserRepositoryDb());

class UserRepositoryDb extends UserRepository {
  UserRepositoryDb();

  @override
  Future<User> signUp(String email) async {
    await Future.delayed(Duration(seconds: 1));
    return User(email: email);
  }
}
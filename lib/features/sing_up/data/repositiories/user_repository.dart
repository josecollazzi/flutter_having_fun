import 'package:layout2/features/sing_up/domain/entities/user.dart';

abstract class UserRepository {
  Future<User> signUp(String email);
}
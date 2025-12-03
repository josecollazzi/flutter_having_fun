import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    required String email,
  }) = _User;

  factory User.empty() => const User(email: "");

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
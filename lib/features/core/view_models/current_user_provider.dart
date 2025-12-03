import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layout2/features/sing_up/domain/entities/user.dart';
import 'package:layout2/features/sing_up/presentation/view_models/sign_up_view_model.dart';

// this provider is a bit forced, usually will be kind of a wrapper around a third party stream.
// If made by our-self we could here implement token refresh and expose other user information
final currentUserProvider = StreamNotifierProvider<CurrentUserNotifier, User?>(CurrentUserNotifier.new);

class CurrentUserNotifier extends StreamNotifier<User?> {
  @override
  Stream<User?> build() async* {
    final user = await ref.watch(signUpNotifierProvider.future);
    yield user;
  }
}
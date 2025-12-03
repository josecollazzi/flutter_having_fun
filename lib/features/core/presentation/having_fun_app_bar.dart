import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:layout2/features/core/view_models/current_user_provider.dart';
import 'package:layout2/features/sing_up/domain/entities/user.dart';
import 'package:layout2/features/sing_up/presentation/view_models/sign_up_view_model.dart';
import 'package:layout2/routing/routes.dart';


class HavingFunAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final String titleText;

  const HavingFunAppBar({super.key, required this.titleText});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUserAsync = ref.watch(currentUserProvider);

    return AppBar(
      title: Text(titleText),
      actions: currentUserAsync.when(
          data: (user)=> (user == null)? _displayLogedOut(context): _displayLoggedIn(context, user, ref),
          error: (_,__)=> _displayLogedOut(context),
          loading: () => _displayLogedOut(context)),
    );
  }

  List<Widget> _displayLoggedIn(BuildContext context, User? user, WidgetRef ref) {
    return [
      PopupMenuButton<String>(
        icon: const Icon(Icons.more_vert),
        onSelected: (value) async{
          if (value == "home") context.goNamed(Routes.basketName);
          if (value == "long_list") context.goNamed(Routes.longListName);
          if (value == "logout") {
            unawaited(ref.read(signUpNotifierProvider.notifier).logout());
          }
        },
        itemBuilder: (context) => [
          const PopupMenuItem(value: "home", child: Text("Home"),),
          const PopupMenuItem(value: "long_list", child: Text("Long List"),),
          const PopupMenuItem(value: "logout", child: Text("Log Out"),),
        ],
      ),
    ];
  }

  List<Widget> _displayLogedOut(BuildContext context) {
    return [
      PopupMenuButton<String>(
        icon: const Icon(Icons.more_vert),
        onSelected: (value) {
          if (value == "home") context.goNamed(Routes.basketName);
          if (value == "long_list") context.goNamed(Routes.longListName);
          if (value == "sign_up") context.goNamed(Routes.signUpName);
        },
        itemBuilder: (context) => [
          const PopupMenuItem(value: "home", child: Text("Home"),),
          const PopupMenuItem(value: "long_list", child: Text("Long List"),),
          const PopupMenuItem(value: "sign_up", child: Text("Sign Up"),),
        ],
      ),
    ];
  }
}
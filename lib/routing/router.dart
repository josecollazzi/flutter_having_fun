import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:layout2/features/basket/presentation/widgets/basket_screen.dart';
import 'package:layout2/features/layout/presentation/layout_screen.dart';
import 'package:layout2/features/long_list/presentation/widget/long_list_screen_prep.dart';
import 'package:layout2/features/sing_up/presentation/widgets/sign_up_screen.dart';
import 'package:layout2/routing/routes.dart';

final routerProvider = Provider<GoRouter>((ref) => GoRouter(
    initialLocation: Routes.basketPath,
    routes: [
      GoRoute(
        path: Routes.basketPath,
        name: Routes.basketName,
        builder: (context, state) => BasketScreen(),
        routes: [
          GoRoute(
            path: Routes.signUpPath,
            name: Routes.signUpName,
            builder: (context, state) => SignUpScreen(),
          ),
          GoRoute(
            path: Routes.longListPath,
            name: Routes.longListName,
            builder: (context, state) => LongListScreenPrep(),
          ),
          GoRoute(
            path: Routes.layoutPath,
            name: Routes.layoutName,
            builder: (context, state) => LayoutScreen(),
          ),
        ]
      ),
    ])
);


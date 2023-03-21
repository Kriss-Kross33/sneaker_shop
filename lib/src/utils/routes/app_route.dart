import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sneaker_shop/src/ui/ui.dart';
import 'package:sneaker_shop/src/utils/utils.dart';

class AppRouter {
  static GoRouter router = GoRouter(routes: [
    //* splash
    GoRoute(
      path: RouteConst.splashRoute,
      pageBuilder: (context, state) {
        return const MaterialPage(
          child: SplashScreen(),
        );
      },
    ),
    //* home
    GoRoute(
      path: RouteConst.homeRoute,
      pageBuilder: (context, state) {
        return const MaterialPage(
          child: HomeScreen(),
        );
      },
      routes: [
        //* sneaker details
        GoRoute(
          path: RouteConst.sneakerDetailsRoute,
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: HomeScreen(),
            );
          },
        ),
      ],
    ),
  ]);
}

import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_resume_website/features/pages.dart';

import 'app_router.gr.dart';
import 'app_router_guard.dart';

final appRouter = AppRouter(appRouterGuard: AppRouterGuard());

@CustomAutoRouter(
  replaceInRouteName: 'Page,Route,Screen',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: HomePage,
      initial: true,
      guards: [AppRouterGuard],
    ),
    AutoRoute(
      path: '/about',
      page: AboutPage,
      guards: [AppRouterGuard],
    ),
  ],
  customRouteBuilder: customRouteBuilder,
)
class $AppRouter {}

Route<T> customRouteBuilder<T>(
  BuildContext context,
  Widget child,
  CustomPage<T> page,
) {
  return PageRouteBuilder(
    settings: page,
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeScaleTransition(animation: animation, child: child);
    },
  );
}

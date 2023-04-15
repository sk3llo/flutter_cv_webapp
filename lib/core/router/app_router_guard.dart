import 'package:auto_route/auto_route.dart';

class AppRouterGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    if (router.current.name != resolver.route.name) {
      /// do not allow to navigate to the same route
      resolver.next(true);
    } else {
      resolver.next(false);
    }
  }
}

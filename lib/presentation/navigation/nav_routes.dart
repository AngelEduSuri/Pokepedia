sealed class NavRoutes {
  final String route;
  NavRoutes({required this.route});
}

class SplashRoute extends NavRoutes {
  SplashRoute() : super(route: "/splash");
}

class HomeRoute extends NavRoutes {
  HomeRoute() : super(route: "/home");
}


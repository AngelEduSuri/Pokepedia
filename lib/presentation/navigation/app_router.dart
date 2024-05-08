import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokepedia/presentation/navigation/nav_routes.dart';
import 'package:pokepedia/presentation/ui/screens/home/pokepedia_home_screen.dart';

import '../ui/screens/splash/pokepedia_splash_screen.dart';

final GlobalKey<NavigatorState> _parentNavigatorKey =
    GlobalKey<NavigatorState>();

final appRoutes = GoRouter(
  navigatorKey: _parentNavigatorKey,
  initialLocation: SplashRoute().route,
  routes: <RouteBase>[
    GoRoute(
      path: SplashRoute().route,
      builder: (context, state) => const PokepediaSplashScreen(),
    ),
    GoRoute(
      path: HomeRoute().route,
      builder: (context, state) => const PokepediaHomeScreen(),
    ),
  ],
);

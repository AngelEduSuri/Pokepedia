import 'package:flutter/material.dart';
import 'package:pokepedia/presentation/navigation/app_router.dart';
import 'package:pokepedia/presentation/ui/theme/pokepedia_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(
      theme: PokepediaTheme().getTheme(),
      debugShowCheckedModeBanner: false,
      routerConfig: appRoutes,
    );
  }
}

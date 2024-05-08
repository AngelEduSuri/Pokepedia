import 'package:flutter/material.dart';
import 'package:pokepedia/presentation/navigation/app_router.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme(
          primary: Colors.red.shade800,
          onPrimary: Colors.white,
          secondary: Colors.yellow,
          onSecondary: Colors.black,
          error: Colors.red.shade800,
          onError: Colors.white,
          background: const Color(0xFF3C444C),
          onBackground: Colors.white,
          surface: const Color(0xFF3C444C),
          onSurface: Colors.white,
          brightness: Brightness.light,
        ),
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: appRoutes,
    );
  }
}

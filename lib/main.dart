import 'package:flutter/material.dart';
import 'package:pokepedia/presentation/ui/screens/splash/pokepedia_splash_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const PokepediaSplashScreen()
    );
  }
}

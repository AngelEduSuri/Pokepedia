
import 'package:flutter/material.dart';

class PokepediaTheme {

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme(
      primary: const Color(0xFFD81D17),
      onPrimary: Colors.white,
      secondary: const Color(0xFF365C9E),
      onSecondary: Colors.white,
      tertiary: const Color(0xFFFEC91A),
      error: Colors.red.shade800,
      onError: Colors.white,
      background: const Color(0xFF514F56),
      onBackground: Colors.white,
      surface: const Color(0xFF3C444C),
      onSurface: Colors.white,
      brightness: Brightness.light,
    ),
  );
}
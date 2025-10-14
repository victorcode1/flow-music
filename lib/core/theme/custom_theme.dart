import 'package:flutter/material.dart';

class CustomTheme {
  final BuildContext context;
  CustomTheme({required this.context});

  bool get isDark =>
      MediaQuery.of(context).platformBrightness == Brightness.dark;

  ColorScheme get _colorScheme => isDark
      ? const ColorScheme.dark(
          primary: Color(0xFF6200EE),
          secondary: Color(0xFF03DAC6),
          surface: Color(0xFF1E1E1E),
          error: Color(0xFFCF6679),
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          onSurface: Colors.white,
          onError: Colors.black,
        )
      : const ColorScheme.light(
          primary: Color(0xFF6200EE),
          secondary: Color(0xFF03DAC6),
          surface: Colors.white,
          error: Color(0xFFB00020),
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          onSurface: Colors.black,
          onError: Colors.white,
        );

  ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: _colorScheme,
      scaffoldBackgroundColor: _colorScheme.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: _colorScheme.surface,
        foregroundColor: _colorScheme.onSurface,
        elevation: 0,
      ),
      cardTheme: CardThemeData(
        color: _colorScheme.surface,
        elevation: 4,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _colorScheme.primary,
          foregroundColor: _colorScheme.onPrimary,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: _colorScheme.primary,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: isDark ? const Color(0xFF2A2A2A) : Colors.grey[100],
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: _colorScheme.primary, width: 2),
        ),
        labelStyle: TextStyle(color: _colorScheme.onSurface.withOpacity(0.7)),
      ),
      textTheme: TextTheme(
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: _colorScheme.onSurface,
        ),
        headlineMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: _colorScheme.onSurface,
        ),
        titleLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: _colorScheme.onSurface,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: _colorScheme.onSurface,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: _colorScheme.onSurface.withOpacity(0.8),
        ),
      ),
      iconTheme: IconThemeData(
        color: _colorScheme.onSurface,
        size: 24,
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: _colorScheme.primary,
        inactiveTrackColor: _colorScheme.onSurface.withOpacity(0.3),
        thumbColor: _colorScheme.primary,
        overlayColor: _colorScheme.primary.withOpacity(0.2),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: _colorScheme.primary,
      ),
    );
  }
}

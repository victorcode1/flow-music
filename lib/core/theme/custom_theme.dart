import 'package:flutter/material.dart';

class FlowThemeExtras extends ThemeExtension<FlowThemeExtras> {
  final LinearGradient primaryGradient;
  final LinearGradient secondaryGradient;
  final Color glassBackground;
  final Color subtleStroke;

  const FlowThemeExtras({
    required this.primaryGradient,
    required this.secondaryGradient,
    required this.glassBackground,
    required this.subtleStroke,
  });

  @override
  FlowThemeExtras copyWith({
    LinearGradient? primaryGradient,
    LinearGradient? secondaryGradient,
    Color? glassBackground,
    Color? subtleStroke,
  }) {
    return FlowThemeExtras(
      primaryGradient: primaryGradient ?? this.primaryGradient,
      secondaryGradient: secondaryGradient ?? this.secondaryGradient,
      glassBackground: glassBackground ?? this.glassBackground,
      subtleStroke: subtleStroke ?? this.subtleStroke,
    );
  }

  @override
  FlowThemeExtras lerp(ThemeExtension<FlowThemeExtras>? other, double t) {
    if (other is! FlowThemeExtras) {
      return this;
    }

    return FlowThemeExtras(
      primaryGradient:
          LinearGradient.lerp(primaryGradient, other.primaryGradient, t)!,
      secondaryGradient:
          LinearGradient.lerp(secondaryGradient, other.secondaryGradient, t)!,
      glassBackground: Color.lerp(glassBackground, other.glassBackground, t)!,
      subtleStroke: Color.lerp(subtleStroke, other.subtleStroke, t)!,
    );
  }
}

class CustomTheme {
  final BuildContext context;
  CustomTheme({required this.context});

  bool get isDark =>
      MediaQuery.of(context).platformBrightness == Brightness.dark;

  ColorScheme get _colorScheme {
    // Modern blue/teal palette (replaces previous green)
    const primary = Color(0xFF0EA5A4); // teal-500
    const secondary = Color(0xFF0284C7); // blue-600
    final base = ColorScheme.fromSeed(
      seedColor: primary,
      brightness: isDark ? Brightness.dark : Brightness.light,
      secondary: secondary,
      tertiary: const Color(0xFF7F39FB),
    );

    if (isDark) {
      return base.copyWith(
        primary: primary,
        onPrimary: Colors.white,
        secondary: secondary,
        onSecondary: Colors.white,
        surface: const Color(0xFF171717),
        surfaceDim: const Color(0xFF111111),
        surfaceBright: const Color(0xFF1F1F1F),
        surfaceContainerHighest: const Color(0xFF1F1F1F),
        surfaceContainerHigh: const Color(0xFF1C1C1C),
        surfaceContainer: const Color(0xFF191919),
        surfaceContainerLow: const Color(0xFF161616),
        surfaceContainerLowest: const Color(0xFF101010),
        onSurface: Colors.white,
        onSurfaceVariant: const Color(0xFFB8B8B8),
        outline: const Color(0xFF2D2D2D),
        outlineVariant: const Color(0xFF292929),
        surfaceTint: primary,
      );
    }

    return base.copyWith(
      primary: primary,
      onPrimary: Colors.white,
      secondary: secondary,
      onSecondary: Colors.black,
      surface: Colors.white,
      surfaceDim: const Color(0xFFE8EEEC),
      surfaceBright: const Color(0xFFFFFFFF),
      surfaceContainerHighest: const Color(0xFFE9F4EF),
      surfaceContainerHigh: const Color(0xFFF1F6F4),
      surfaceContainer: const Color(0xFFF5FAF8),
      surfaceContainerLow: const Color(0xFFF9FCFB),
      surfaceContainerLowest: const Color(0xFFFFFFFF),
      onSurface: const Color(0xFF111111),
      onSurfaceVariant: const Color(0xFF5F5F5F),
      outline: const Color(0xFFCED6D1),
      outlineVariant: const Color(0xFFE1E6E3),
      surfaceTint: primary,
    );
  }

  ThemeData get theme {
    final extras = isDark
        ? const FlowThemeExtras(
            primaryGradient: LinearGradient(
              colors: [Color(0xFF0EA5A4), Color(0xFF2DD4BF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            secondaryGradient: LinearGradient(
              colors: [Color(0xFF121212), Color(0xFF1E1E1E)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            glassBackground: Color(0x33FFFFFF),
            subtleStroke: Color(0x29FFFFFF),
          )
        : const FlowThemeExtras(
            primaryGradient: LinearGradient(
              colors: [Color(0xFF0EA5A4), Color(0xFF06B6D4)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            secondaryGradient: LinearGradient(
              colors: [Color(0xFFF7FAF9), Color(0xFFE9F4EF)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            glassBackground: Color(0x22000000),
            subtleStroke: Color(0x1A111111),
          );

    final base = ThemeData(
      useMaterial3: true,
      colorScheme: _colorScheme,
      scaffoldBackgroundColor: _colorScheme.surface,
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 52,
          fontWeight: FontWeight.w700,
          letterSpacing: -1.5,
          color: _colorScheme.onSurface,
        ),
        headlineLarge: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.8,
          color: _colorScheme.onSurface,
        ),
        headlineMedium: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.4,
          color: _colorScheme.onSurface,
        ),
        headlineSmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: _colorScheme.onSurface,
        ),
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: _colorScheme.onSurface,
        ),
        titleMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: _colorScheme.onSurface,
        ),
        titleSmall: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: _colorScheme.onSurface,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          height: 1.5,
          color: _colorScheme.onSurface,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          height: 1.5,
          color: _colorScheme.onSurfaceVariant,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          color: _colorScheme.onSurfaceVariant,
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: _colorScheme.onPrimary,
        ),
        labelMedium: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: _colorScheme.onPrimary,
        ),
        labelSmall: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: _colorScheme.onSurfaceVariant,
        ),
      ),
    );

    return base.copyWith(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: _colorScheme.onSurface,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: base.textTheme.titleLarge?.copyWith(
          fontSize: 22,
          letterSpacing: -0.3,
        ),
        toolbarHeight: 76,
      ),
      cardTheme: CardThemeData(
        color: _colorScheme.surface,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: isDark ? 6 : 2,
        shadowColor:
            const Color(0xFF000000).withValues(alpha: isDark ? 0.4 : 0.1),
      ),
      listTileTheme: ListTileThemeData(
        iconColor: _colorScheme.onSurface,
        textColor: _colorScheme.onSurface,
        tileColor: _colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: _colorScheme.surfaceContainerHighest,
        labelStyle: base.textTheme.labelLarge,
        selectedColor: _colorScheme.primary.withValues(alpha: 0.14),
        secondarySelectedColor: _colorScheme.primary,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
      iconTheme: IconThemeData(
        color: _colorScheme.onSurface,
        size: 24,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: _colorScheme.primary,
        foregroundColor: _colorScheme.onPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        elevation: 0,
      ),
      sliderTheme: base.sliderTheme.copyWith(
        activeTrackColor: _colorScheme.primary,
        inactiveTrackColor: _colorScheme.onSurface.withValues(alpha: 0.25),
        thumbColor: _colorScheme.primary,
        trackHeight: 4,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        // slightly cooler background for inputs to match modern palette
        fillColor: isDark ? const Color(0xFF111316) : const Color(0xFFF3FAFB),
        hintStyle: base.textTheme.bodyMedium,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide:
              BorderSide(color: _colorScheme.outline.withValues(alpha: 0.4)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide:
              BorderSide(color: _colorScheme.outline.withValues(alpha: 0.25)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(color: _colorScheme.primary, width: 2.2),
        ),
        prefixIconColor: _colorScheme.onSurfaceVariant,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _colorScheme.primary,
          foregroundColor: _colorScheme.onPrimary,
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          textStyle: base.textTheme.labelLarge,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: _colorScheme.primary,
          textStyle: base.textTheme.labelLarge,
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: _colorScheme.surface,
        contentTextStyle: base.textTheme.bodyMedium?.copyWith(
          color: _colorScheme.onSurface,
        ),
        actionTextColor: _colorScheme.primary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 6,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: _colorScheme.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        elevation: 10,
        titleTextStyle: base.textTheme.headlineSmall,
        contentTextStyle: base.textTheme.bodyLarge,
      ),
      dividerTheme: DividerThemeData(
        color: _colorScheme.outline.withValues(alpha: 0.3),
        space: 1,
      ),
      cardColor: _colorScheme.surface,
      splashColor: _colorScheme.primary.withValues(alpha: 0.12),
      highlightColor: Colors.transparent,
      extensions: [extras],
    );
  }
}

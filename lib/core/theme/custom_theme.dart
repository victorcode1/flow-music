import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      primaryGradient: LinearGradient.lerp(
        primaryGradient,
        other.primaryGradient,
        t,
      )!,
      secondaryGradient: LinearGradient.lerp(
        secondaryGradient,
        other.secondaryGradient,
        t,
      )!,
      glassBackground: Color.lerp(glassBackground, other.glassBackground, t)!,
      subtleStroke: Color.lerp(subtleStroke, other.subtleStroke, t)!,
    );
  }
}

/// Construye los temas light y dark de la app desde una sola fuente de verdad.
///
/// Identidad visual "StreamBeat": un acento de marca configurable (verde por
/// defecto, ver `FlowAccent`) sobre un home claro y limpio y un reproductor
/// inmersivo oscuro. El acento alimenta todo el `ColorScheme` (via
/// `ColorScheme.fromSeed`) y el gradiente firma; las superficies se mantienen
/// neutras para que cualquier acento luzca bien.
///
/// Todas las pantallas deben tomar colores, sombras y gradientes desde
/// `Theme.of(context)` o `theme.extension<FlowThemeExtras>()` — nunca de
/// constantes hardcodeadas como `Colors.black54` o `Color(0xFF...)`, porque
/// eso rompe el modo oscuro y el cambio de acento.
class CustomTheme {
  CustomTheme._();

  /// Acento por defecto (verde esmeralda) cuando no se especifica otro.
  static const Color _defaultAccent = Color(0xFF10B981);

  /// Tema claro de la app con el [accent] dado.
  static ThemeData light([Color accent = _defaultAccent]) =>
      _buildTheme(Brightness.light, accent);

  /// Tema oscuro de la app con el [accent] dado.
  static ThemeData dark([Color accent = _defaultAccent]) =>
      _buildTheme(Brightness.dark, accent);

  /// Aclara (amount > 0) u oscurece (amount < 0) un color hacia blanco/negro.
  static Color _shade(Color base, double amount) {
    return amount >= 0
        ? Color.lerp(base, Colors.white, amount)!
        : Color.lerp(base, Colors.black, -amount)!;
  }

  static ColorScheme _colorScheme(Brightness brightness, Color accent) {
    final isDark = brightness == Brightness.dark;
    // fromSeed deriva secondary/tertiary/contenedores armonicos con el acento.
    final base = ColorScheme.fromSeed(
      seedColor: accent,
      brightness: brightness,
    );

    if (isDark) {
      return base.copyWith(
        primary: accent,
        onPrimary: Colors.white,
        surface: const Color(0xFF141414),
        surfaceDim: const Color(0xFF0E0E0E),
        surfaceBright: const Color(0xFF222222),
        surfaceContainerHighest: const Color(0xFF262626),
        surfaceContainerHigh: const Color(0xFF1F1F1F),
        surfaceContainer: const Color(0xFF1A1A1A),
        surfaceContainerLow: const Color(0xFF161616),
        surfaceContainerLowest: const Color(0xFF0D0D0D),
        onSurface: const Color(0xFFF5F5F5),
        onSurfaceVariant: const Color(0xFFA8A8A8),
        outline: const Color(0xFF2E2E2E),
        outlineVariant: const Color(0xFF272727),
        surfaceTint: accent,
      );
    }

    return base.copyWith(
      primary: accent,
      onPrimary: Colors.white,
      surface: Colors.white,
      surfaceDim: const Color(0xFFECECEE),
      surfaceBright: const Color(0xFFFFFFFF),
      surfaceContainerHighest: const Color(0xFFE9E9EC),
      surfaceContainerHigh: const Color(0xFFF1F1F3),
      surfaceContainer: const Color(0xFFF6F6F8),
      surfaceContainerLow: const Color(0xFFFAFAFB),
      surfaceContainerLowest: const Color(0xFFFFFFFF),
      onSurface: const Color(0xFF121212),
      onSurfaceVariant: const Color(0xFF5F5F66),
      outline: const Color(0xFFD5D5DA),
      outlineVariant: const Color(0xFFE5E5EA),
      surfaceTint: accent,
    );
  }

  static FlowThemeExtras _extras(Brightness brightness, Color accent) {
    // Gradiente firma derivado del acento: una version mas clara fluye hacia
    // una mas oscura del mismo color.
    final primaryGradient = LinearGradient(
      colors: [_shade(accent, 0.18), accent, _shade(accent, -0.22)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    if (brightness == Brightness.dark) {
      return FlowThemeExtras(
        primaryGradient: primaryGradient,
        secondaryGradient: LinearGradient(
          colors: [
            Color.alphaBlend(
              accent.withValues(alpha: 0.16),
              const Color(0xFF111111),
            ),
            const Color(0xFF141414),
            const Color(0xFF0D0D0D),
          ],
          stops: const [0, 0.48, 1],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        glassBackground: const Color(0x33FFFFFF),
        subtleStroke: const Color(0x29FFFFFF),
      );
    }
    return FlowThemeExtras(
      primaryGradient: primaryGradient,
      secondaryGradient: LinearGradient(
        colors: [
          Color.alphaBlend(
            accent.withValues(alpha: 0.07),
            const Color(0xFFFFFFFF),
          ),
          const Color(0xFFFAFAFB),
          const Color(0xFFEDEDF0),
        ],
        stops: const [0, 0.5, 1],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      glassBackground: const Color(0x1F000000),
      subtleStroke: const Color(0x14111111),
    );
  }

  /// Aplica las fuentes del diseno StreamBeat: Plus Jakarta Sans en toda la
  /// escala y Space Grotesk en los titulos display/headline/titleLarge.
  static TextTheme _fontify(TextTheme base) {
    final jakarta = GoogleFonts.plusJakartaSansTextTheme(base);
    return jakarta.copyWith(
      displayLarge: GoogleFonts.spaceGrotesk(textStyle: jakarta.displayLarge),
      headlineLarge: GoogleFonts.spaceGrotesk(textStyle: jakarta.headlineLarge),
      headlineMedium: GoogleFonts.spaceGrotesk(
        textStyle: jakarta.headlineMedium,
      ),
      headlineSmall: GoogleFonts.spaceGrotesk(textStyle: jakarta.headlineSmall),
      titleLarge: GoogleFonts.spaceGrotesk(textStyle: jakarta.titleLarge),
    );
  }

  static ThemeData _buildTheme(Brightness brightness, Color accent) {
    final isDark = brightness == Brightness.dark;
    final colorScheme = _colorScheme(brightness, accent);
    final extras = _extras(brightness, accent);

    final base = ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: Colors.transparent,
      textTheme: _fontify(
        TextTheme(
          displayLarge: TextStyle(
          fontSize: 52,
          fontWeight: FontWeight.w800,
          letterSpacing: -1.8,
          color: colorScheme.onSurface,
        ),
        headlineLarge: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w800,
          letterSpacing: -1.0,
          color: colorScheme.onSurface,
        ),
        headlineMedium: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.6,
          color: colorScheme.onSurface,
        ),
        headlineSmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.3,
          color: colorScheme.onSurface,
        ),
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.2,
          color: colorScheme.onSurface,
        ),
        titleMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: colorScheme.onSurface,
        ),
        titleSmall: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: colorScheme.onSurface,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          height: 1.5,
          color: colorScheme.onSurface,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          height: 1.5,
          color: colorScheme.onSurfaceVariant,
        ),
        bodySmall: TextStyle(fontSize: 12, color: colorScheme.onSurfaceVariant),
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.1,
          color: colorScheme.onPrimary,
        ),
        labelMedium: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: colorScheme.onPrimary,
        ),
        labelSmall: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: colorScheme.onSurfaceVariant,
        ),
        ),
      ),
    );

    return base.copyWith(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: base.textTheme.titleLarge?.copyWith(
          fontSize: 22,
          letterSpacing: -0.4,
          fontWeight: FontWeight.w800,
        ),
        toolbarHeight: 76,
      ),
      cardTheme: CardThemeData(
        color: colorScheme.surfaceContainer,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        elevation: isDark ? 0 : 1,
        shadowColor: colorScheme.scrim.withValues(alpha: isDark ? 0.5 : 0.12),
      ),
      listTileTheme: ListTileThemeData(
        iconColor: colorScheme.onSurface,
        textColor: colorScheme.onSurface,
        tileColor: colorScheme.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 12,
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: colorScheme.surfaceContainerHighest,
        labelStyle: base.textTheme.labelLarge?.copyWith(
          color: colorScheme.onSurface,
        ),
        selectedColor: colorScheme.primary.withValues(alpha: 0.16),
        secondarySelectedColor: colorScheme.primary,
        side: BorderSide(color: colorScheme.outlineVariant),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
      iconTheme: IconThemeData(color: colorScheme.onSurface, size: 24),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 0,
        highlightElevation: 0,
      ),
      sliderTheme: base.sliderTheme.copyWith(
        activeTrackColor: colorScheme.primary,
        inactiveTrackColor: colorScheme.onSurface.withValues(alpha: 0.18),
        thumbColor: colorScheme.primary,
        overlayColor: colorScheme.primary.withValues(alpha: 0.16),
        trackHeight: 4,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: colorScheme.primary,
        linearTrackColor: colorScheme.onSurface.withValues(alpha: 0.12),
        circularTrackColor: Colors.transparent,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: isDark
            ? colorScheme.surfaceContainerHigh
            : colorScheme.surfaceContainer,
        hintStyle: base.textTheme.bodyMedium,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(
            color: colorScheme.outline.withValues(alpha: 0.4),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(
            color: colorScheme.outline.withValues(alpha: 0.25),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(color: colorScheme.primary, width: 2.2),
        ),
        prefixIconColor: colorScheme.onSurfaceVariant,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          textStyle: base.textTheme.labelLarge,
          elevation: 0,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          textStyle: base.textTheme.labelLarge,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.primary,
          textStyle: base.textTheme.labelLarge,
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: isDark
            ? colorScheme.surfaceContainerHigh
            : colorScheme.inverseSurface,
        contentTextStyle: base.textTheme.bodyMedium?.copyWith(
          color: isDark ? colorScheme.onSurface : colorScheme.onInverseSurface,
        ),
        actionTextColor: colorScheme.primary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        elevation: 6,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: colorScheme.surfaceContainer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        elevation: 10,
        titleTextStyle: base.textTheme.headlineSmall,
        contentTextStyle: base.textTheme.bodyLarge,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colorScheme.surfaceContainer,
        modalBackgroundColor: colorScheme.surfaceContainer,
        surfaceTintColor: Colors.transparent,
        showDragHandle: true,
        dragHandleColor: colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
      ),
      popupMenuTheme: PopupMenuThemeData(
        color: colorScheme.surfaceContainerHigh,
        surfaceTintColor: Colors.transparent,
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
      dividerTheme: DividerThemeData(
        color: colorScheme.outline.withValues(alpha: 0.3),
        space: 1,
      ),
      cardColor: colorScheme.surfaceContainer,
      splashColor: colorScheme.primary.withValues(alpha: 0.12),
      highlightColor: Colors.transparent,
      extensions: [extras],
    );
  }
}

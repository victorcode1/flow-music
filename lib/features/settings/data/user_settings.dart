/// DTO de los ajustes locales de la aplicación.
class UserSettings {
  const UserSettings({
    this.themeMode,
    this.locale,
    this.autoplayEnabled,
    this.accentColor,
    this.updatedAtMs,
  });

  factory UserSettings.fromJson(Map<String, dynamic> json) {
    return UserSettings(
      themeMode: json['themeMode'] as String?,
      locale: json['locale'] as String?,
      autoplayEnabled: json['autoplayEnabled'] as bool?,
      accentColor: json['accentColor'] as String?,
      updatedAtMs: (json['updatedAtMs'] as num?)?.toInt(),
    );
  }

  /// `system` | `light` | `dark`.
  final String? themeMode;

  /// Etiqueta BCP-47 del idioma activo, p.ej. `es`, `en` o `pt-BR`.
  final String? locale;

  final bool? autoplayEnabled;

  final String? accentColor;

  /// Marca de tiempo en ms desde epoch del momento en que se guardo este
  /// ajuste. Se usa para resolver conflictos remoto/local.
  final int? updatedAtMs;

  bool get isEmpty {
    return themeMode == null &&
        locale == null &&
        autoplayEnabled == null &&
        accentColor == null;
  }

  Map<String, dynamic> toJson() {
    return {
      if (themeMode != null) 'themeMode': themeMode,
      if (locale != null) 'locale': locale,
      if (autoplayEnabled != null) 'autoplayEnabled': autoplayEnabled,
      if (accentColor != null) 'accentColor': accentColor,
      'updatedAtMs': updatedAtMs ?? DateTime.now().millisecondsSinceEpoch,
    };
  }

  UserSettings copyWith({
    String? themeMode,
    String? locale,
    bool? autoplayEnabled,
    String? accentColor,
    int? updatedAtMs,
  }) {
    return UserSettings(
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
      autoplayEnabled: autoplayEnabled ?? this.autoplayEnabled,
      accentColor: accentColor ?? this.accentColor,
      updatedAtMs: updatedAtMs ?? this.updatedAtMs,
    );
  }
}

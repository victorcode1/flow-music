/// DTO de los ajustes locales de la aplicación.
class UserSettings {
  const UserSettings({
    this.themeMode,
    this.locale,
    this.autoplayEnabled,
    this.smoothTransitions,
    this.updatedAtMs,
  });

  factory UserSettings.fromJson(Map<String, dynamic> json) {
    return UserSettings(
      themeMode: json['themeMode'] as String?,
      locale: json['locale'] as String?,
      autoplayEnabled: json['autoplayEnabled'] as bool?,
      smoothTransitions: json['smoothTransitions'] as bool?,
      updatedAtMs: (json['updatedAtMs'] as num?)?.toInt(),
    );
  }

  /// `system` | `light` | `dark`.
  final String? themeMode;

  /// Codigo ISO del idioma activo, p.ej. `es` o `en`.
  final String? locale;

  final bool? autoplayEnabled;
  final bool? smoothTransitions;

  /// Marca de tiempo en ms desde epoch del momento en que se guardo este
  /// ajuste. Se usa para resolver conflictos remoto/local.
  final int? updatedAtMs;

  bool get isEmpty {
    return themeMode == null &&
        locale == null &&
        autoplayEnabled == null &&
        smoothTransitions == null;
  }

  Map<String, dynamic> toJson() {
    return {
      if (themeMode != null) 'themeMode': themeMode,
      if (locale != null) 'locale': locale,
      if (autoplayEnabled != null) 'autoplayEnabled': autoplayEnabled,
      if (smoothTransitions != null) 'smoothTransitions': smoothTransitions,
      'updatedAtMs': updatedAtMs ?? DateTime.now().millisecondsSinceEpoch,
    };
  }

  UserSettings copyWith({
    String? themeMode,
    String? locale,
    bool? autoplayEnabled,
    bool? smoothTransitions,
    int? updatedAtMs,
  }) {
    return UserSettings(
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
      autoplayEnabled: autoplayEnabled ?? this.autoplayEnabled,
      smoothTransitions: smoothTransitions ?? this.smoothTransitions,
      updatedAtMs: updatedAtMs ?? this.updatedAtMs,
    );
  }
}

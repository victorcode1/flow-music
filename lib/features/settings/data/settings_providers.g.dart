// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(settingsSync)
final settingsSyncProvider = SettingsSyncProvider._();

final class SettingsSyncProvider
    extends $FunctionalProvider<SettingsSync, SettingsSync, SettingsSync>
    with $Provider<SettingsSync> {
  SettingsSyncProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingsSyncProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingsSyncHash();

  @$internal
  @override
  $ProviderElement<SettingsSync> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SettingsSync create(Ref ref) {
    return settingsSync(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SettingsSync value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SettingsSync>(value),
    );
  }
}

String _$settingsSyncHash() => r'e3478d23da26ff50f86194cb5ab1a160956c810e';

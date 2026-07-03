import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/sync/cloud_sync_controller.dart';
import 'package:flow_music/features/settings/data/settings_local_data_source.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Aplica los ajustes que necesitan `BuildContext` (idioma de
/// easy_localization) cuando el ciclo de sincronizacion completa un pull
/// remoto. Vive bajo `MaterialApp`, asi que tiene acceso a un context con
/// la localizacion ya cargada.
class CloudSyncWatcher extends ConsumerWidget {
  const CloudSyncWatcher({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<CloudSyncState>(cloudSyncControllerProvider, (prev, next) {
      if (next is! CloudSyncDone) return;
      final stored = const SettingsLocalDataSource().read().locale;
      final targetLocale = stored == null || stored.isEmpty
          ? const Locale('en')
          : Locale(stored);
      if (context.locale.languageCode == targetLocale.languageCode) return;
      // El pull ya escribio el locale en Hive; basta con avisarle a
      // easy_localization para que rebuilds usen el nuevo idioma.
      Future.microtask(() {
        if (context.mounted) {
          context.setLocale(targetLocale);
        }
      });
    });
    return child;
  }
}

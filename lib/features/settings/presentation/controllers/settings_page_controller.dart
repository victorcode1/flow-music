import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flow_music/features/settings/data/settings_local_data_source.dart';
import 'package:flow_music/features/settings/presentation/controllers/audio_download_quality_controller.dart';
import 'package:flow_music/features/song/presentation/controllers/song_controller.dart';
import 'package:flow_music/features/storage/presentation/controllers/storage_usage_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Helpers y acciones de presentacion para la pantalla de ajustes.
class SettingsPageController {
  const SettingsPageController();

  String languageName(String languageCode) {
    return switch (languageCode) {
      'es' => LocaleKeys.spanish.tr(),
      _ => LocaleKeys.english.tr(),
    };
  }

  String themeModeLabel(ThemeMode mode) {
    return switch (mode) {
      ThemeMode.light => LocaleKeys.theme_mode_light.tr(),
      ThemeMode.dark => LocaleKeys.theme_mode_dark.tr(),
      ThemeMode.system => LocaleKeys.theme_mode_system.tr(),
    };
  }

  String audioQualityLabel(AudioDownloadQuality quality) {
    return switch (quality) {
      AudioDownloadQuality.high => LocaleKeys.audio_quality_high.tr(),
      AudioDownloadQuality.medium => LocaleKeys.audio_quality_medium.tr(),
      AudioDownloadQuality.low => LocaleKeys.audio_quality_low.tr(),
    };
  }

  String playbackModeLabel(PlaybackMode mode) {
    return switch (mode) {
      PlaybackMode.audio => LocaleKeys.audio.tr(),
      PlaybackMode.video => LocaleKeys.video.tr(),
    };
  }

  IconData themeModeIcon(ThemeMode mode) {
    return switch (mode) {
      ThemeMode.light => Icons.light_mode_rounded,
      ThemeMode.dark => Icons.dark_mode_rounded,
      ThemeMode.system => Icons.brightness_auto_rounded,
    };
  }

  Future<void> persistLocale(
    BuildContext context,
    WidgetRef ref,
    String languageCode,
  ) async {
    await context.setLocale(Locale(languageCode));
    final stored = const SettingsLocalDataSource().read();
    await const SettingsLocalDataSource().write(
      stored.copyWith(
        locale: languageCode,
        updatedAtMs: DateTime.now().millisecondsSinceEpoch,
      ),
    );
  }

  Future<void> showStorageManager(BuildContext context, WidgetRef ref) async {
    ref.invalidate(storageUsageControllerProvider);
    await showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (context) {
        return Consumer(
          builder: (context, ref, _) {
            final usage = ref.watch(storageUsageControllerProvider);
            final controller = ref.read(
              storageUsageControllerProvider.notifier,
            );
            final theme = Theme.of(context);
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: usage.when(
                  loading: () => const SizedBox(
                    height: 180,
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  error: (_, _) => SizedBox(
                    height: 180,
                    child: Center(child: Text(LocaleKeys.error.tr())),
                  ),
                  data: (data) => Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LocaleKeys.storage_manager.tr(),
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: const Icon(Icons.download_done_rounded),
                        title: Text(LocaleKeys.downloaded_files.tr()),
                        subtitle: Text(
                          '${data.downloadCount} · ${formatBytes(data.downloadBytes)}',
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: const Icon(Icons.offline_bolt_rounded),
                        title: Text(LocaleKeys.offline_library.tr()),
                        subtitle: Text(
                          '${data.offlineCount} · ${formatBytes(data.offlineBytes)}',
                        ),
                        trailing: TextButton(
                          onPressed: data.offlineBytes == 0
                              ? null
                              : controller.clearOffline,
                          child: Text(LocaleKeys.clear.tr()),
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: const Icon(Icons.cached_rounded),
                        title: Text(LocaleKeys.autoplay_cache.tr()),
                        subtitle: Text(formatBytes(data.cacheBytes)),
                        trailing: TextButton(
                          onPressed: data.cacheBytes == 0
                              ? null
                              : controller.clearCache,
                          child: Text(LocaleKeys.clear.tr()),
                        ),
                      ),
                      const Divider(),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: const Icon(Icons.sd_storage_rounded),
                        title: Text(LocaleKeys.total_storage.tr()),
                        subtitle: Text(formatBytes(data.totalBytes)),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  String formatBytes(int bytes) {
    if (bytes <= 0) return '0 B';
    const units = ['B', 'KB', 'MB', 'GB', 'TB'];
    var size = bytes.toDouble();
    var unit = 0;
    while (size >= 1024 && unit < units.length - 1) {
      size /= 1024;
      unit++;
    }
    final formatted = size >= 100 || unit == 0
        ? size.toStringAsFixed(0)
        : size.toStringAsFixed(1);
    return '$formatted ${units[unit]}';
  }
}

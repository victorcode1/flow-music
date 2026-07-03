import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flow_music/features/favorites/data/favorite_song.dart';
import 'package:flow_music/features/favorites/presentation/controllers/favorites_controller.dart';
import 'package:flow_music/features/history/data/playback_history_entry.dart';
import 'package:flow_music/features/history/presentation/controllers/playback_history_controller.dart';
import 'package:flow_music/features/library/data/downloaded_audio.dart';
import 'package:flow_music/features/library/presentation/widgets/downloaded_file_actions.dart';
import 'package:flow_music/features/library/presentation/widgets/import_playlist_dialog.dart';
import 'package:flow_music/features/offline/data/offline_audio_store_stub.dart'
    if (dart.library.io) 'package:flow_music/features/offline/data/offline_audio_store_io.dart';
import 'package:flow_music/features/playlists/data/playlist.dart';
import 'package:flow_music/features/playlists/presentation/controllers/playlists_controller.dart';
import 'package:flow_music/features/playlists/presentation/widgets/playlist_actions.dart';
import 'package:flow_music/features/radio/data/models/radio_playlist.dart';
import 'package:flow_music/features/radio/data/models/radio_station.dart';
import 'package:flow_music/features/song/presentation/controllers/audio_download_writer_stub.dart'
    if (dart.library.io) 'package:flow_music/features/song/presentation/controllers/audio_download_writer_io.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_plus/share_plus.dart';

class LibraryPageData {
  const LibraryPageData({required this.downloads, required this.offlineAudios});

  final List<DownloadedAudio> downloads;
  final List<DownloadedAudio> offlineAudios;

  static const empty = LibraryPageData(downloads: [], offlineAudios: []);
}

enum SmartPlaylistKind { downloaded, favorites, mostPlayed }

class LibraryPageController {
  const LibraryPageController();

  Future<LibraryPageData> loadLibraryData() async {
    final downloads = await listDownloadedAudios();
    final offlineAudios = await listOfflineAudios();
    return LibraryPageData(downloads: downloads, offlineAudios: offlineAudios);
  }

  List<Playlist> filterPlaylists(List<Playlist> playlists, String rawQuery) {
    final query = _normalizeQuery(rawQuery);
    if (query.isEmpty) return playlists;
    return playlists
        .where((playlist) => playlist.name.toLowerCase().contains(query))
        .toList();
  }

  List<DownloadedAudio> filterAudios(
    List<DownloadedAudio> audios,
    String rawQuery,
  ) {
    final query = _normalizeQuery(rawQuery);
    if (query.isEmpty) return audios;
    return audios
        .where(
          (audio) =>
              audio.title.toLowerCase().contains(query) ||
              audio.author.toLowerCase().contains(query),
        )
        .toList();
  }

  List<RadioStation> filterRadioFavorites(
    List<RadioStation> stations,
    String rawQuery,
  ) {
    final query = _normalizeQuery(rawQuery);
    if (query.isEmpty) return stations;
    return stations
        .where(
          (station) =>
              station.name.toLowerCase().contains(query) ||
              station.country.toLowerCase().contains(query),
        )
        .toList();
  }

  List<RadioPlaylist> filterRadioPlaylists(
    List<RadioPlaylist> playlists,
    String rawQuery,
  ) {
    final query = _normalizeQuery(rawQuery);
    if (query.isEmpty) return playlists;
    return playlists
        .where((playlist) => playlist.name.toLowerCase().contains(query))
        .toList();
  }

  Future<void> createPlaylist({
    required BuildContext context,
    required WidgetRef ref,
    DownloadedAudio? firstAudio,
  }) {
    return showCreatePlaylistFlow(
      context: context,
      ref: ref,
      firstAudio: firstAudio,
    );
  }

  Future<void> createSmartPlaylist({
    required BuildContext context,
    required WidgetRef ref,
    required SmartPlaylistKind kind,
  }) async {
    final downloads = await listDownloadedAudios();
    final favorites = ref.read(favoritesControllerProvider);
    final history = ref.read(playbackHistoryControllerProvider);
    final controller = ref.read(playlistsControllerProvider.notifier);

    final List<DownloadedAudio> audioItems;
    switch (kind) {
      case SmartPlaylistKind.downloaded:
        audioItems = downloads;
      case SmartPlaylistKind.favorites:
        audioItems = favorites.map(favoriteToAudio).toList();
      case SmartPlaylistKind.mostPlayed:
        final mostPlayed =
            history
                .where((entry) => entry.kind == PlaybackHistoryKind.song)
                .toList()
              ..sort((a, b) => b.playCount.compareTo(a.playCount));
        audioItems = mostPlayed.map(historyToAudio).toList();
    }

    if (audioItems.isEmpty || !context.mounted) return;

    final name = switch (kind) {
      SmartPlaylistKind.downloaded => LocaleKeys.smart_downloaded.tr(),
      SmartPlaylistKind.favorites => LocaleKeys.smart_favorites.tr(),
      SmartPlaylistKind.mostPlayed => LocaleKeys.smart_most_played.tr(),
    };

    await controller.createWithItems(name, audioItems);
    if (!context.mounted) return;
    ScaffoldMessenger.maybeOf(
      context,
    )?.showSnackBar(SnackBar(content: Text(LocaleKeys.playlist_created.tr())));
  }

  Future<void> importPlaylist({
    required BuildContext context,
    required WidgetRef ref,
  }) async {
    final raw = await showDialog<String>(
      context: context,
      builder: (context) => const ImportPlaylistDialog(),
    );
    if (raw == null || raw.trim().isEmpty) return;

    final playlist = await ref
        .read(playlistsControllerProvider.notifier)
        .importFromJson(raw);
    if (!context.mounted) return;
    ScaffoldMessenger.maybeOf(context)?.showSnackBar(
      SnackBar(
        content: Text(
          playlist == null
              ? LocaleKeys.import_playlist_error.tr()
              : LocaleKeys.playlist_created.tr(),
        ),
      ),
    );
  }

  Future<void> showAddToPlaylist({
    required BuildContext context,
    required WidgetRef ref,
    required DownloadedAudio audio,
  }) {
    return showAddToPlaylistFlow(context: context, ref: ref, audio: audio);
  }

  Future<void> shareAudio({
    required BuildContext context,
    required DownloadedAudio audio,
  }) {
    return shareDownloadedFile(context: context, audio: audio);
  }

  Future<void> showFileLocation({
    required BuildContext context,
    required DownloadedAudio audio,
  }) async {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final info = kIsWeb
        ? const DownloadedFileInfo(exists: false, sizeBytes: 0)
        : await getDownloadedFileInfo(audio);
    final sizeLabel = info.exists
        ? formatDownloadedFileSize(info.sizeBytes)
        : null;
    final fileExists = info.exists;

    if (!context.mounted) return;

    await showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text(LocaleKeys.file_location.tr()),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText(
                audio.filePath.isEmpty
                    ? LocaleKeys.file_not_found.tr()
                    : audio.filePath,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
              if (sizeLabel != null) ...[
                const SizedBox(height: 12),
                Text(
                  '${LocaleKeys.file_size.tr()}: $sizeLabel',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
                ),
              ],
              if (!fileExists && audio.filePath.isNotEmpty) ...[
                const SizedBox(height: 12),
                Text(
                  LocaleKeys.file_not_found.tr(),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colors.error,
                  ),
                ),
              ],
            ],
          ),
          actions: [
            if (audio.filePath.isNotEmpty)
              TextButton.icon(
                onPressed: () async {
                  await Clipboard.setData(ClipboardData(text: audio.filePath));
                  if (!dialogContext.mounted) return;
                  ScaffoldMessenger.of(dialogContext).showSnackBar(
                    SnackBar(content: Text(LocaleKeys.path_copied.tr())),
                  );
                },
                icon: const Icon(Icons.copy_rounded),
                label: Text(LocaleKeys.copy_path.tr()),
              ),
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: Text(LocaleKeys.close.tr()),
            ),
          ],
        );
      },
    );
  }

  Future<void> confirmDelete({
    required BuildContext context,
    required DownloadedAudio audio,
    required Future<void> Function() onDeleted,
  }) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text(LocaleKeys.confirm_delete_download_title.tr()),
          content: Text(LocaleKeys.confirm_delete_download_message.tr()),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: Text(LocaleKeys.cancel.tr()),
            ),
            FilledButton.tonal(
              style: FilledButton.styleFrom(
                foregroundColor: Theme.of(
                  dialogContext,
                ).colorScheme.onErrorContainer,
                backgroundColor: Theme.of(
                  dialogContext,
                ).colorScheme.errorContainer,
              ),
              onPressed: () => Navigator.of(dialogContext).pop(true),
              child: Text(LocaleKeys.delete.tr()),
            ),
          ],
        );
      },
    );

    if (confirmed != true || !context.mounted) return;

    final messenger = ScaffoldMessenger.of(context);
    try {
      final deleted = await deleteDownloadedAudio(audio);
      if (!context.mounted) return;
      messenger.showSnackBar(
        SnackBar(
          content: Text(
            deleted
                ? LocaleKeys.download_deleted.tr()
                : LocaleKeys.download_delete_error.tr(),
          ),
        ),
      );
      if (deleted) {
        await onDeleted();
      }
    } catch (_) {
      if (!context.mounted) return;
      messenger.showSnackBar(
        SnackBar(content: Text(LocaleKeys.download_delete_error.tr())),
      );
    }
  }

  Future<void> confirmDeleteOffline({
    required BuildContext context,
    required DownloadedAudio audio,
    required Future<void> Function() onDeleted,
  }) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text(LocaleKeys.confirm_delete_offline_title.tr()),
          content: Text(LocaleKeys.confirm_delete_offline_message.tr()),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: Text(LocaleKeys.cancel.tr()),
            ),
            FilledButton.tonal(
              style: FilledButton.styleFrom(
                foregroundColor: Theme.of(
                  dialogContext,
                ).colorScheme.onErrorContainer,
                backgroundColor: Theme.of(
                  dialogContext,
                ).colorScheme.errorContainer,
              ),
              onPressed: () => Navigator.of(dialogContext).pop(true),
              child: Text(LocaleKeys.delete.tr()),
            ),
          ],
        );
      },
    );

    if (confirmed != true || !context.mounted) return;

    final deleted = await deleteOfflineAudio(audio);
    if (!context.mounted) return;
    ScaffoldMessenger.maybeOf(context)?.showSnackBar(
      SnackBar(
        content: Text(
          deleted
              ? LocaleKeys.offline_removed.tr()
              : LocaleKeys.download_delete_error.tr(),
        ),
      ),
    );
    if (deleted) await onDeleted();
  }

  Future<void> sharePlaylist(Playlist playlist) {
    return SharePlus.instance.share(
      ShareParams(subject: playlist.name, text: jsonEncode(playlist.toJson())),
    );
  }

  DownloadedAudio favoriteToAudio(FavoriteSong favorite) {
    return DownloadedAudio(
      videoId: favorite.videoId,
      title: favorite.title,
      author: favorite.author,
      thumbnailUrl: favorite.thumbnailUrl,
      filePath: '',
      downloadedAt: favorite.addedAt,
    );
  }

  DownloadedAudio historyToAudio(PlaybackHistoryEntry entry) {
    return DownloadedAudio(
      videoId: entry.id,
      title: entry.title,
      author: entry.subtitle,
      thumbnailUrl: entry.thumbnailUrl,
      filePath: '',
      downloadedAt: entry.playedAt,
    );
  }

  String radioStationKey(RadioStation station) {
    if (station.stationUuid.isNotEmpty) return station.stationUuid;
    return station.streamUrl;
  }

  String mediaTypeLabel(DownloadedAudio audio) {
    if (audio.filePath.isEmpty) {
      return audio.isVideo ? LocaleKeys.video.tr() : LocaleKeys.audio.tr();
    }
    return audio.isVideo
        ? LocaleKeys.downloaded_video.tr()
        : LocaleKeys.downloaded_audio.tr();
  }

  Playlist? findPlaylist(List<Playlist> playlists, String playlistId) {
    for (final playlist in playlists) {
      if (playlist.id == playlistId) return playlist;
    }
    return null;
  }

  String _normalizeQuery(String rawQuery) => rawQuery.trim().toLowerCase();
}

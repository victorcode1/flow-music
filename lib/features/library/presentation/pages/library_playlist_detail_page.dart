import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flow_music/features/library/data/downloaded_audio.dart';
import 'package:flow_music/features/library/presentation/controllers/library_page_controller.dart';
import 'package:flow_music/features/library/presentation/pages/downloaded_audio_player_page.dart';
import 'package:flow_music/features/library/presentation/widgets/library_downloaded_audio_tile.dart';
import 'package:flow_music/features/library/presentation/widgets/library_empty_card.dart';
import 'package:flow_music/features/playlists/presentation/controllers/playlists_controller.dart';
import 'package:flow_music/features/playlists/presentation/widgets/playlist_actions.dart';
import 'package:flow_music/features/song/presentation/controllers/song_controller.dart';
import 'package:flow_music/features/song/presentation/pages/song.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LibraryPlaylistDetailPage extends ConsumerWidget {
  const LibraryPlaylistDetailPage({
    super.key,
    required this.playlistId,
    this.pageController = const LibraryPageController(),
  });

  final String playlistId;
  final LibraryPageController pageController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final playlists = ref.watch(playlistsControllerProvider);
    final playlist = pageController.findPlaylist(playlists, playlistId);

    if (playlist == null) {
      return const Scaffold(body: SizedBox());
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          playlist.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          IconButton(
            tooltip: LocaleKeys.share.tr(),
            onPressed: () => pageController.sharePlaylist(playlist),
            icon: const Icon(Icons.ios_share_rounded),
          ),
          IconButton(
            tooltip: MaterialLocalizations.of(context).deleteButtonTooltip,
            onPressed: () async {
              await ref
                  .read(playlistsControllerProvider.notifier)
                  .delete(playlist.id);
              if (context.mounted) Navigator.of(context).pop();
            },
            icon: const Icon(Icons.delete_outline_rounded),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        children: [
          Text(
            songCountLabel(playlist.itemCount),
            style: theme.textTheme.bodyLarge?.copyWith(
              color: colors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 16),
          if (playlist.items.isEmpty)
            LibraryEmptyCard(
              icon: Icons.queue_music_rounded,
              message: LocaleKeys.empty_playlist.tr(),
              colors: colors,
              minHeight: 220,
            )
          else
            ...playlist.items.map(
              (audio) => Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: _PlaylistAudioTile(
                  audio: audio,
                  pageController: pageController,
                  onRemove: () => ref
                      .read(playlistsControllerProvider.notifier)
                      .removeItem(playlist.id, audio),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _PlaylistAudioTile extends ConsumerWidget {
  const _PlaylistAudioTile({
    required this.audio,
    required this.pageController,
    required this.onRemove,
  });

  final DownloadedAudio audio;
  final LibraryPageController pageController;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      key: ValueKey('playlist-audio-${_playlistItemKey(audio)}'),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onRemove(),
      background: Builder(
        builder: (context) {
          final colors = Theme.of(context).colorScheme;
          return Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: colors.errorContainer,
            ),
            child: Icon(
              Icons.delete_outline_rounded,
              color: colors.onErrorContainer,
            ),
          );
        },
      ),
      child: LibraryDownloadedAudioTile(
        audio: audio,
        onTap: () => _openPlaylistItem(context, ref, audio),
        fallbackSubtitle: pageController.mediaTypeLabel(audio),
      ),
    );
  }

  String _playlistItemKey(DownloadedAudio audio) {
    if (audio.videoId.isNotEmpty) {
      return '${audio.mediaType.name}:${audio.videoId}';
    }
    return '${audio.mediaType.name}:${audio.filePath}';
  }

  void _openPlaylistItem(
    BuildContext context,
    WidgetRef ref,
    DownloadedAudio audio,
  ) {
    if (audio.filePath.isNotEmpty) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => DownloadedAudioPlayerPage(downloadedAudio: audio),
        ),
      );
      return;
    }

    if (audio.videoId.isEmpty) return;
    // Precargamos titulo/autor/miniatura para que el app bar standalone los
    // muestre de inmediato, en lugar de quedar vacio hasta que resuelva la red.
    ref
        .read(songController)
        .preloadMetadata(
          videoId: audio.videoId,
          title: audio.title,
          author: audio.author,
          thumbnailUrl: audio.thumbnailUrl,
        );
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => SongWidget(
          standalone: true,
          data: {
            'idSong': audio.videoId,
            'playListId': '',
            'mediaType': audio.mediaType.name,
          },
        ),
      ),
    );
  }
}

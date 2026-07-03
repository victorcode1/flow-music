import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/theme/custom_theme.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flow_music/features/library/data/downloaded_audio.dart';
import 'package:flutter/material.dart';

class LibraryDownloadedAudioTile extends StatelessWidget {
  const LibraryDownloadedAudioTile({
    super.key,
    required this.audio,
    required this.onTap,
    this.subtitle,
    this.fallbackSubtitle,
    this.deleteLabel,
    this.onAddToPlaylist,
    this.onShare,
    this.onShowLocation,
    this.onDelete,
  });

  final DownloadedAudio audio;
  final VoidCallback onTap;
  final String? subtitle;
  final String? fallbackSubtitle;
  final String? deleteLabel;
  final VoidCallback? onAddToPlaylist;
  final VoidCallback? onShare;
  final VoidCallback? onShowLocation;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final extras = theme.extension<FlowThemeExtras>();
    final hasMenu =
        onAddToPlaylist != null ||
        onShare != null ||
        onShowLocation != null ||
        onDelete != null;

    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: colors.surface,
          border: Border.all(color: extras?.subtleStroke ?? colors.outline),
        ),
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: SizedBox.square(
                dimension: 58,
                child: audio.thumbnailUrl.isEmpty
                    ? _AudioPlaceholder(colors: colors)
                    : Image.network(
                        audio.thumbnailUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (_, _, _) {
                          return _AudioPlaceholder(colors: colors);
                        },
                      ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    audio.title.isEmpty ? LocaleKeys.audio.tr() : audio.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    subtitle ??
                        (audio.author.isEmpty
                            ? (fallbackSubtitle ?? '')
                            : audio.author),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colors.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            if (hasMenu) ...[
              PopupMenuButton<_DownloadAction>(
                tooltip: LocaleKeys.menu.tr(),
                icon: Icon(
                  Icons.more_vert_rounded,
                  color: colors.onSurfaceVariant,
                ),
                onSelected: (action) {
                  switch (action) {
                    case _DownloadAction.addToPlaylist:
                      onAddToPlaylist?.call();
                    case _DownloadAction.share:
                      onShare?.call();
                    case _DownloadAction.showLocation:
                      onShowLocation?.call();
                    case _DownloadAction.delete:
                      onDelete?.call();
                  }
                },
                itemBuilder: (context) => [
                  if (onAddToPlaylist != null)
                    PopupMenuItem(
                      value: _DownloadAction.addToPlaylist,
                      child: Row(
                        children: [
                          Icon(
                            Icons.playlist_add_rounded,
                            color: colors.primary,
                          ),
                          const SizedBox(width: 12),
                          Text(LocaleKeys.add_to_playlist.tr()),
                        ],
                      ),
                    ),
                  if (onShare != null)
                    PopupMenuItem(
                      value: _DownloadAction.share,
                      child: Row(
                        children: [
                          Icon(Icons.ios_share_rounded, color: colors.primary),
                          const SizedBox(width: 12),
                          Text(LocaleKeys.share.tr()),
                        ],
                      ),
                    ),
                  if (onShowLocation != null)
                    PopupMenuItem(
                      value: _DownloadAction.showLocation,
                      child: Row(
                        children: [
                          Icon(
                            Icons.folder_open_rounded,
                            color: colors.primary,
                          ),
                          const SizedBox(width: 12),
                          Text(LocaleKeys.view_file_location.tr()),
                        ],
                      ),
                    ),
                  if (onDelete != null) ...[
                    const PopupMenuDivider(),
                    PopupMenuItem(
                      value: _DownloadAction.delete,
                      child: Row(
                        children: [
                          Icon(
                            Icons.delete_outline_rounded,
                            color: colors.error,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            deleteLabel ?? LocaleKeys.delete_download.tr(),
                            style: TextStyle(color: colors.error),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
              const SizedBox(width: 4),
            ],
            IconButton.filled(
              onPressed: onTap,
              icon: Icon(
                audio.isVideo
                    ? Icons.play_circle_filled_rounded
                    : Icons.play_arrow_rounded,
              ),
              tooltip: LocaleKeys.play.tr(),
            ),
          ],
        ),
      ),
    );
  }
}

enum _DownloadAction { addToPlaylist, share, showLocation, delete }

class _AudioPlaceholder extends StatelessWidget {
  const _AudioPlaceholder({required this.colors});

  final ColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colors.surfaceContainerHighest,
      alignment: Alignment.center,
      child: Icon(Icons.music_note_rounded, color: colors.primary),
    );
  }
}

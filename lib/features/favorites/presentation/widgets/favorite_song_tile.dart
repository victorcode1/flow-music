import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/theme/custom_theme.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flow_music/features/favorites/data/favorite_song.dart';
import 'package:flutter/material.dart';

/// Tile dismissible para una cancion marcada como favorita.
class FavoriteSongTile extends StatelessWidget {
  const FavoriteSongTile({
    super.key,
    required this.favorite,
    required this.onTap,
    required this.onRemove,
  });

  final FavoriteSong favorite;
  final VoidCallback onTap;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final extras = theme.extension<FlowThemeExtras>();
    final isDark = theme.brightness == Brightness.dark;

    return Dismissible(
      key: ValueKey('fav-${favorite.videoId}'),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onRemove(),
      background: Container(
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
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: colors.surfaceContainerHigh,
            border: Border.all(color: extras?.subtleStroke ?? colors.outline),
            boxShadow: [
              BoxShadow(
                color: colors.scrim.withValues(alpha: isDark ? 0.4 : 0.06),
                blurRadius: 14,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: SizedBox.square(
                  dimension: 58,
                  child: favorite.thumbnailUrl.isEmpty
                      ? _FavoriteSongPlaceholder(colors: colors)
                      : Image.network(
                          favorite.thumbnailUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (_, _, _) {
                            return _FavoriteSongPlaceholder(colors: colors);
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
                      favorite.title.isEmpty
                          ? LocaleKeys.audio.tr()
                          : favorite.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                      ),
                    ),
                    if (favorite.author.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text(
                        favorite.author,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: 12),
              IconButton.filled(
                onPressed: onTap,
                icon: const Icon(Icons.play_arrow_rounded),
                tooltip: LocaleKeys.play.tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FavoriteSongPlaceholder extends StatelessWidget {
  const _FavoriteSongPlaceholder({required this.colors});

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

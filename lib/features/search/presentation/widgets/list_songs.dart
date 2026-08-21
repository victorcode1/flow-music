import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/features/autoplay/presentation/controllers/autoplay_queue_controller.dart';
import 'package:flow_music/features/search/presentation/controllers/search_history_controller.dart';
import 'package:flow_music/features/search/data/models/youtube_search_suggestion.dart';
import 'package:flow_music/core/theme/custom_theme.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flow_music/features/search/presentation/providers/list_search_result.dart';
import 'package:flow_music/features/settings/presentation/controllers/autoplay_enabled_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ListSongs extends ConsumerWidget {
  const ListSongs({super.key, required this.data, required this.listen});

  final String data;
  final void Function(YouTubeSearchSuggestion) listen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final extras = theme.extension<FlowThemeExtras>();
    final colors = theme.colorScheme;

    final asyncSongs = ref.watch(searchResultDataProvider(data));

    void onItemTap(List<YouTubeSearchSuggestion> items, int index) {
      unawaited(
        ref.read(searchHistoryControllerProvider.notifier).record(data),
      );
      if (ref.read(autoplayEnabledControllerProvider)) {
        ref
            .read(autoplayQueueControllerProvider.notifier)
            .enqueue(items, index);
      } else {
        ref.read(autoplayQueueControllerProvider.notifier).clear();
      }
      listen(items[index]);
    }

    return asyncSongs.when(
      data: (items) {
        if (items.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Text(
                LocaleKeys.no_results.tr(),
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
            ),
          );
        }

        if (kIsWeb && MediaQuery.sizeOf(context).width >= 900) {
          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1180),
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(28, 28, 28, 44),
                itemCount: items.length,
                separatorBuilder: (context, _) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final suggestion = items[index];
                  return _WebSongRow(
                    suggestion: suggestion,
                    onTap: () => onItemTap(items, index),
                  );
                },
              ),
            ),
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          itemCount: items.length,
          separatorBuilder: (context, _) => const SizedBox(height: 18),
          itemBuilder: (context, index) {
            final suggestion = items[index];
            final title = suggestion.displayText;
            final subtitle = suggestion.channelTitle;
            final image = suggestion.thumbnailUrl;

            return InkWell(
              borderRadius: BorderRadius.circular(28),
              onTap: () => onItemTap(items, index),
              child: Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  gradient: extras?.secondaryGradient,
                  border: Border.all(
                    color: extras?.subtleStroke ?? colors.outline,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: colors.scrim.withValues(
                        alpha: theme.brightness == Brightness.dark ? 0.5 : 0.12,
                      ),
                      blurRadius: 24,
                      offset: const Offset(0, 14),
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 16,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                        width: 60,
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: image.isNotEmpty
                              ? Image.network(
                                  image,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      _PlaceholderArtwork(colors: colors),
                                )
                              : _PlaceholderArtwork(colors: colors),
                        ),
                      ),
                    ),
                    const SizedBox(width: 18),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.2,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            subtitle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 18),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: extras?.primaryGradient,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        child: Icon(
                          Icons.play_arrow_rounded,
                          color: colors.onPrimary,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      error: (error, stack) {
        debugPrint('Error fetching search results: $error $stack');
        return Center(
          child: Text(LocaleKeys.error.tr(), textAlign: TextAlign.center),
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator.adaptive(strokeWidth: 2),
      ),
    );
  }
}

class _WebSongRow extends StatelessWidget {
  const _WebSongRow({required this.suggestion, required this.onTap});

  final YouTubeSearchSuggestion suggestion;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Material(
      color: colors.surfaceContainerLow,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  width: 96,
                  height: 64,
                  child: Image.network(
                    suggestion.thumbnailUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        _PlaceholderArtwork(colors: colors),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      suggestion.displayText,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      suggestion.channelTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              FilledButton.icon(
                onPressed: onTap,
                icon: const Icon(Icons.play_arrow_rounded),
                label: Text(LocaleKeys.play.tr()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PlaceholderArtwork extends StatelessWidget {
  const _PlaceholderArtwork({required this.colors});

  final ColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colors.surface.withValues(alpha: 0.25),
      alignment: Alignment.center,
      child: Icon(Icons.library_music_rounded, color: colors.onSurfaceVariant),
    );
  }
}

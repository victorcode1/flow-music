import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/domain/sources.dart';
import 'package:flow_music/core/theme/custom_theme.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flow_music/pages/song/controller/song_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SongWidget extends ConsumerStatefulWidget {
  final Map<String?, String?> data;
  const SongWidget({super.key, required this.data});

  @override
  ConsumerState<SongWidget> createState() => _PlaySongState();
}

class _PlaySongState extends ConsumerState<SongWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String? idSong = widget.data['idSong'];
    String? playListId = widget.data['playListId'];
    final controller = ref.watch(songController)
      ..playListSong(playListId: playListId);
    if (idSong == null) {
      return Center(child: Text(LocaleKeys.no_id_song.tr()));
    }
    return controller
        .result(data: idSong)
        .when(
          data: (data) => ScreenPlay(url: controller.urlSong(data: data)),
          error: (error, stack) => Center(child: Text(LocaleKeys.error.tr())),
          loading: () => const Center(child: CircularProgressIndicator()),
        );
  }
}

class ScreenPlay extends ConsumerStatefulWidget {
  final String url;
  const ScreenPlay({super.key, required this.url});

  @override
  ConsumerState<ScreenPlay> createState() => _ScreenPlayState();
}

class _ScreenPlayState extends ConsumerState<ScreenPlay>
    with AutomaticKeepAliveClientMixin<ScreenPlay> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final controller = ref.watch(songController)..autoPlay(data: widget.url);
    return _SourceTile(
      title: 'Play Song',
      subtitle: widget.url,
      setSource: () => controller.setSource(source: UrlSource(widget.url)),
      play: () => controller.play(source: UrlSource(widget.url)),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _SourceTile extends StatelessWidget {
  final void Function() setSource;
  final void Function() play;

  final String title;
  final String? subtitle;

  const _SourceTile({
    required this.setSource,
    required this.play,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final extras = theme.extension<FlowThemeExtras>();
    final colors = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          gradient: extras?.secondaryGradient,
          border: Border.all(color: extras?.subtleStroke ?? colors.outline),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF000000).withValues(
                alpha: theme.brightness == Brightness.dark ? 0.45 : 0.12,
              ),
              blurRadius: 28,
              offset: const Offset(0, 16),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: extras?.primaryGradient,
                      shape: BoxShape.circle,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(16),
                      child: Icon(
                        Icons.graphic_eq_rounded,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ),
                  const SizedBox(width: 18),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.3,
                          ),
                        ),
                        if (subtitle != null) ...[
                          const SizedBox(height: 6),
                          Text(subtitle!, style: theme.textTheme.bodyMedium),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      key: const Key('set_source_button'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: colors.onSurface,
                        side: BorderSide(
                          color: extras?.subtleStroke ?? colors.outline,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                      ),
                      icon: const Icon(Icons.cloud_upload_rounded),
                      label: Text(LocaleKeys.configure_source.tr()),
                      onPressed: setSource,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton.icon(
                      key: const Key('play_button'),
                      icon: const Icon(Icons.play_arrow_rounded, size: 26),
                      label: Text(LocaleKeys.play_button.tr()),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                      ),
                      onPressed: play,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

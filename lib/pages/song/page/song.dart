import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flow_music/pages/song/components/modern_player_widget.dart';
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
    // Extract video ID if it's a YouTube URL
    final extractedId = controller.extractVideoId(idSong);
    if (extractedId != null) {
      // Direct YouTube playback
      return ScreenPlay(id: extractedId);
    }
    return ScreenPlay(id: idSong);
  }
}

class ScreenPlay extends ConsumerStatefulWidget {
  final String id;
  const ScreenPlay({super.key, required this.id});

  @override
  ConsumerState<ScreenPlay> createState() => _ScreenPlayState();
}

class _ScreenPlayState extends ConsumerState<ScreenPlay>
    with AutomaticKeepAliveClientMixin<ScreenPlay> {
  @override
  void initState() {
    super.initState();
    // Call autoPlay after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(songController).autoPlay(id: widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final controller = ref.watch(songController);
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _ModeButton(
                  icon: Icons.music_note_rounded,
                  label: 'Audio',
                  isSelected: controller.currentMode == PlaybackMode.audio,
                  onTap: () => controller.switchMode(PlaybackMode.audio),
                ),
                _ModeButton(
                  icon: Icons.videocam_rounded,
                  label: 'Video',
                  isSelected: controller.currentMode == PlaybackMode.video,
                  onTap: () => controller.switchMode(PlaybackMode.video),
                ),
              ],
            ),
          ),
        ],
      ),
      body: ModernPlayerWidget(
        audioPlayer: controller.audioPlayer,
        videoController: controller.videoPlayerController,
        videoTitle: controller.videoInfo?.title,
        videoAuthor: controller.videoInfo?.author,
        thumbnailUrl: controller.videoInfo?.thumbnails.highResUrl,
        isLoading: controller.isLoading,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _ModeButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _ModeButton({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? theme.colorScheme.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 18,
              color: isSelected
                  ? Colors.white
                  : theme.colorScheme.onSurface.withOpacity(0.6),
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: theme.textTheme.bodySmall?.copyWith(
                color: isSelected
                    ? Colors.white
                    : theme.colorScheme.onSurface.withOpacity(0.6),
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

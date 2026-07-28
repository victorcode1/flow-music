import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flow_music/core/audio/background_audio_handler.dart';
import 'package:flow_music/features/radio/presentation/controllers/radio_queue_controller.dart';
import 'package:flow_music/features/radio/presentation/pages/radio_player_page.dart';
import 'package:flow_music/features/radio/presentation/utils/play_radio_station.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Barra compacta para la emisora que suena en segundo plano.
class RadioMiniPlayer extends ConsumerStatefulWidget {
  const RadioMiniPlayer({super.key});

  @override
  ConsumerState<RadioMiniPlayer> createState() => _RadioMiniPlayerState();
}

class _RadioMiniPlayerState extends ConsumerState<RadioMiniPlayer> {
  PlayerState _playerState = PlayerState.stopped;
  StreamSubscription<PlayerState>? _subscription;

  @override
  void initState() {
    super.initState();
    _playerState = flowAudioHandler.player.state;
    _subscription = flowAudioHandler.player.onPlayerStateChanged.listen((
      state,
    ) {
      if (mounted) setState(() => _playerState = state);
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MediaItem?>(
      stream: flowAudioHandler.mediaItem,
      builder: (context, snapshot) {
        final item = snapshot.data;
        if (item == null ||
            item.title.trim().isEmpty ||
            item.title == 'StreamBeat') {
          return const SizedBox.shrink();
        }
        final queue = ref.watch(radioQueueControllerProvider);
        final colors = Theme.of(context).colorScheme;
        final isPlaying = _playerState == PlayerState.playing;
        return Padding(
          padding: const EdgeInsets.fromLTRB(12, 6, 12, 8),
          child: Material(
            color: colors.surfaceContainerHigh,
            borderRadius: BorderRadius.circular(18),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => const RadioPlayerPage(),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    _Artwork(artUri: item.artUri),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleSmall
                                ?.copyWith(fontWeight: FontWeight.w800),
                          ),
                          Text(
                            item.artist ?? 'Radio en directo',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(color: colors.onSurfaceVariant),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      tooltip: 'Emisora anterior',
                      onPressed: queue.hasPrevious
                          ? () => playPreviousRadioStation(
                              context: context,
                              ref: ref,
                            )
                          : null,
                      icon: const Icon(Icons.skip_previous_rounded),
                    ),
                    IconButton.filled(
                      tooltip: isPlaying ? 'Pausar' : 'Reproducir',
                      onPressed: () => isPlaying
                          ? flowAudioHandler.pause()
                          : flowAudioHandler.play(),
                      icon: Icon(
                        isPlaying
                            ? Icons.pause_rounded
                            : Icons.play_arrow_rounded,
                      ),
                    ),
                    IconButton(
                      tooltip: 'Siguiente emisora',
                      onPressed: queue.hasNext
                          ? () =>
                                playNextRadioStation(context: context, ref: ref)
                          : null,
                      icon: const Icon(Icons.skip_next_rounded),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Artwork extends StatelessWidget {
  const _Artwork({required this.artUri});

  final Uri? artUri;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox.square(
        dimension: 44,
        child: artUri == null
            ? ColoredBox(
                color: colors.primary.withValues(alpha: 0.16),
                child: Icon(Icons.radio_rounded, color: colors.primary),
              )
            : Image.network(
                artUri.toString(),
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => ColoredBox(
                  color: colors.primary.withValues(alpha: 0.16),
                  child: Icon(Icons.radio_rounded, color: colors.primary),
                ),
              ),
      ),
    );
  }
}

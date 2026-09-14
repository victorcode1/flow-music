import 'dart:math' as math;

import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flutter/material.dart';

import 'track_change_transition.dart';

class ModernPlayerControls extends StatelessWidget {
  final ThemeData theme;
  final bool isDark;
  final Duration effectiveDuration;
  final Duration position;
  final bool isPlaying;
  final bool isMuted;
  final double volume;
  final VoidCallback onTogglePlayPause;
  final ValueChanged<Duration> onSeek;
  final VoidCallback onSkipBackward;
  final VoidCallback onSkipForward;
  final VoidCallback onToggleMute;
  final ValueChanged<double> onVolumeChanged;
  final VoidCallback? onPrevious;
  final VoidCallback? onNext;
  final bool repeatEnabled;
  final VoidCallback? onToggleRepeat;
  final VoidCallback? onShuffle;
  final String? title;
  final String? author;
  final bool isFavorite;
  final VoidCallback? onToggleFavorite;

  /// Identifica la cancion, para animar el relevo de titulo y artista.
  final String trackKey;

  /// Sentido del cambio: adelante en la cola o de vuelta a la anterior.
  final bool forward;

  const ModernPlayerControls({
    super.key,
    required this.theme,
    required this.isDark,
    required this.effectiveDuration,
    required this.position,
    required this.isPlaying,
    required this.isMuted,
    required this.volume,
    required this.onTogglePlayPause,
    required this.onSeek,
    required this.onSkipBackward,
    required this.onSkipForward,
    required this.onToggleMute,
    required this.onVolumeChanged,
    this.onPrevious,
    this.onNext,
    this.repeatEnabled = false,
    this.onToggleRepeat,
    this.onShuffle,
    this.title,
    this.author,
    this.isFavorite = false,
    this.onToggleFavorite,
    this.trackKey = '',
    this.forward = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      // Sin panel: el control fluye con el fondo inmersivo (igual al mockup),
      // sin tarjeta redondeada ni sombra que lo separe del artwork.
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Titulo de la cancion + artista + favorito (diseno StreamBeat,
          // pantalla D): el protagonista del reproductor inmersivo, sobre la
          // onda de progreso.
          if ((title ?? '').isNotEmpty) ...[
            Row(
              children: [
                Expanded(
                  child: TrackChangeTransition(
                    trackKey: trackKey.isNotEmpty ? trackKey : (title ?? ''),
                    forward: forward,
                    alignment: Alignment.centerLeft,
                    slide: 0.10,
                    scaleFrom: 0.98,
                    duration: const Duration(milliseconds: 360),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          title!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.4,
                          ),
                        ),
                        if ((author ?? '').isNotEmpty) ...[
                          const SizedBox(height: 2),
                          Text(
                            author!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
                if (onToggleFavorite != null)
                  IconButton(
                    tooltip: LocaleKeys.add_to_favorites.tr(),
                    onPressed: onToggleFavorite,
                    iconSize: 28,
                    icon: Icon(
                      isFavorite
                          ? Icons.favorite_rounded
                          : Icons.favorite_border_rounded,
                      color: isFavorite
                          ? const Color(0xFFFF4D6D)
                          : theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 14),
          ],
          Builder(
            builder: (_) {
              final hasDuration = effectiveDuration.inMilliseconds > 0;
              final maxMs = hasDuration
                  ? effectiveDuration.inMilliseconds.toDouble()
                  : 1.0;
              final positionMs = position.inMilliseconds.toDouble().clamp(
                0.0,
                maxMs,
              );
              final displayPosition =
                  hasDuration && position > effectiveDuration
                  ? effectiveDuration
                  : position;

              final progress = hasDuration
                  ? (positionMs / maxMs).clamp(0.0, 1.0)
                  : 0.0;

              return Column(
                children: [
                  _WaveformSeekBar(
                    progress: progress,
                    activeColor: theme.colorScheme.primary,
                    inactiveColor: theme.colorScheme.onSurface.withValues(
                      alpha: 0.22,
                    ),
                    onSeek: hasDuration
                        ? (fraction) => onSeek(
                            Duration(milliseconds: (fraction * maxMs).round()),
                          )
                        : null,
                  ),
                  const SizedBox(height: 6),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _formatDuration(displayPosition),
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurface.withValues(
                              alpha: 0.6,
                            ),
                          ),
                        ),
                        Text(
                          _formatDuration(effectiveDuration),
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurface.withValues(
                              alpha: 0.6,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 20),
          // Fila principal de transporte del diseno StreamBeat (pantalla D):
          // aleatorio · anterior · play (blanco) · siguiente · repetir.
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                tooltip: LocaleKeys.shuffle.tr(),
                icon: const Icon(Icons.shuffle_rounded),
                iconSize: 26,
                onPressed: onShuffle,
                color: onShuffle == null
                    ? theme.colorScheme.onSurface.withValues(alpha: 0.4)
                    : theme.colorScheme.onSurface.withValues(alpha: 0.85),
              ),
              IconButton(
                icon: const Icon(Icons.skip_previous_rounded),
                iconSize: 36,
                onPressed: onPrevious,
                color: onPrevious == null
                    ? theme.colorScheme.onSurface.withValues(alpha: 0.4)
                    : theme.colorScheme.onSurface.withValues(alpha: 0.85),
              ),
              // Boton principal del reproductor inmersivo: circulo blanco con
              // icono oscuro, tal como el diseno StreamBeat (pantalla D).
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.28),
                      blurRadius: 22,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: IconButton(
                  icon: Icon(
                    isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                    size: 40,
                  ),
                  onPressed: onTogglePlayPause,
                  color: const Color(0xFF121212),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.skip_next_rounded),
                iconSize: 36,
                onPressed: onNext,
                color: onNext == null
                    ? theme.colorScheme.onSurface.withValues(alpha: 0.4)
                    : theme.colorScheme.onSurface.withValues(alpha: 0.85),
              ),
              IconButton(
                tooltip: LocaleKeys.repeat_song.tr(),
                icon: Icon(
                  repeatEnabled
                      ? Icons.repeat_one_rounded
                      : Icons.repeat_rounded,
                ),
                iconSize: 26,
                onPressed: onToggleRepeat,
                color: repeatEnabled
                    ? theme.colorScheme.primary
                    : onToggleRepeat == null
                    ? theme.colorScheme.onSurface.withValues(alpha: 0.4)
                    : theme.colorScheme.onSurface.withValues(alpha: 0.85),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    if (hours > 0) {
      return '$hours:${twoDigits(minutes)}:${twoDigits(seconds)}';
    }
    return '${twoDigits(minutes)}:${twoDigits(seconds)}';
  }
}

/// Barra de progreso tipo onda (waveform) del reproductor inmersivo, igual al
/// diseno StreamBeat. La parte reproducida se pinta con el verde de marca y el
/// resto atenuado; tocar o arrastrar busca esa posicion.
class _WaveformSeekBar extends StatelessWidget {
  const _WaveformSeekBar({
    required this.progress,
    required this.activeColor,
    required this.inactiveColor,
    required this.onSeek,
  });

  final double progress;
  final Color activeColor;
  final Color inactiveColor;
  final ValueChanged<double>? onSeek;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        void seek(double dx) {
          if (onSeek == null || width <= 0) return;
          onSeek!((dx / width).clamp(0.0, 1.0));
        }

        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTapDown: (d) => seek(d.localPosition.dx),
          onHorizontalDragUpdate: (d) => seek(d.localPosition.dx),
          child: SizedBox(
            height: 40,
            width: width,
            child: CustomPaint(
              painter: _WaveformPainter(
                progress: progress,
                activeColor: activeColor,
                inactiveColor: inactiveColor,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _WaveformPainter extends CustomPainter {
  _WaveformPainter({
    required this.progress,
    required this.activeColor,
    required this.inactiveColor,
  });

  final double progress;
  final Color activeColor;
  final Color inactiveColor;

  @override
  void paint(Canvas canvas, Size size) {
    const barWidth = 3.0;
    const gap = 3.0;
    const step = barWidth + gap;
    final barCount = (size.width / step).floor().clamp(1, 512);
    final activePaint = Paint()
      ..color = activeColor
      ..style = PaintingStyle.fill;
    final inactivePaint = Paint()
      ..color = inactiveColor
      ..style = PaintingStyle.fill;
    final centerY = size.height / 2;
    final maxBar = size.height;
    const minFactor = 0.18;

    for (var i = 0; i < barCount; i++) {
      // Patron determinista con varias frecuencias para que parezca una onda
      // real sin depender de aleatoriedad (que rompe el repintado estable).
      final wave =
          0.5 + 0.30 * math.sin(i * 0.55) + 0.20 * math.sin(i * 1.7 + 0.9);
      final factor = (minFactor + (1 - minFactor) * wave).clamp(minFactor, 1.0);
      final barHeight = maxBar * factor;
      final x = i * step;
      final filled = (i + 0.5) / barCount <= progress;
      final rect = RRect.fromRectAndRadius(
        Rect.fromLTWH(x, centerY - barHeight / 2, barWidth, barHeight),
        const Radius.circular(1.5),
      );
      canvas.drawRRect(rect, filled ? activePaint : inactivePaint);
    }
  }

  @override
  bool shouldRepaint(_WaveformPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.activeColor != activeColor ||
        oldDelegate.inactiveColor != inactiveColor;
  }
}

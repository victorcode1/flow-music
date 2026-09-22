import 'package:audio_service/audio_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/theme/desktop_theme.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flutter/material.dart';

import 'track_change_transition.dart';

/// Barra de reproduccion inferior del escritorio.
///
/// Reemplaza la tarjeta flotante del mini player movil por la barra fija de
/// 72px del mockup "StreamBeat — Rediseño": tres zonas de ancho fijo — pista a
/// la izquierda, transporte centrado, tiempo y acciones a la derecha — para que
/// el boton de play quede clavado en el centro de la ventana aunque el titulo
/// de la cancion cambie de largo.
class DesktopNowPlayingBar extends StatelessWidget {
  const DesktopNowPlayingBar({
    super.key,
    required this.item,
    required this.isPlaying,
    required this.isBuffering,
    required this.progress,
    required this.position,
    required this.duration,
    required this.onToggle,
    required this.onPrevious,
    required this.onNext,
    required this.onStop,
    required this.onOpen,
  });

  /// Ancho de las zonas laterales. Fijarlas es lo que mantiene el transporte
  /// centrado respecto a la ventana, no respecto al texto.
  static const double _sideZoneWidth = 260;

  final MediaItem item;
  final bool isPlaying;
  final bool isBuffering;
  final double? progress;
  final Duration position;
  final Duration? duration;
  final VoidCallback onToggle;
  final VoidCallback? onPrevious;
  final VoidCallback? onNext;
  final VoidCallback onStop;
  final VoidCallback onOpen;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.surfaceContainerLowest,
        border: Border(top: BorderSide(color: colors.outline)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Hilo de progreso al borde superior: da la posicion sin robarle
          // altura a la barra.
          SizedBox(
            height: 2,
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 2,
              backgroundColor: FlowDesktopTheme.track(colors),
              valueColor: AlwaysStoppedAnimation(colors.primary),
            ),
          ),
          SizedBox(
            height: FlowDesktopTheme.nowPlayingBarHeight - 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  SizedBox(
                    width: _sideZoneWidth,
                    child: _TrackIdentity(item: item, onOpen: onOpen),
                  ),
                  Expanded(
                    child: Center(
                      child: _Transport(
                        isPlaying: isPlaying,
                        isBuffering: isBuffering,
                        onToggle: onToggle,
                        onPrevious: onPrevious,
                        onNext: onNext,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: _sideZoneWidth,
                    child: _TrailingActions(
                      position: position,
                      duration: duration,
                      onOpen: onOpen,
                      onStop: onStop,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Zona izquierda: caratula, titulo y artista. Abre el reproductor completo.
class _TrackIdentity extends StatelessWidget {
  const _TrackIdentity({required this.item, required this.onOpen});

  final MediaItem item;
  final VoidCallback onOpen;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final artist = item.artist;

    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onOpen,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: Row(
          children: [
            TrackChangeTransition(
              trackKey: item.id,
              slide: 0.35,
              duration: const Duration(milliseconds: 320),
              child: _BarArtwork(artUri: item.artUri, color: colors.primary),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TrackChangeTransition(
                trackKey: item.id,
                alignment: Alignment.centerLeft,
                slide: 0.12,
                scaleFrom: 0.98,
                duration: const Duration(milliseconds: 320),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      item.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: colors.onSurface,
                      ),
                    ),
                    if (artist != null && artist.isNotEmpty)
                      Text(
                        artist,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: colors.onSurfaceVariant,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Zona central: anterior · play/pausa · siguiente.
class _Transport extends StatelessWidget {
  const _Transport({
    required this.isPlaying,
    required this.isBuffering,
    required this.onToggle,
    required this.onPrevious,
    required this.onNext,
  });

  final bool isPlaying;
  final bool isBuffering;
  final VoidCallback onToggle;
  final VoidCallback? onPrevious;
  final VoidCallback? onNext;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _BarIconButton(
          icon: Icons.skip_previous_rounded,
          tooltip: LocaleKeys.previous.tr(),
          onPressed: onPrevious,
        ),
        const SizedBox(width: 14),
        // Boton principal: circulo de acento, el unico relleno solido de la
        // barra, para que el ojo lo encuentre sin buscar.
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: colors.primary,
            boxShadow: [
              BoxShadow(
                color: colors.primary.withValues(alpha: 0.35),
                blurRadius: 16,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            tooltip: isPlaying ? LocaleKeys.pause.tr() : LocaleKeys.play.tr(),
            icon: isBuffering
                ? SizedBox.square(
                    dimension: 17,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.2,
                      color: colors.onPrimary,
                    ),
                  )
                : Icon(
                    isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                    color: colors.onPrimary,
                    size: 22,
                  ),
            onPressed: isBuffering ? null : onToggle,
          ),
        ),
        const SizedBox(width: 14),
        _BarIconButton(
          icon: Icons.skip_next_rounded,
          tooltip: LocaleKeys.next.tr(),
          onPressed: onNext,
        ),
      ],
    );
  }
}

/// Zona derecha: tiempo transcurrido, abrir reproductor y detener.
class _TrailingActions extends StatelessWidget {
  const _TrailingActions({
    required this.position,
    required this.duration,
    required this.onOpen,
    required this.onStop,
  });

  final Duration position;
  final Duration? duration;
  final VoidCallback onOpen;
  final VoidCallback onStop;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final total = duration;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (total != null && total > Duration.zero)
          Text(
            '${_format(position)} / ${_format(total)}',
            style: theme.textTheme.bodySmall?.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: FlowDesktopTheme.faint(colors),
              fontFeatures: const [FontFeature.tabularFigures()],
            ),
          ),
        const SizedBox(width: 12),
        _BarIconButton(
          icon: Icons.open_in_full_rounded,
          tooltip: LocaleKeys.playing.tr(),
          size: 17,
          onPressed: onOpen,
        ),
        _BarIconButton(
          icon: Icons.close_rounded,
          tooltip: LocaleKeys.stop.tr(),
          size: 19,
          onPressed: onStop,
        ),
      ],
    );
  }

  /// `m:ss`, o `h:mm:ss` cuando la pista pasa de una hora.
  static String _format(Duration value) {
    final hours = value.inHours;
    final minutes = value.inMinutes.remainder(60);
    final seconds = value.inSeconds.remainder(60).toString().padLeft(2, '0');
    if (hours > 0) {
      return '$hours:${minutes.toString().padLeft(2, '0')}:$seconds';
    }
    return '$minutes:$seconds';
  }
}

/// Boton de icono plano de la barra: sin relleno, se pinta al pasar el cursor.
class _BarIconButton extends StatelessWidget {
  const _BarIconButton({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
    this.size = 20,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback? onPressed;
  final double size;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: 36,
      height: 36,
      child: IconButton(
        padding: EdgeInsets.zero,
        iconSize: size,
        tooltip: tooltip,
        hoverColor: colors.onSurface.withValues(alpha: 0.08),
        color: colors.onSurface,
        disabledColor: colors.onSurfaceVariant.withValues(alpha: 0.35),
        icon: Icon(icon),
        onPressed: onPressed,
      ),
    );
  }
}

/// Caratula de 46px con el degradado de respaldo cuando no hay imagen.
class _BarArtwork extends StatelessWidget {
  const _BarArtwork({required this.artUri, required this.color});

  final Uri? artUri;
  final Color color;

  @override
  Widget build(BuildContext context) {
    const size = 46.0;
    final fallback = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(9),
      ),
      child: Icon(Icons.music_note_rounded, size: 24, color: color),
    );
    if (artUri == null) return fallback;
    return ClipRRect(
      borderRadius: BorderRadius.circular(9),
      child: Image.network(
        artUri.toString(),
        width: size,
        height: size,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => fallback,
      ),
    );
  }
}

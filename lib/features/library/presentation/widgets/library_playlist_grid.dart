import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/theme/desktop_theme.dart';
import 'package:flow_music/core/theme/flow_cover_gradients.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flow_music/features/playlists/data/playlist.dart';
import 'package:flow_music/features/playlists/presentation/widgets/playlist_actions.dart';
import 'package:flutter/material.dart';

/// Cuadricula de listas para la biblioteca en escritorio.
///
/// En movil las listas son filas apiladas; a 1320px esas filas se estiran de
/// borde a borde y la pantalla queda vacia. El mockup "StreamBeat — Rediseño"
/// las reparte en tarjetas cuadradas de cubierta grande, con la celda de
/// "Crear lista" cerrando la cuadricula.
class LibraryPlaylistGrid extends StatelessWidget {
  const LibraryPlaylistGrid({
    super.key,
    required this.playlists,
    required this.onOpen,
    required this.onCreate,
  });

  /// Ancho maximo de tarjeta. Por encima de esto se agrega otra columna, asi
  /// la cuadricula da cuatro columnas al ancho del diseno y se reacomoda sola
  /// cuando la ventana se angosta.
  static const double _maxCardWidth = 240;
  static const double _gap = 20;

  /// Alto del bloque de texto bajo la cubierta (titulo + conteo).
  static const double _captionHeight = 52;

  final List<Playlist> playlists;
  final ValueChanged<Playlist> onOpen;
  final VoidCallback onCreate;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = (constraints.maxWidth / (_maxCardWidth + _gap))
            .ceil()
            .clamp(2, 6);
        final cardWidth =
            (constraints.maxWidth - _gap * (columns - 1)) / columns;

        return GridView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: playlists.length + 1,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: _gap,
            mainAxisSpacing: _gap,
            // La cubierta es cuadrada; el resto del alto es el pie de texto.
            mainAxisExtent: cardWidth + _captionHeight,
          ),
          itemBuilder: (context, index) {
            if (index == playlists.length) {
              return _CreatePlaylistCard(onTap: onCreate);
            }
            final playlist = playlists[index];
            return _PlaylistCard(
              playlist: playlist,
              onTap: () => onOpen(playlist),
            );
          },
        );
      },
    );
  }
}

class _PlaylistCard extends StatelessWidget {
  const _PlaylistCard({required this.playlist, required this.onTap});

  final Playlist playlist;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: FlowCoverGradients.of(playlist.id),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: colors.scrim.withValues(alpha: 0.6),
                    blurRadius: 36,
                    spreadRadius: -16,
                    offset: const Offset(0, 16),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(14),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Icon(
                  Icons.queue_music_rounded,
                  size: 26,
                  // Las cubiertas son siempre saturadas, asi que el icono va en
                  // negro translucido para leerse sobre cualquiera de ellas.
                  color: Colors.black.withValues(alpha: 0.55),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            playlist.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: colors.onSurface,
            ),
          ),
          Text(
            songCountLabel(playlist.itemCount),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodySmall?.copyWith(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: FlowDesktopTheme.faint(colors),
            ),
          ),
        ],
      ),
    );
  }
}

/// Ultima celda de la cuadricula: contorno punteado que invita a crear.
class _CreatePlaylistCard extends StatelessWidget {
  const _CreatePlaylistCard({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: DottedOutline(
              color: FlowDesktopTheme.track(colors),
              radius: 16,
              child: Center(
                child: Icon(
                  Icons.add_rounded,
                  size: 34,
                  color: colors.onSurfaceVariant,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            LocaleKeys.create_playlist.tr(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: colors.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

/// Contorno punteado redondeado. Flutter no trae bordes `dashed`, asi que se
/// pinta a mano recorriendo el contorno con `PathMetric`.
class DottedOutline extends StatelessWidget {
  const DottedOutline({
    super.key,
    required this.color,
    required this.radius,
    required this.child,
    this.strokeWidth = 2,
  });

  final Color color;
  final double radius;
  final double strokeWidth;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DottedOutlinePainter(
        color: color,
        radius: radius,
        strokeWidth: strokeWidth,
      ),
      child: child,
    );
  }
}

class _DottedOutlinePainter extends CustomPainter {
  const _DottedOutlinePainter({
    required this.color,
    required this.radius,
    required this.strokeWidth,
  });

  final Color color;
  final double radius;
  final double strokeWidth;

  static const double _dash = 7;
  static const double _gap = 6;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final outline = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Offset.zero & size,
          Radius.circular(radius),
        ).deflate(strokeWidth / 2),
      );

    for (final metric in outline.computeMetrics()) {
      var distance = 0.0;
      while (distance < metric.length) {
        final end = (distance + _dash).clamp(0.0, metric.length);
        canvas.drawPath(metric.extractPath(distance, end), paint);
        distance = end + _gap;
      }
    }
  }

  @override
  bool shouldRepaint(_DottedOutlinePainter old) =>
      old.color != color ||
      old.radius != radius ||
      old.strokeWidth != strokeWidth;
}

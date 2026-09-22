import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/theme/desktop_theme.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flutter/material.dart';

/// Cabecera de Favoritos en escritorio.
///
/// Reproduce el heroe del mockup "Favoritos — escritorio": franja en degradado
/// del acento que se funde con el lienzo, cubierta de 150px, titulo grande y
/// una fila de acciones debajo. Sustituye al titulo pequeno de movil, que a
/// 1320px dejaba la pantalla arrancando en un vacio.
class FavoritesDesktopHero extends StatelessWidget {
  const FavoritesDesktopHero({
    super.key,
    required this.songCount,
    required this.onPlayAll,
    required this.onShuffle,
  });

  /// Numero de canciones favoritas; `0` deja las acciones apagadas.
  final int songCount;
  final VoidCallback onPlayAll;
  final VoidCallback onShuffle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final hasSongs = songCount > 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 230,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              // 150deg en CSS: arranca arriba-izquierda y cae a la derecha.
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [colors.primary, colors.surface.withValues(alpha: 0.2)],
            ),
          ),
          padding: const EdgeInsets.fromLTRB(40, 0, 40, 28),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.25),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.6),
                      blurRadius: 50,
                      spreadRadius: -16,
                      offset: const Offset(0, 20),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.favorite_rounded,
                  size: 56,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        LocaleKeys.list_label.tr().toUpperCase(),
                        style: theme.textTheme.labelSmall?.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.2,
                          color: Colors.white.withValues(alpha: 0.85),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        LocaleKeys.favorites.tr(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.displayLarge?.copyWith(
                          fontSize: 46,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -1,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _songCountLabel(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withValues(alpha: 0.85),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(40, 22, 40, 22),
          child: Row(
            children: [
              // Boton principal: el unico relleno solido de la cabecera.
              Tooltip(
                message: LocaleKeys.play_all.tr(),
                child: Material(
                  color: hasSongs
                      ? colors.primary
                      : colors.surfaceContainerHigh,
                  shape: const CircleBorder(),
                  child: InkWell(
                    customBorder: const CircleBorder(),
                    onTap: hasSongs ? onPlayAll : null,
                    child: SizedBox.square(
                      dimension: 58,
                      child: Icon(
                        Icons.play_arrow_rounded,
                        size: 28,
                        color: hasSongs
                            ? colors.onPrimary
                            : colors.onSurfaceVariant,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              IconButton(
                tooltip: LocaleKeys.shuffle.tr(),
                iconSize: 28,
                color: colors.onSurfaceVariant,
                disabledColor: FlowDesktopTheme.track(colors),
                icon: const Icon(Icons.shuffle_rounded),
                onPressed: hasSongs ? onShuffle : null,
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _songCountLabel() {
    if (songCount == 1) return LocaleKeys.one_song_count.tr();
    return LocaleKeys.songs_count.tr(args: [songCount.toString()]);
  }
}

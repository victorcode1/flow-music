import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/theme/flow_cover_gradients.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flow_music/features/radio/data/models/radio_station.dart';
import 'package:flutter/material.dart';

/// Tarjeta de emisora para la cuadricula de Radio en escritorio.
///
/// Reemplaza la fila estirada por la tarjeta de color del mockup "Radio —
/// escritorio": cubierta en degradado, distintivo EN VIVO arriba y nombre mas
/// audiencia abajo. El degradado se deriva del uuid de la emisora, asi que cada
/// una conserva su color.
class RadioStationCard extends StatelessWidget {
  const RadioStationCard({
    super.key,
    required this.station,
    required this.isActive,
    required this.isFavorite,
    required this.onTap,
    required this.onToggleFavorite,
  });

  final RadioStation station;
  final bool isActive;
  final bool isFavorite;
  final VoidCallback onTap;
  final VoidCallback onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    // radio-browser marca con lastCheckOk si el stream respondio en el ultimo
    // sondeo: es lo mas cercano a "esta al aire" que expone la API.
    final isLive = station.lastCheckOk == 1;

    // El degradado va en un Container y no en un `Ink`: `Ink` pinta sobre el
    // `Material` ancestro, y dentro de un scroll esa capa no acompana al item,
    // asi que la cubierta se perdia. El `Material` transparente de adentro es
    // el que recibe el ripple.
    return Container(
      decoration: BoxDecoration(
        gradient: FlowCoverGradients.of(station.stationUuid),
        borderRadius: BorderRadius.circular(16),
        border: isActive ? Border.all(color: colors.onSurface, width: 2) : null,
      ),
      clipBehavior: Clip.antiAlias,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    if (isLive) const _LiveBadge(),
                    const Spacer(),
                    _CardIconButton(
                      icon: isFavorite
                          ? Icons.favorite_rounded
                          : Icons.favorite_border_rounded,
                      tooltip: isFavorite
                          ? LocaleKeys.remove_from_favorites.tr()
                          : LocaleKeys.add_to_favorites.tr(),
                      onPressed: onToggleFavorite,
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  station.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  _subtitle(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white.withValues(alpha: 0.8),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Audiencia cuando la emisora la reporta; si no, de donde transmite.
  String _subtitle() {
    if (station.clickCount > 0) {
      return LocaleKeys.listeners_count.tr(
        args: [_compact(station.clickCount)],
      );
    }
    return [
      if (station.country.isNotEmpty) station.country,
      if (station.bitrate > 0) '${station.bitrate} kbps',
    ].join(' · ');
  }

  /// `8.1k` / `1.2M`, para que el numero no rompa el ancho de la tarjeta.
  static String _compact(int value) {
    if (value >= 1000000) {
      return '${(value / 1000000).toStringAsFixed(1)}M';
    }
    if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(1)}k';
    }
    return '$value';
  }
}

/// Distintivo "EN VIVO": punto rojo con halo sobre pastilla oscura.
class _LiveBadge extends StatelessWidget {
  const _LiveBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.35),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFFF4D4D),
            ),
          ),
          const SizedBox(width: 6),
          Text(
            LocaleKeys.live.tr().toUpperCase(),
            style: const TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.72,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

/// Boton de icono sobre la cubierta de color.
class _CardIconButton extends StatelessWidget {
  const _CardIconButton({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      height: 30,
      child: IconButton(
        padding: EdgeInsets.zero,
        iconSize: 18,
        tooltip: tooltip,
        color: Colors.white,
        hoverColor: Colors.white.withValues(alpha: 0.18),
        icon: Icon(icon),
        onPressed: onPressed,
      ),
    );
  }
}

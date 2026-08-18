import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/consts/enums.dart';
import 'package:flow_music/core/theme/custom_theme.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flow_music/features/home/presentation/providers/text_search.dart';
import 'package:flow_music/features/playlists/presentation/widgets/playlist_actions.dart';
import 'package:flow_music/features/song/presentation/controllers/song_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Barra superior de la variante desktop con busqueda y accesos rapidos.
class HomeDesktopTopBar extends ConsumerStatefulWidget {
  const HomeDesktopTopBar({
    super.key,
    required this.query,
    required this.showSearch,
    this.isRadioSection = false,
  });

  final ValueChanged<String> query;
  final Future<void> Function() showSearch;

  /// Estando en Radio o en el mapa, lo que se escribe filtra emisoras (la
  /// pantalla de radio escucha el mismo controlador) en vez de buscar canciones.
  final bool isRadioSection;

  @override
  ConsumerState<HomeDesktopTopBar> createState() => _HomeDesktopTopBarState();
}

class _HomeDesktopTopBarState extends ConsumerState<HomeDesktopTopBar> {
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final searchController = ref.watch(searchProvider);
    final playlistItem = ref.watch(songController).currentPlaylistItem;

    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 22),
      decoration: BoxDecoration(
        color: colors.surfaceContainerLowest,
        border: Border(bottom: BorderSide(color: colors.outlineVariant)),
      ),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            // Marca a la izquierda (logo + nombre), igual al mockup StreamBeat.
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: theme
                            .extension<FlowThemeExtras>()
                            ?.primaryGradient,
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: SizedBox.square(
                        dimension: 32,
                        child: Icon(
                          Icons.graphic_eq_rounded,
                          color: colors.onPrimary,
                          size: 18,
                        ),
                      ),
                    ),
                    const SizedBox(width: 11),
                    Text(
                      Variables.name.value,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Buscador como pill redondeado y centrado (diseno StreamBeat desktop).
            SizedBox(
              width: 460,
              child: Container(
                height: 42,
                decoration: BoxDecoration(
                  color: colors.surfaceContainerHigh,
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(color: colors.outlineVariant),
                ),
                padding: const EdgeInsets.only(left: 16, right: 6),
                child: Row(
                  children: [
                    Icon(
                      Icons.search_rounded,
                      color: colors.onSurfaceVariant,
                      size: 19,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        focusNode: _focusNode,
                        controller: searchController,
                        style: theme.textTheme.bodyMedium,
                        onChanged: widget.isRadioSection ? null : widget.query,
                        decoration: InputDecoration(
                          hintText: widget.isRadioSection
                              ? LocaleKeys.search_radio.tr()
                              : LocaleKeys.search_music.tr(),
                          filled: false,
                          border: InputBorder.none,
                          isDense: true,
                          hintStyle: theme.textTheme.bodyMedium?.copyWith(
                            color: colors.onSurfaceVariant.withValues(
                              alpha: 0.7,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Acciones a la derecha.
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (playlistItem != null) ...[
                      _HomeDesktopTopIconButton(
                        icon: Icons.playlist_add_rounded,
                        tooltip: LocaleKeys.add_to_playlist.tr(),
                        onPressed: () => showAddToPlaylistFlow(
                          context: context,
                          ref: ref,
                          audio: playlistItem,
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
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

/// Boton cuadrado de accion rapida para la top bar desktop.
class _HomeDesktopTopIconButton extends StatelessWidget {
  const _HomeDesktopTopIconButton({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: 40,
      height: 40,
      child: Material(
        color: colors.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(12),
        child: IconButton(
          padding: EdgeInsets.zero,
          iconSize: 20,
          tooltip: tooltip,
          icon: Icon(icon),
          onPressed: onPressed,
        ),
      ),
    );
  }
}

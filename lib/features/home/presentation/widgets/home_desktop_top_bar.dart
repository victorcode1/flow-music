import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/consts/enums.dart';
import 'package:flow_music/core/theme/custom_theme.dart';
import 'package:flow_music/core/theme/desktop_theme.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flow_music/features/home/presentation/providers/desktop_queue_rail.dart';
import 'package:flow_music/features/home/presentation/providers/text_search.dart';
import 'package:flow_music/features/playlists/presentation/widgets/playlist_actions.dart';
import 'package:flow_music/features/search/data/search_history_repository.dart';
import 'package:flow_music/features/search/presentation/controllers/search_history_controller.dart';
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
    // La pastilla de busqueda se tine con el acento al enfocarse (mockup
    // "Escritorio Inicio / Busqueda"), asi que repintamos con el foco.
    _focusNode.addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChanged);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChanged() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final searchController = ref.watch(searchProvider);
    final searchHistory = widget.isRadioSection
        ? const <String>[]
        : ref.watch(searchHistoryControllerProvider);
    final playlistItem = ref.watch(songController).currentPlaylistItem;
    final railVisible = ref.watch(desktopQueueRailVisibleProvider);
    final searchFocused = _focusNode.hasFocus;

    return Container(
      height: FlowDesktopTheme.topBarHeight,
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
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: SizedBox.square(
                        dimension: 30,
                        child: Icon(
                          Icons.graphic_eq_rounded,
                          color: colors.onPrimary,
                          size: 16,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      Variables.name.value,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Buscador como pastilla centrada. Enfocada se ensancha y toma el
            // borde del acento, como en el mockup.
            AnimatedContainer(
              duration: const Duration(milliseconds: 160),
              curve: Curves.easeOut,
              width: searchFocused ? 460 : 440,
              height: 40,
              decoration: BoxDecoration(
                color: colors.surfaceContainerHigh,
                borderRadius: BorderRadius.circular(
                  FlowDesktopTheme.pillRadius,
                ),
                border: Border.all(
                  color: searchFocused ? colors.primary : colors.outline,
                ),
              ),
              padding: const EdgeInsets.only(left: 16, right: 8),
              child: Row(
                children: [
                  Icon(
                    Icons.search_rounded,
                    color: searchFocused
                        ? colors.primary
                        : FlowDesktopTheme.faint(colors),
                    size: 17,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: widget.isRadioSection
                        ? _searchTextField(
                            controller: searchController,
                            theme: theme,
                            colors: colors,
                            hintText: LocaleKeys.search_radio.tr(),
                          )
                        : _musicSearchAutocomplete(
                            controller: searchController,
                            history: searchHistory,
                            theme: theme,
                            colors: colors,
                          ),
                  ),
                ],
              ),
            ),
            // Acciones a la derecha.
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (playlistItem != null)
                      _HomeDesktopTopIconButton(
                        icon: Icons.playlist_add_rounded,
                        tooltip: LocaleKeys.add_to_playlist.tr(),
                        onPressed: () => showAddToPlaylistFlow(
                          context: context,
                          ref: ref,
                          audio: playlistItem,
                        ),
                      ),
                    _HomeDesktopTopIconButton(
                      icon: Icons.queue_music_rounded,
                      tooltip: LocaleKeys.queue.tr(),
                      selected: railVisible,
                      onPressed: ref
                          .read(desktopQueueRailVisibleProvider.notifier)
                          .toggle,
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

  Widget _musicSearchAutocomplete({
    required TextEditingController controller,
    required List<String> history,
    required ThemeData theme,
    required ColorScheme colors,
  }) {
    return RawAutocomplete<String>(
      textEditingController: controller,
      focusNode: _focusNode,
      displayStringForOption: (option) => option,
      optionsBuilder: (textEditingValue) {
        final filter = normalizeSearchQuery(
          textEditingValue.text,
        ).toLowerCase();
        if (filter.isEmpty) return history;
        return history.where((query) => query.toLowerCase().contains(filter));
      },
      onSelected: (query) {
        unawaited(
          ref.read(searchHistoryControllerProvider.notifier).record(query),
        );
        widget.query(query);
      },
      fieldViewBuilder: (context, textController, focusNode, onSubmitted) {
        return _searchTextField(
          controller: textController,
          focusNode: focusNode,
          theme: theme,
          colors: colors,
          hintText: LocaleKeys.search_music.tr(),
          onChanged: widget.query,
          onSubmitted: (value) {
            final query = normalizeSearchQuery(value);
            if (query.isEmpty) return;
            textController.value = TextEditingValue(
              text: query,
              selection: TextSelection.collapsed(offset: query.length),
            );
            unawaited(
              ref.read(searchHistoryControllerProvider.notifier).record(query),
            );
            widget.query(query);
            onSubmitted();
          },
        );
      },
      optionsViewBuilder: (context, onSelected, options) {
        // El desplegable se monta en el Overlay del Navigator, fuera del
        // `Theme` de escritorio que HomePage aplica solo a su rama. Sin
        // re-aplicarlo hereda el tema movil y el panel sale con pastillas
        // negras de 18px y el violeta del fondo ambiente. Ademas el
        // `surfaceContainer` del diseno es blanco al 4.5% (translucido), asi
        // que aqui el panel usa `surfaceBright`: el mismo tono opaco con el
        // que el rediseno pinta menus y dialogos.
        final desktopTheme = FlowDesktopTheme.of(Theme.of(context));
        final desktopColors = desktopTheme.colorScheme;
        return Theme(
          data: desktopTheme.copyWith(
            listTileTheme: desktopTheme.listTileTheme.copyWith(
              tileColor: Colors.transparent,
              iconColor: desktopColors.onSurfaceVariant,
              textColor: desktopColors.onSurface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 14),
            ),
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: Material(
              elevation: 8,
              color: desktopColors.surfaceBright,
              shadowColor: desktopColors.shadow.withValues(alpha: 0.24),
              borderRadius: BorderRadius.circular(16),
              clipBehavior: Clip.antiAlias,
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 410,
                  maxHeight: 360,
                ),
                child: SizedBox(
                  width: 410,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 8, 2),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                LocaleKeys.recent_searches.tr(),
                                style: desktopTheme.textTheme.titleSmall
                                    ?.copyWith(fontWeight: FontWeight.w700),
                              ),
                            ),
                            TextButton(
                              onPressed: () => ref
                                  .read(
                                    searchHistoryControllerProvider.notifier,
                                  )
                                  .clear(),
                              child: Text(LocaleKeys.clear_search_history.tr()),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: ListView(
                          padding: const EdgeInsets.only(bottom: 8),
                          shrinkWrap: true,
                          children: options
                              .map(
                                (query) => ListTile(
                                  dense: true,
                                  leading: const Icon(
                                    Icons.history_rounded,
                                    size: 18,
                                  ),
                                  title: Text(
                                    query,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  onTap: () => onSelected(query),
                                  trailing: IconButton(
                                    tooltip: LocaleKeys
                                        .remove_search_history_item
                                        .tr(),
                                    onPressed: () => ref
                                        .read(
                                          searchHistoryControllerProvider
                                              .notifier,
                                        )
                                        .remove(query),
                                    iconSize: 16,
                                    icon: const Icon(Icons.close_rounded),
                                  ),
                                ),
                              )
                              .toList(growable: false),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _searchTextField({
    required TextEditingController controller,
    required ThemeData theme,
    required ColorScheme colors,
    required String hintText,
    FocusNode? focusNode,
    ValueChanged<String>? onChanged,
    ValueChanged<String>? onSubmitted,
  }) {
    return TextField(
      focusNode: focusNode ?? _focusNode,
      controller: controller,
      style: theme.textTheme.bodyMedium,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        hintText: hintText,
        filled: false,
        border: InputBorder.none,
        isDense: true,
        hintStyle: theme.textTheme.bodyMedium?.copyWith(
          color: colors.onSurfaceVariant.withValues(alpha: 0.7),
        ),
      ),
    );
  }
}

/// Boton cuadrado de accion rapida para la top bar desktop.
///
/// El diseno lo deja sin relleno en reposo — solo el icono al 70% — y lo pinta
/// al pasar el cursor. Con [selected] toma el acento, para que el boton de cola
/// muestre si el riel derecho esta abierto.
class _HomeDesktopTopIconButton extends StatelessWidget {
  const _HomeDesktopTopIconButton({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
    this.selected = false,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback onPressed;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: 38,
      height: 38,
      child: Material(
        color: selected
            ? colors.primary.withValues(alpha: 0.14)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        child: IconButton(
          padding: EdgeInsets.zero,
          iconSize: 19,
          tooltip: tooltip,
          hoverColor: colors.onSurface.withValues(alpha: 0.08),
          color: selected ? colors.primary : colors.onSurfaceVariant,
          icon: Icon(icon),
          onPressed: onPressed,
        ),
      ),
    );
  }
}

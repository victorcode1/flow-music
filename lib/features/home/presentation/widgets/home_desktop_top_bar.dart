import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/consts/enums.dart';
import 'package:flow_music/core/theme/custom_theme.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
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
    final searchHistory = widget.isRadioSection
        ? const <String>[]
        : ref.watch(searchHistoryControllerProvider);
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
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            elevation: 8,
            color: colors.surfaceContainer,
            shadowColor: colors.shadow.withValues(alpha: 0.24),
            borderRadius: BorderRadius.circular(16),
            clipBehavior: Clip.antiAlias,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 410, maxHeight: 360),
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
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () => ref
                                .read(searchHistoryControllerProvider.notifier)
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
                                leading: const Icon(Icons.history_rounded),
                                title: Text(
                                  query,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                onTap: () => onSelected(query),
                                trailing: IconButton(
                                  tooltip: LocaleKeys.remove_search_history_item
                                      .tr(),
                                  onPressed: () => ref
                                      .read(
                                        searchHistoryControllerProvider
                                            .notifier,
                                      )
                                      .remove(query),
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

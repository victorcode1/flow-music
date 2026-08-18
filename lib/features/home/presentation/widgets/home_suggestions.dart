import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flow_music/core/utils/adaptive_layout.dart';
import 'package:flow_music/features/autoplay/presentation/controllers/autoplay_queue_controller.dart';
import 'package:flow_music/features/history/data/playback_history_entry.dart';
import 'package:flow_music/features/history/presentation/controllers/playback_history_controller.dart';
import 'package:flow_music/features/home/presentation/controllers/home_view_controller.dart';
import 'package:flow_music/features/home/presentation/providers/home_suggestions_provider.dart';
import 'package:flow_music/features/search/data/models/youtube_search_suggestion.dart';
import 'package:flow_music/features/settings/presentation/controllers/autoplay_enabled_controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Categorias rapidas del home (chips "Descubre"), igual al diseno StreamBeat.
enum _HomeCategoryKind { forYou, radio, genre }

/// Un chip del carrusel de categorias del home.
///
/// Los dos que no son genero se comportan distinto: "Para ti" pide otra tanda de
/// sugerencias y "Radio" cambia de seccion. El resto son generos que se buscan
/// en YouTube.
class _HomeCategory {
  const _HomeCategory.forYou(this.label) : kind = _HomeCategoryKind.forYou;
  const _HomeCategory.radio(this.label) : kind = _HomeCategoryKind.radio;
  const _HomeCategory.genre(this.label) : kind = _HomeCategoryKind.genre;

  final _HomeCategoryKind kind;
  final String label;

  /// Busqueda de un chip de genero. El "mix" empuja a YouTube hacia
  /// recopilatorios del genero en vez de una cancion suelta, y sale en el idioma
  /// de la etiqueta sin tener que traducir la query aparte.
  String get searchQuery => '$label mix';
}

/// Nombres de genero que son iguales en cualquier idioma van tal cual; los que
/// cambian salen de las traducciones.
List<_HomeCategory> _homeCategories() => <_HomeCategory>[
  _HomeCategory.forYou(LocaleKeys.category_for_you.tr()),
  _HomeCategory.genre(LocaleKeys.category_pop.tr()),
  _HomeCategory.genre(LocaleKeys.category_reggaeton.tr()),
  const _HomeCategory.genre('Salsa'),
  const _HomeCategory.genre('Bachata'),
  const _HomeCategory.genre('Merengue'),
  const _HomeCategory.genre('Cumbia'),
  const _HomeCategory.genre('Vallenato'),
  const _HomeCategory.genre('Rock'),
  const _HomeCategory.genre('Trap'),
  const _HomeCategory.genre('Hip hop'),
  _HomeCategory.genre(LocaleKeys.category_electronic.tr()),
  _HomeCategory.genre(LocaleKeys.category_ballads.tr()),
  const _HomeCategory.genre('Jazz'),
  const _HomeCategory.genre('K-pop'),
  _HomeCategory.genre(LocaleKeys.category_classical.tr()),
  _HomeCategory.radio(LocaleKeys.radio.tr()),
];

/// Sugerencias iniciales en la pantalla `home` cuando no hay busqueda ni
/// reproduccion en curso.
///
/// Si el usuario tiene permiso de ubicacion y el GPS activo, muestra musica
/// popular de su pais. Sino, queries aleatorias para evitar pantalla vacia.
class HomeSuggestions extends ConsumerWidget {
  const HomeSuggestions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final asyncSuggestions = ref.watch(homeSuggestionsProvider);
    final history = ref
        .watch(playbackHistoryControllerProvider)
        .take(10)
        .toList();
    final viewCtr = ref.read(homeViewProvider.notifier);

    return asyncSuggestions.when(
      data: (result) {
        if (result.suggestions.isEmpty) {
          return _EmptyState(
            onRetry: () => ref.read(homeSuggestionsProvider.notifier).refresh(),
          );
        }

        // Al tocar una sugerencia del home encolamos toda la lista centrada en
        // la cancion tocada. Esto arranca el prefetch rodante en segundo plano
        // de las siguientes pistas (ver AutoplayQueueController._pumpPrefetch)
        // para que el boton "next" pueda avanzar al instante.
        void onSuggestionTap(YouTubeSearchSuggestion suggestion) {
          final items = result.suggestions;
          final index = items.indexWhere(
            (s) => s.videoId == suggestion.videoId,
          );
          final notifier = ref.read(autoplayQueueControllerProvider.notifier);
          if (ref.read(autoplayEnabledControllerProvider) && index >= 0) {
            notifier.enqueue(items, index);
          } else {
            notifier.clear();
          }
          viewCtr.listen(suggestion);
        }

        void onCategory(_HomeCategory category) {
          switch (category.kind) {
            case _HomeCategoryKind.forYou:
              ref.read(homeSuggestionsProvider.notifier).refresh();
            case _HomeCategoryKind.radio:
              context.go('/radio');
            case _HomeCategoryKind.genre:
              viewCtr.showListSearch(category.searchQuery);
          }
        }

        return _SuggestionsGrid(
          items: result.suggestions,
          history: history,
          userName: null,
          onCategory: onCategory,
          onTap: onSuggestionTap,
          onHistoryTap: (entry) {
            if (entry.kind == PlaybackHistoryKind.radio) {
              context.go('/radio');
              return;
            }
            final suggestions = history
                .where((e) => e.kind != PlaybackHistoryKind.radio)
                .map(
                  (e) => YouTubeSearchSuggestion(
                    videoId: e.id,
                    displayText: e.title,
                    channelTitle: e.subtitle,
                    thumbnailUrl: e.thumbnailUrl,
                  ),
                )
                .toList(growable: false);
            final selectedIndex = suggestions.indexWhere(
              (s) => s.videoId == entry.id,
            );
            if (selectedIndex < 0) return;
            ref
                .read(autoplayQueueControllerProvider.notifier)
                .enqueue(suggestions, selectedIndex);
            viewCtr.listen(suggestions[selectedIndex]);
          },
          onRefresh: () => ref.read(homeSuggestionsProvider.notifier).refresh(),
        );
      },
      error: (error, stack) => Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.cloud_off_rounded,
                size: 48,
                color: colors.onSurfaceVariant,
              ),
              const SizedBox(height: 12),
              Text(
                LocaleKeys.error.tr(),
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 16),
              FilledButton.tonal(
                onPressed: () =>
                    ref.read(homeSuggestionsProvider.notifier).refresh(),
                child: Text(LocaleKeys.retry.tr()),
              ),
            ],
          ),
        ),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator.adaptive(strokeWidth: 2),
      ),
    );
  }
}

/// Encabezado "Descubre" con saludo segun la hora, igual al diseno StreamBeat.
class _DiscoverHeader extends StatelessWidget {
  const _DiscoverHeader();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final hour = DateTime.now().hour;
    final greetingKey = hour < 12
        ? LocaleKeys.greeting_morning
        : hour < 19
        ? LocaleKeys.greeting_afternoon
        : LocaleKeys.greeting_evening;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          greetingKey.tr(),
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colors.onSurfaceVariant,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          LocaleKeys.discover.tr(),
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w800,
            letterSpacing: -0.6,
          ),
        ),
      ],
    );
  }
}

/// Fila de chips de categoria del home. "Para ti" queda activo (verde solido);
/// el resto dispara una busqueda por genero o navega a radio.
class _CategoryChips extends StatelessWidget {
  const _CategoryChips({required this.onCategory});

  final void Function(_HomeCategory) onCategory;

  @override
  Widget build(BuildContext context) {
    final categories = _homeCategories();

    return SizedBox(
      height: 38,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        itemCount: categories.length,
        separatorBuilder: (_, _) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final category = categories[index];
          return _CategoryChip(
            label: category.label,
            selected: category.kind == _HomeCategoryKind.forYou,
            onTap: () => onCategory(category),
          );
        },
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  const _CategoryChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Material(
      color: selected ? colors.primary : colors.surfaceContainerHighest,
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Center(
            widthFactor: 1,
            child: Text(
              label,
              style: theme.textTheme.labelLarge?.copyWith(
                color: selected ? colors.onPrimary : colors.onSurface,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SuggestionsGrid extends StatelessWidget {
  const _SuggestionsGrid({
    required this.items,
    required this.history,
    required this.userName,
    required this.onCategory,
    required this.onTap,
    required this.onHistoryTap,
    required this.onRefresh,
  });

  final List<YouTubeSearchSuggestion> items;
  final List<PlaybackHistoryEntry> history;
  final String? userName;
  final void Function(_HomeCategory) onCategory;
  final void Function(YouTubeSearchSuggestion) onTap;
  final void Function(PlaybackHistoryEntry) onHistoryTap;
  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();
    if (supportsFlowDesktopShell && useFlowWideLayout(context)) {
      return _WebSuggestionsGrid(
        items: items,
        history: history,
        userName: userName,
        onCategory: onCategory,
        onTap: onTap,
        onHistoryTap: onHistoryTap,
        onRefresh: onRefresh,
      );
    }

    final featured = items.first;
    final rest = items.skip(1).toList(growable: false);

    return RefreshIndicator(
      onRefresh: () async => onRefresh(),
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 6),
            sliver: SliverToBoxAdapter(child: const _DiscoverHeader()),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 16),
            sliver: SliverToBoxAdapter(
              child: _CategoryChips(onCategory: onCategory),
            ),
          ),
          if (history.isNotEmpty)
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 18),
              sliver: SliverToBoxAdapter(
                child: _HistoryStrip(items: history, onTap: onHistoryTap),
              ),
            ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
            sliver: SliverToBoxAdapter(
              child: _FeaturedCard(
                suggestion: featured,
                onTap: () => onTap(featured),
              ),
            ),
          ),
          if (rest.isNotEmpty)
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.68,
                ),
                delegate: SliverChildBuilderDelegate((context, index) {
                  final suggestion = rest[index];
                  return _PlaylistCard(
                    suggestion: suggestion,
                    onTap: () => onTap(suggestion),
                  );
                }, childCount: rest.length),
              ),
            ),
        ],
      ),
    );
  }
}

/// Inicio en escritorio (diseno StreamBeat): saludo grande, hero destacado y
/// rejillas de caratulas a todo el ancho. Pinta sobre la superficie opaca del
/// shell para que el escritorio quede plano y oscuro, sin el lavado de acento.
class _WebSuggestionsGrid extends StatelessWidget {
  const _WebSuggestionsGrid({
    required this.items,
    required this.history,
    required this.userName,
    required this.onCategory,
    required this.onTap,
    required this.onHistoryTap,
    required this.onRefresh,
  });

  final List<YouTubeSearchSuggestion> items;
  final List<PlaybackHistoryEntry> history;
  final String? userName;
  final void Function(_HomeCategory) onCategory;
  final void Function(YouTubeSearchSuggestion) onTap;
  final void Function(PlaybackHistoryEntry) onHistoryTap;
  final VoidCallback onRefresh;

  static const _gridDelegate = SliverGridDelegateWithMaxCrossAxisExtent(
    maxCrossAxisExtent: 230,
    mainAxisSpacing: 20,
    crossAxisSpacing: 20,
    childAspectRatio: 0.80,
  );

  @override
  Widget build(BuildContext context) {
    final featured = items.first;
    final madeForYou = items.skip(1).take(10).toList(growable: false);

    return RefreshIndicator(
      onRefresh: () async => onRefresh(),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: flowContentMaxWidth),
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              // Saludo grande + refrescar
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(40, 30, 40, 0),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    children: [
                      Expanded(child: _WebGreeting(userName: userName)),
                      TextButton.icon(
                        onPressed: onRefresh,
                        icon: const Icon(Icons.refresh_rounded, size: 20),
                        label: Text(LocaleKeys.retry.tr()),
                      ),
                    ],
                  ),
                ),
              ),
              // Chips de categoria (filtros funcionales)
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(40, 18, 40, 0),
                sliver: SliverToBoxAdapter(
                  child: _CategoryChips(onCategory: onCategory),
                ),
              ),
              // Hero destacado a todo el ancho
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(40, 26, 40, 0),
                sliver: SliverToBoxAdapter(
                  child: _WebHero(
                    suggestion: featured,
                    onTap: () => onTap(featured),
                  ),
                ),
              ),
              // Hecho para ti
              if (madeForYou.isNotEmpty) ...[
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(40, 34, 40, 16),
                  sliver: SliverToBoxAdapter(
                    child: _WebSectionHeader(
                      title: LocaleKeys.made_for_you.tr(),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 40, 8),
                  sliver: SliverGrid(
                    gridDelegate: _gridDelegate,
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final s = madeForYou[index];
                      return _WebArtCard(
                        imageUrl: s.thumbnailUrl,
                        title: s.displayText,
                        subtitle: s.channelTitle.isEmpty
                            ? null
                            : s.channelTitle,
                        onTap: () => onTap(s),
                      );
                    }, childCount: madeForYou.length),
                  ),
                ),
              ],
              // Escuchado recientemente
              if (history.isNotEmpty) ...[
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(40, 24, 40, 16),
                  sliver: SliverToBoxAdapter(
                    child: _WebSectionHeader(
                      title: LocaleKeys.recently_played.tr(),
                      onSeeAll: () => context.go('/library'),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 40, 48),
                  sliver: SliverGrid(
                    gridDelegate: _gridDelegate,
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final entry = history[index];
                      return _WebArtCard(
                        imageUrl: entry.thumbnailUrl,
                        title: entry.title,
                        subtitle: entry.subtitle.isEmpty
                            ? null
                            : entry.subtitle,
                        fallbackIcon: entry.kind == PlaybackHistoryKind.radio
                            ? Icons.radio_rounded
                            : Icons.music_note_rounded,
                        onTap: () => onHistoryTap(entry),
                      );
                    }, childCount: history.length),
                  ),
                ),
              ] else
                const SliverToBoxAdapter(child: SizedBox(height: 48)),
            ],
          ),
        ),
      ),
    );
  }
}

/// Saludo "Buenas tardes, {nombre}" del inicio en escritorio.
class _WebGreeting extends StatelessWidget {
  const _WebGreeting({required this.userName});

  final String? userName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hour = DateTime.now().hour;
    final greetingKey = hour < 12
        ? LocaleKeys.greeting_morning
        : hour < 19
        ? LocaleKeys.greeting_afternoon
        : LocaleKeys.greeting_evening;
    final name = userName?.trim();
    final text = (name != null && name.isNotEmpty)
        ? '${greetingKey.tr()}, $name'
        : greetingKey.tr();

    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: theme.textTheme.headlineMedium?.copyWith(
        fontWeight: FontWeight.w800,
        letterSpacing: -0.6,
      ),
    );
  }
}

/// Encabezado de seccion ("Hecho para ti", "Escuchado recientemente") con un
/// "Ver todo" opcional a la derecha.
class _WebSectionHeader extends StatelessWidget {
  const _WebSectionHeader({required this.title, this.onSeeAll});

  final String title;
  final VoidCallback? onSeeAll;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        if (onSeeAll != null)
          TextButton(
            onPressed: onSeeAll,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              foregroundColor: colors.onSurfaceVariant,
            ),
            child: Text(LocaleKeys.see_all.tr()),
          ),
      ],
    );
  }
}

/// Banner destacado a todo el ancho del inicio en escritorio. Usa la caratula
/// del primer resultado con un degradado para legibilidad y un boton blanco
/// "Reproducir" (toda la tarjeta reproduce al tocar).
class _WebHero extends StatelessWidget {
  const _WebHero({required this.suggestion, required this.onTap});

  final YouTubeSearchSuggestion suggestion;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final image = suggestion.thumbnailUrl;

    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        // El Stack se dimensiona segun el contenido (el hijo no posicionado),
        // con una altura minima de banner. Asi el hero crece si el titulo
        // ocupa dos lineas y nunca desborda.
        child: Stack(
          children: [
            Positioned.fill(
              child: image.isNotEmpty
                  ? Image.network(
                      image,
                      fit: BoxFit.cover,
                      errorBuilder: (_, _, _) =>
                          _GradientPlaceholder(colors: colors),
                    )
                  : _GradientPlaceholder(colors: colors),
            ),
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [
                      colors.scrim.withValues(alpha: 0.10),
                      colors.scrim.withValues(alpha: 0.82),
                    ],
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      colors.scrim.withValues(alpha: 0.55),
                    ],
                    stops: const [0.45, 1],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(28),
              child: ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 196),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.featured.tr().toUpperCase(),
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: Colors.white.withValues(alpha: 0.9),
                        letterSpacing: 1.4,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      suggestion.displayText,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.headlineMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    if (suggestion.channelTitle.isNotEmpty) ...[
                      const SizedBox(height: 6),
                      Text(
                        suggestion.channelTitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: Colors.white.withValues(alpha: 0.85),
                        ),
                      ),
                    ],
                    const SizedBox(height: 18),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 22,
                        vertical: 11,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.play_arrow_rounded,
                            color: Color(0xFF101014),
                            size: 20,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            LocaleKeys.play.tr(),
                            style: theme.textTheme.labelLarge?.copyWith(
                              color: const Color(0xFF101014),
                            ),
                          ),
                        ],
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

/// Tarjeta de caratula cuadrada con titulo y subtitulo, para las rejillas del
/// inicio en escritorio ("Hecho para ti" y "Escuchado recientemente").
class _WebArtCard extends StatelessWidget {
  const _WebArtCard({
    required this.imageUrl,
    required this.title,
    required this.onTap,
    this.subtitle,
    this.fallbackIcon,
  });

  final String imageUrl;
  final String title;
  final String? subtitle;
  final IconData? fallbackIcon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    Widget placeholder() => fallbackIcon != null
        ? DecoratedBox(
            decoration: BoxDecoration(
              color: colors.surfaceContainerHigh,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Center(
              child: Icon(fallbackIcon, color: colors.primary, size: 30),
            ),
          )
        : _GradientPlaceholder(colors: colors);

    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: imageUrl.isEmpty
                  ? placeholder()
                  : Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      errorBuilder: (_, _, _) => placeholder(),
                    ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 2),
            Text(
              subtitle!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodySmall,
            ),
          ],
        ],
      ),
    );
  }
}

class _HistoryStrip extends StatelessWidget {
  const _HistoryStrip({required this.items, required this.onTap});

  final List<PlaybackHistoryEntry> items;
  final ValueChanged<PlaybackHistoryEntry> onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                LocaleKeys.recently_played.tr(),
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            TextButton(
              onPressed: () => context.go('/library'),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                minimumSize: const Size(0, 0),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                LocaleKeys.see_all.tr(),
                style: theme.textTheme.labelLarge?.copyWith(
                  color: colors.primary,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 92,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            separatorBuilder: (_, _) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              final item = items[index];
              final fallbackArtwork = ColoredBox(
                color: colors.surfaceContainerHighest,
                child: Center(
                  child: Icon(
                    item.kind == PlaybackHistoryKind.radio
                        ? Icons.radio_rounded
                        : Icons.music_note_rounded,
                    color: colors.primary,
                  ),
                ),
              );
              return SizedBox(
                width: 230,
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () => onTap(item),
                  child: Ink(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: colors.surfaceContainerHigh,
                      border: Border.all(color: colors.outlineVariant),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: SizedBox.square(
                            dimension: 56,
                            child: item.thumbnailUrl.isEmpty
                                ? fallbackArtwork
                                : Image.network(
                                    item.thumbnailUrl,
                                    fit: BoxFit.cover,
                                    errorBuilder: (_, _, _) => fallbackArtwork,
                                  ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                item.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              if (item.subtitle.isNotEmpty)
                                Text(
                                  item.subtitle,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: colors.onSurfaceVariant,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

/// Card destacada para el primer resultado: ocupa todo el ancho con la
/// imagen como fondo y un degradado sobre el cual se lee el titulo.
class _FeaturedCard extends StatelessWidget {
  const _FeaturedCard({required this.suggestion, required this.onTap});

  final YouTubeSearchSuggestion suggestion;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final image = suggestion.thumbnailUrl;

    return InkWell(
      borderRadius: BorderRadius.circular(28),
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(28),
              child: image.isNotEmpty
                  ? Image.network(
                      image,
                      fit: BoxFit.cover,
                      errorBuilder: (_, _, _) =>
                          _GradientPlaceholder(colors: colors),
                    )
                  : _GradientPlaceholder(colors: colors),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(28),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      colors.scrim.withValues(alpha: 0.35),
                      colors.scrim.withValues(alpha: 0.9),
                    ],
                    stops: const [0.15, 0.55, 1.0],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              bottom: 20,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: colors.primary,
                          ),
                          child: Text(
                            LocaleKeys.featured.tr().toUpperCase(),
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: colors.onPrimary,
                              letterSpacing: 1.2,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          suggestion.displayText,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.titleLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.2,
                            shadows: [
                              Shadow(
                                color: colors.scrim.withValues(alpha: 0.5),
                                blurRadius: 8,
                              ),
                            ],
                          ),
                        ),
                        if (suggestion.channelTitle.isNotEmpty) ...[
                          const SizedBox(height: 4),
                          Text(
                            suggestion.channelTitle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: Colors.white.withValues(alpha: 0.85),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colors.primary,
                      boxShadow: [
                        BoxShadow(
                          color: colors.primary.withValues(alpha: 0.45),
                          blurRadius: 16,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.play_arrow_rounded,
                      color: colors.onPrimary,
                      size: 32,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Card tipo "playlist": imagen cuadrada arriba con el boton de play encima,
/// titulo y autor abajo.
class _PlaylistCard extends StatelessWidget {
  const _PlaylistCard({required this.suggestion, required this.onTap});

  final YouTubeSearchSuggestion suggestion;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final image = suggestion.thumbnailUrl;
    final isDark = theme.brightness == Brightness.dark;

    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: image.isNotEmpty
                      ? Image.network(
                          image,
                          fit: BoxFit.cover,
                          errorBuilder: (_, _, _) =>
                              _GradientPlaceholder(colors: colors),
                        )
                      : _GradientPlaceholder(colors: colors),
                ),
                Positioned(
                  right: 10,
                  bottom: 10,
                  child: Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colors.primary,
                      boxShadow: [
                        BoxShadow(
                          color: colors.scrim.withValues(
                            alpha: isDark ? 0.45 : 0.25,
                          ),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.play_arrow_rounded,
                      color: colors.onPrimary,
                      size: 26,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            suggestion.displayText,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
              height: 1.2,
            ),
          ),
          if (suggestion.channelTitle.isNotEmpty) ...[
            const SizedBox(height: 2),
            Text(
              suggestion.channelTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodySmall,
            ),
          ],
        ],
      ),
    );
  }
}

class _GradientPlaceholder extends StatelessWidget {
  const _GradientPlaceholder({required this.colors});

  final ColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [colors.primary, colors.secondary],
        ),
      ),
      child: Center(
        child: Icon(
          Icons.library_music_rounded,
          color: colors.onPrimary,
          size: 32,
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.library_music_rounded,
              size: 48,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            const SizedBox(height: 12),
            Text(
              LocaleKeys.no_suggestions.tr(),
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 16),
            FilledButton.tonal(
              onPressed: onRetry,
              child: Text(LocaleKeys.retry.tr()),
            ),
          ],
        ),
      ),
    );
  }
}

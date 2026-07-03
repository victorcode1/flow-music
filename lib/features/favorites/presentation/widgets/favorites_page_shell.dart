import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flutter/material.dart';

/// Shell visual de la pantalla de favoritos con titulo, tabs y contenido.
class FavoritesPageShell extends StatelessWidget {
  const FavoritesPageShell({
    super.key,
    required this.tabs,
    required this.tabViews,
  });

  final List<Widget> tabs;
  final List<Widget> tabViews;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return DefaultTabController(
      length: tabs.length,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Text(
              LocaleKeys.favorites.tr(),
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w800,
                color: colors.onSurface,
              ),
            ),
          ),
          TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            labelStyle: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w700,
            ),
            tabs: tabs,
          ),
          Expanded(child: TabBarView(children: tabViews)),
        ],
      ),
    );
  }
}

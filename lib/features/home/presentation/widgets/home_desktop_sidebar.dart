import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/routes/routes.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Sidebar fija para la variante desktop del home.
class HomeDesktopSidebar extends ConsumerWidget {
  const HomeDesktopSidebar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final route = ref.read(routeProvider);
    final currentPath = GoRouterState.of(context).uri.path;

    return Container(
      width: 232,
      decoration: BoxDecoration(
        color: colors.surfaceContainerLowest,
        border: Border(right: BorderSide(color: colors.outlineVariant)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 20, 14, 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _HomeDesktopNavItem(
                icon: Icons.home_rounded,
                label: LocaleKeys.home.tr(),
                selected: currentPath == '/home' || currentPath == '/playSong',
                onTap: () => route.go('/home'),
              ),
              _HomeDesktopNavItem(
                icon: Icons.library_music_rounded,
                label: LocaleKeys.library.tr(),
                selected: currentPath == '/library',
                onTap: () => route.go('/library'),
              ),
              _HomeDesktopNavItem(
                icon: Icons.favorite_rounded,
                label: LocaleKeys.favorites.tr(),
                selected: currentPath == '/favorites',
                onTap: () => route.go('/favorites'),
              ),
              _HomeDesktopNavItem(
                icon: Icons.radio_rounded,
                label: LocaleKeys.radio.tr(),
                selected: currentPath == '/radio',
                onTap: () => route.go('/radio'),
              ),
              _HomeDesktopNavItem(
                icon: Icons.travel_explore_rounded,
                label: LocaleKeys.radio_map_explorer.tr(),
                selected: currentPath == '/radio-map',
                onTap: () => route.go('/radio-map'),
              ),
              const SizedBox(height: 12),
              Divider(color: colors.outlineVariant),
              const SizedBox(height: 12),
              _HomeDesktopNavItem(
                icon: Icons.settings_rounded,
                label: LocaleKeys.settings.tr(),
                selected: currentPath == '/settings',
                onTap: () => route.go('/settings'),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: colors.surfaceContainer,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: colors.outlineVariant),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.auto_awesome_rounded,
                      color: colors.primary,
                      size: 18,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'v0.1.0',
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: colors.onSurfaceVariant,
                        ),
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
  }
}

/// Item navegable de la sidebar desktop del home.
class _HomeDesktopNavItem extends StatelessWidget {
  const _HomeDesktopNavItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Material(
        color: selected
            ? colors.primary.withValues(alpha: 0.14)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: selected ? colors.primary : colors.onSurfaceVariant,
                  size: 20,
                ),
                const SizedBox(width: 13),
                Expanded(
                  child: Text(
                    label,
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: selected ? colors.primary : colors.onSurfaceVariant,
                      fontWeight: selected ? FontWeight.w700 : FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/routes/routes.dart';
import 'package:flow_music/core/theme/custom_theme.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flow_music/pages/shared/custom_info_version/custom_info_version.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomDrawe extends ConsumerWidget {
  const CustomDrawe({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final extras = theme.extension<FlowThemeExtras>();
    final route = ref.read(routeProvider);

    return Drawer(
      width: MediaQuery.of(context).size.width * 0.78,
      backgroundColor: Colors.transparent,
      child: ClipRRect(
        borderRadius: const BorderRadius.horizontal(right: Radius.circular(24)),
        child: Container(
          decoration: BoxDecoration(color: colorScheme.surface),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(gradient: extras?.primaryGradient),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SafeArea(
                      child: Text(
                        'StreamBeat',
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () => Navigator.of(context).maybePop(),
                      tooltip: MaterialLocalizations.of(
                        context,
                      ).closeButtonTooltip,
                    ),
                  ],
                ),
              ),

              // Menu items
              if (kDebugMode)
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    children: [
                      _DrawerMenuItem(
                        icon: Icons.home_rounded,
                        title: LocaleKeys.home.tr(),
                        onTap: () {
                          Navigator.pop(context);
                          route.go('/home');
                        },
                      ),
                      _DrawerMenuItem(
                        icon: Icons.library_music_rounded,
                        title: LocaleKeys.library.tr(),
                        onTap: () {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(LocaleKeys.coming_soon.tr()),
                            ),
                          );
                        },
                      ),
                      _DrawerMenuItem(
                        icon: Icons.favorite_rounded,
                        title: LocaleKeys.favorites.tr(),
                        onTap: () {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(LocaleKeys.coming_soon.tr()),
                            ),
                          );
                        },
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Divider(height: 1),
                      ),
                      _DrawerMenuItem(
                        icon: Icons.settings_rounded,
                        title: LocaleKeys.settings.tr(),
                        onTap: () {
                          Navigator.pop(context);
                          route.go('/settings');
                        },
                      ),
                    ],
                  ),
                ),

              // Footer
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: colorScheme.outlineVariant,
                      width: 1,
                    ),
                  ),
                ),
                child: CustomInfoVersion(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DrawerMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _DrawerMenuItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: colorScheme.surfaceContainerHighest,
        ),
        child: Icon(icon, color: colorScheme.primary, size: 22),
      ),
      title: Text(
        title,
        style: theme.textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w500,
          color: colorScheme.onSurface,
        ),
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}

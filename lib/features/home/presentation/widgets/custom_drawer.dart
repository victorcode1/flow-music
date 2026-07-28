import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/consts/enums.dart';
import 'package:flow_music/core/routes/routes.dart';
import 'package:flow_music/core/theme/custom_theme.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flow_music/features/home/presentation/providers/text_search.dart';
import 'package:flow_music/shared/custom_info_version/custom_info_version.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Drawer principal de la app. Toma todos sus colores del tema activo para
/// conservar contraste en light y dark, y siempre muestra el menu (no se
/// gatea por `kDebugMode`).
class CustomDrawer extends ConsumerWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final extras = theme.extension<FlowThemeExtras>();
    final route = ref.read(routeProvider);

    // El TextEditingController de busqueda vive en un provider keepAlive
    // compartido por la AppBar de home y la del explorador de mapa, asi que
    // al cambiar de seccion lo limpiamos para que el campo no arrastre la
    // consulta anterior. (`_clearSearchOnRouteChange` en HomePage solo
    // cubre rutas anidadas, no los `route.go(...)` top-level del drawer.)
    //
    void goTo(String path) {
      ref.read(searchProvider).clear();
      FocusManager.instance.primaryFocus?.unfocus();
      Navigator.pop(context);
      route.go(path);
    }

    return Drawer(
      width: MediaQuery.of(context).size.width * 0.78,
      backgroundColor: colorScheme.surface,
      surfaceTintColor: colorScheme.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _DrawerHeader(
            title: Variables.name.value,
            gradient: extras?.primaryGradient,
            onClose: () => Navigator.of(context).maybePop(),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 12),
              children: [
                _DrawerMenuItem(
                  icon: Icons.home_rounded,
                  title: LocaleKeys.home.tr(),
                  onTap: () => goTo('/home'),
                ),
                _DrawerMenuItem(
                  icon: Icons.library_music_rounded,
                  title: LocaleKeys.library.tr(),
                  onTap: () => goTo('/library'),
                ),
                _DrawerMenuItem(
                  icon: Icons.favorite_rounded,
                  title: LocaleKeys.favorites.tr(),
                  onTap: () => goTo('/favorites'),
                ),
                _DrawerMenuItem(
                  icon: Icons.radio_rounded,
                  title: LocaleKeys.radio.tr(),
                  onTap: () => goTo('/radio'),
                ),
                _DrawerMenuItem(
                  icon: Icons.travel_explore_rounded,
                  title: LocaleKeys.radio_map_explorer.tr(),
                  onTap: () => goTo('/radio-map'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  child: Divider(height: 1, color: colorScheme.outlineVariant),
                ),
                _DrawerMenuItem(
                  icon: Icons.settings_rounded,
                  title: LocaleKeys.settings.tr(),
                  onTap: () => goTo('/settings'),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: colorScheme.outlineVariant, width: 1),
              ),
            ),
            child: const CustomInfoVersion(),
          ),
        ],
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  final String title;
  final LinearGradient? gradient;
  final VoidCallback onClose;

  const _DrawerHeader({
    required this.title,
    required this.gradient,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 12, 20),
      decoration: BoxDecoration(gradient: gradient),
      child: SafeArea(
        bottom: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
                color: theme.colorScheme.onPrimary,
              ),
            ),
            IconButton(
              icon: Icon(Icons.close, color: theme.colorScheme.onPrimary),
              onPressed: onClose,
              tooltip: MaterialLocalizations.of(context).closeButtonTooltip,
            ),
          ],
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
    final isDark = theme.brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: colorScheme.primary.withValues(
                      alpha: isDark ? 0.18 : 0.12,
                    ),
                  ),
                  child: Icon(icon, color: colorScheme.primary, size: 22),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right_rounded,
                  size: 20,
                  color: colorScheme.onSurfaceVariant,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

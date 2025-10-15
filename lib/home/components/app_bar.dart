import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/consts/enums.dart';
import 'package:flow_music/core/routes/routes.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flow_music/home/providers/text_search.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppAbarMain extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  final Function(String)? query;
  final Future Function() showSearch;
  const AppAbarMain({super.key, this.query, required this.showSearch});

  @override
  ConsumerState<AppAbarMain> createState() => _AppAbarMainState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 92);
}

class _AppAbarMainState extends ConsumerState<AppAbarMain> {
  late final FocusNode focusNode;

  @override
  void initState() {
    super.initState();

    focusNode = FocusNode();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchController = ref.watch(searchProvider);
    final theme = Theme.of(context);
    final route = ref.read(routeProvider);
    final colorScheme = theme.colorScheme;

    return AppBar(
      backgroundColor: colorScheme.surface,
      elevation: 0,
      toolbarHeight: 70,
      leadingWidth: 70,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20, top: 8, bottom: 8),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: colorScheme.surfaceContainerHighest,
          ),
          child: IconButton(
            icon: Icon(
              Icons.menu_rounded,
              color: colorScheme.onSurface,
              size: 22,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(context.tr('coming_soon'))),
              );
            },
          ),
        ),
      ),
      title: Text(
        Variables.name.value,
        style: theme.textTheme.headlineMedium?.copyWith(
          fontWeight: FontWeight.w700,
          letterSpacing: -0.5,
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: colorScheme.surfaceContainerHighest,
          ),
          child: IconButton(
            icon: Icon(
              Icons.settings_rounded,
              color: colorScheme.onSurface,
              size: 22,
            ),
            onPressed: () => route.go('/settings'),
          ),
        ),
        const SizedBox(width: 20),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(76),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Container(
            height: 52,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26),
              color: colorScheme.surfaceContainerHighest,
              boxShadow: [
                BoxShadow(
                  color: colorScheme.primary.withOpacity(0.04),
                  blurRadius: 12,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              children: [
                IconButton(
                  onPressed: widget.showSearch,
                  icon: Icon(
                    Icons.search_rounded,
                    color: colorScheme.onSurfaceVariant,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    autofocus: true,
                    focusNode: focusNode,
                    controller: searchController,
                    style: theme.textTheme.bodyMedium,
                    onChanged: widget.query,
                    decoration: InputDecoration(
                      hintText: LocaleKeys.search_music.tr(),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintStyle: theme.textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant.withOpacity(0.6),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 14),
                      isDense: true,
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

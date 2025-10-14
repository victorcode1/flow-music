import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/consts/enums.dart';
import 'package:flow_music/core/routes/routes.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flow_music/provider/search.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppAbarMain extends ConsumerWidget implements PreferredSizeWidget {
  const AppAbarMain({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = TextEditingController();
    Timer? debounce;
    final FocusNode focusNode = FocusNode();
    final theme = Theme.of(context);
    final route = ref.read(routeProvider);
    return SafeArea(
      child: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        elevation: theme.appBarTheme.elevation,
        leading: IconButton(
          icon: Icon(Icons.menu, color: theme.appBarTheme.foregroundColor),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(context.tr('coming_soon'))),
            );
          },
        ),
        title: Text(
          Variables.name.value,
          style: theme.appBarTheme.titleTextStyle ?? theme.textTheme.titleLarge,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: theme.appBarTheme.foregroundColor),
            onPressed: () {
              // Expand search or navigate to search page
              context.go('/search');
            },
          ),
          const SizedBox(width: 8),
          FloatingActionButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(LocaleKeys.coming_soon.tr())),
              );
            },
            elevation: 1,
            mini: true,
            backgroundColor: theme.colorScheme.primary,
            child: Icon(Icons.person, color: theme.colorScheme.onPrimary),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon:
                Icon(Icons.settings, color: theme.appBarTheme.foregroundColor),
            onPressed: () => route.go('/settings'),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              focusNode: focusNode,
              controller: searchController,
              onChanged: (query) {
                if (debounce?.isActive ?? false) debounce?.cancel();
                debounce = Timer(const Duration(milliseconds: 1000), () {
                  ref.watch(searchProvider.notifier).setValue(query);
                  context.go('/search');
                });
              },
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                hintText: LocaleKeys.search_music.tr(),
                hintStyle: TextStyle(
                    color: theme.inputDecorationTheme.hintStyle?.color ??
                        Colors.grey),
                prefixIcon: Icon(Icons.search, color: theme.iconTheme.color),
                filled: true,
                fillColor: theme.inputDecorationTheme.fillColor,
                border: theme.inputDecorationTheme.border,
                focusedBorder: theme.inputDecorationTheme.focusedBorder,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 80);
}

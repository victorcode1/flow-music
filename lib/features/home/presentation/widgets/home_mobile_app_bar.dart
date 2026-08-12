import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/consts/enums.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flutter/material.dart';

class HomeMobileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeMobileAppBar({
    super.key,
    required this.onSearch,
    this.isSearching = false,
    this.searchController,
    this.onCloseSearch,
  }) : assert(!isSearching || searchController != null);

  final VoidCallback onSearch;
  final bool isSearching;
  final TextEditingController? searchController;
  final VoidCallback? onCloseSearch;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return AppBar(
      backgroundColor: Colors.transparent,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      title: isSearching
          ? TextField(
              key: const Key('station-search-field'),
              controller: searchController,
              autofocus: true,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                hintText: LocaleKeys.search_radio.tr(),
                prefixIcon: const Icon(Icons.search_rounded),
                filled: true,
                fillColor: colors.surfaceContainerHighest,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
              ),
            )
          : Text(
              Variables.name.value,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
            ),
      actions: [
        Container(
          width: 44,
          height: 44,
          margin: const EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
            color: colors.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(14),
          ),
          child: IconButton(
            tooltip: isSearching
                ? LocaleKeys.clear.tr()
                : LocaleKeys.search_radio.tr(),
            onPressed: isSearching ? onCloseSearch : onSearch,
            icon: Icon(
              isSearching ? Icons.close_rounded : Icons.search_rounded,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 20);
}

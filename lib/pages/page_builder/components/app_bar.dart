import 'dart:async';

import 'package:flow_music/provider/search.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppAbarMain extends ConsumerWidget implements PreferredSizeWidget {
  const AppAbarMain({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController searchController = TextEditingController();
    Timer? debounce;
    final FocusNode focusNode = FocusNode();
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
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
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 34,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.right,
                  decoration: const InputDecoration(
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 34,
                          fontWeight: FontWeight.w500),
                      hintText: 'Search',
                      border: InputBorder.none)),
            ),
          ),
          const SizedBox(width: 20),
          const SizedBox(
            height: 40,
            width: 40,
            child: FloatingActionButton(
                onPressed: null,
                elevation: 1,
                shape: CircleBorder(),
                backgroundColor: Colors.white,
                child: Icon(Icons.person)),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 20);
}

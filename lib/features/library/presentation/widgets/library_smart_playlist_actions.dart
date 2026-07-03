import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flow_music/features/library/presentation/controllers/library_page_controller.dart';
import 'package:flutter/material.dart';

class LibrarySmartPlaylistActions extends StatelessWidget {
  const LibrarySmartPlaylistActions({super.key, required this.onCreate});

  final ValueChanged<SmartPlaylistKind> onCreate;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ActionChip(
            avatar: const Icon(Icons.download_done_rounded),
            label: Text(LocaleKeys.smart_downloaded.tr()),
            onPressed: () => onCreate(SmartPlaylistKind.downloaded),
          ),
          const SizedBox(width: 8),
          ActionChip(
            avatar: const Icon(Icons.favorite_rounded),
            label: Text(LocaleKeys.smart_favorites.tr()),
            onPressed: () => onCreate(SmartPlaylistKind.favorites),
          ),
          const SizedBox(width: 8),
          ActionChip(
            avatar: const Icon(Icons.trending_up_rounded),
            label: Text(LocaleKeys.smart_most_played.tr()),
            onPressed: () => onCreate(SmartPlaylistKind.mostPlayed),
          ),
        ],
      ),
    );
  }
}

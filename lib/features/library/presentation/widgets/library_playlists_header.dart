import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flutter/material.dart';

class LibraryPlaylistsHeader extends StatelessWidget {
  const LibraryPlaylistsHeader({
    super.key,
    required this.onCreate,
    required this.onImport,
    required this.colors,
  });

  final VoidCallback onCreate;
  final VoidCallback onImport;
  final ColorScheme colors;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Expanded(
          child: Text(
            LocaleKeys.playlists.tr(),
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w800,
              color: colors.onSurface,
            ),
          ),
        ),
        FilledButton.icon(
          onPressed: onCreate,
          icon: const Icon(Icons.add_rounded),
          label: Text(LocaleKeys.new_playlist.tr()),
        ),
        const SizedBox(width: 8),
        IconButton.outlined(
          onPressed: onImport,
          icon: const Icon(Icons.file_upload_rounded),
          tooltip: LocaleKeys.import_playlist.tr(),
        ),
      ],
    );
  }
}

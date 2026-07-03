import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flow_music/features/library/data/downloaded_audio.dart';
import 'package:flow_music/features/playlists/data/playlist.dart';
import 'package:flow_music/features/playlists/presentation/controllers/playlists_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const String _createPlaylistAction = '__create_playlist__';

Future<Playlist?> showCreatePlaylistFlow({
  required BuildContext context,
  required WidgetRef ref,
  DownloadedAudio? firstAudio,
}) async {
  final name = await _askPlaylistName(context);
  if (name == null || name.trim().isEmpty) return null;

  final controller = ref.read(playlistsControllerProvider.notifier);
  final playlist = await controller.create(name);
  if (firstAudio != null) {
    await controller.addItem(playlist.id, firstAudio);
  }
  if (!context.mounted) return playlist;

  _showPlaylistSnackBar(
    context,
    firstAudio == null
        ? LocaleKeys.playlist_created.tr()
        : LocaleKeys.playlist_added.tr(),
  );
  return playlist;
}

Future<void> showAddToPlaylistFlow({
  required BuildContext context,
  required WidgetRef ref,
  required DownloadedAudio audio,
}) async {
  final playlists = ref.read(playlistsControllerProvider);
  if (playlists.isEmpty) {
    await showCreatePlaylistFlow(context: context, ref: ref, firstAudio: audio);
    return;
  }

  final selectedPlaylistId = await showModalBottomSheet<String>(
    context: context,
    showDragHandle: true,
    builder: (context) => _AddToPlaylistSheet(playlists: playlists),
  );
  if (!context.mounted || selectedPlaylistId == null) return;

  if (selectedPlaylistId == _createPlaylistAction) {
    await showCreatePlaylistFlow(context: context, ref: ref, firstAudio: audio);
    return;
  }

  await ref
      .read(playlistsControllerProvider.notifier)
      .addItem(selectedPlaylistId, audio);
  if (!context.mounted) return;
  _showPlaylistSnackBar(context, LocaleKeys.playlist_added.tr());
}

Future<String?> _askPlaylistName(BuildContext context) async {
  return showDialog<String>(
    context: context,
    builder: (context) => const _PlaylistNameDialog(),
  );
}

class _PlaylistNameDialog extends StatefulWidget {
  const _PlaylistNameDialog();

  @override
  State<_PlaylistNameDialog> createState() => _PlaylistNameDialogState();
}

class _PlaylistNameDialogState extends State<_PlaylistNameDialog> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    Navigator.of(context).pop(_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(LocaleKeys.create_playlist.tr()),
      content: TextField(
        controller: _controller,
        autofocus: true,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          labelText: LocaleKeys.playlist_name.tr(),
          prefixIcon: const Icon(Icons.queue_music_rounded),
        ),
        onSubmitted: (_) => _submit(),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(MaterialLocalizations.of(context).cancelButtonLabel),
        ),
        FilledButton(
          onPressed: _submit,
          child: Text(LocaleKeys.create_playlist.tr()),
        ),
      ],
    );
  }
}

class _AddToPlaylistSheet extends StatelessWidget {
  const _AddToPlaylistSheet({required this.playlists});

  final List<Playlist> playlists;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return SafeArea(
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
        children: [
          Text(
            LocaleKeys.add_to_playlist.tr(),
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 8),
          ListTile(
            leading: Icon(Icons.add_rounded, color: colors.primary),
            title: Text(LocaleKeys.new_playlist.tr()),
            onTap: () => Navigator.of(context).pop(_createPlaylistAction),
          ),
          const Divider(),
          ...playlists.map(
            (playlist) => ListTile(
              leading: Icon(Icons.queue_music_rounded, color: colors.primary),
              title: Text(
                playlist.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(songCountLabel(playlist.itemCount)),
              onTap: () => Navigator.of(context).pop(playlist.id),
            ),
          ),
        ],
      ),
    );
  }
}

String songCountLabel(int count) {
  if (count == 1) return LocaleKeys.one_song_count.tr();
  return LocaleKeys.songs_count.tr(args: [count.toString()]);
}

void _showPlaylistSnackBar(BuildContext context, String message) {
  final messenger = ScaffoldMessenger.maybeOf(context);
  messenger?.hideCurrentSnackBar();
  messenger?.showSnackBar(
    SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
  );
}

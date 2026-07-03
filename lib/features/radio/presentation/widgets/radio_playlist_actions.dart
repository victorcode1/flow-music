import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flow_music/features/radio/data/models/radio_playlist.dart';
import 'package:flow_music/features/radio/data/models/radio_station.dart';
import 'package:flow_music/features/radio/presentation/controllers/radio_playlists_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const String _createRadioPlaylistAction = '__create_radio_playlist__';

Future<RadioPlaylist?> showCreateRadioPlaylistFlow({
  required BuildContext context,
  required WidgetRef ref,
  RadioStation? firstStation,
}) async {
  final name = await _askPlaylistName(context);
  if (name == null || name.trim().isEmpty) return null;

  final controller = ref.read(radioPlaylistsControllerProvider.notifier);
  final playlist = await controller.create(name);
  if (firstStation != null) {
    await controller.addStation(playlist.id, firstStation);
  }
  if (!context.mounted) return playlist;

  _showSnackBar(
    context,
    firstStation == null
        ? LocaleKeys.radio_playlist_created.tr()
        : LocaleKeys.radio_playlist_added.tr(),
  );
  return playlist;
}

Future<void> showAddToRadioPlaylistFlow({
  required BuildContext context,
  required WidgetRef ref,
  required RadioStation station,
}) async {
  final playlists = ref.read(radioPlaylistsControllerProvider);
  if (playlists.isEmpty) {
    await showCreateRadioPlaylistFlow(
      context: context,
      ref: ref,
      firstStation: station,
    );
    return;
  }

  final selectedPlaylistId = await showModalBottomSheet<String>(
    context: context,
    showDragHandle: true,
    builder: (context) => _AddToRadioPlaylistSheet(playlists: playlists),
  );
  if (!context.mounted || selectedPlaylistId == null) return;

  if (selectedPlaylistId == _createRadioPlaylistAction) {
    await showCreateRadioPlaylistFlow(
      context: context,
      ref: ref,
      firstStation: station,
    );
    return;
  }

  await ref
      .read(radioPlaylistsControllerProvider.notifier)
      .addStation(selectedPlaylistId, station);
  if (!context.mounted) return;
  _showSnackBar(context, LocaleKeys.radio_playlist_added.tr());
}

Future<String?> _askPlaylistName(BuildContext context) async {
  return showDialog<String>(
    context: context,
    builder: (context) => const _RadioPlaylistNameDialog(),
  );
}

class _RadioPlaylistNameDialog extends StatefulWidget {
  const _RadioPlaylistNameDialog();

  @override
  State<_RadioPlaylistNameDialog> createState() =>
      _RadioPlaylistNameDialogState();
}

class _RadioPlaylistNameDialogState extends State<_RadioPlaylistNameDialog> {
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

  void _submit() => Navigator.of(context).pop(_controller.text);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(LocaleKeys.create_radio_playlist.tr()),
      content: TextField(
        controller: _controller,
        autofocus: true,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          labelText: LocaleKeys.radio_playlist_name.tr(),
          prefixIcon: const Icon(Icons.radio_rounded),
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
          child: Text(LocaleKeys.create_radio_playlist.tr()),
        ),
      ],
    );
  }
}

class _AddToRadioPlaylistSheet extends StatelessWidget {
  const _AddToRadioPlaylistSheet({required this.playlists});

  final List<RadioPlaylist> playlists;

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
            LocaleKeys.add_to_radio_playlist.tr(),
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 8),
          ListTile(
            leading: Icon(Icons.add_rounded, color: colors.primary),
            title: Text(LocaleKeys.new_radio_playlist.tr()),
            onTap: () => Navigator.of(context).pop(_createRadioPlaylistAction),
          ),
          const Divider(),
          ...playlists.map(
            (playlist) => ListTile(
              leading: Icon(Icons.radio_rounded, color: colors.primary),
              title: Text(
                playlist.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(stationCountLabel(playlist.itemCount)),
              onTap: () => Navigator.of(context).pop(playlist.id),
            ),
          ),
        ],
      ),
    );
  }
}

String stationCountLabel(int count) {
  if (count == 1) return LocaleKeys.one_station_count.tr();
  return LocaleKeys.stations_count.tr(args: [count.toString()]);
}

void _showSnackBar(BuildContext context, String message) {
  final messenger = ScaffoldMessenger.maybeOf(context);
  messenger?.hideCurrentSnackBar();
  messenger?.showSnackBar(
    SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
  );
}

import 'package:flow_music/domain/sources.dart';
import 'package:flow_music/pages/song/controller/song_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SongWidget extends ConsumerStatefulWidget {
  final Map<String?, String?> data;
  const SongWidget({super.key, required this.data});

  @override
  ConsumerState<SongWidget> createState() => _PlaySongState();
}

class _PlaySongState extends ConsumerState<SongWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String? idSong = widget.data['idSong'];
    String? playListId = widget.data['playListId'];
    final controller = ref.watch(songController)
      ..playListSong(playListId: playListId);
    return controller.result(data: idSong!).when(
        data: (data) => ScreenPlay(url: controller.urlSong(data: data)),
        error: (error, stack) => Center(child: Text('Error $error')),
        loading: () => const Center(child: CircularProgressIndicator()));
  }
}

class ScreenPlay extends ConsumerStatefulWidget {
  final String url;
  const ScreenPlay({super.key, required this.url});

  @override
  ConsumerState<ScreenPlay> createState() => _ScreenPlayState();
}

class _ScreenPlayState extends ConsumerState<ScreenPlay>
    with AutomaticKeepAliveClientMixin<ScreenPlay> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final controller = ref.watch(songController)..autoPlay(data: widget.url);
    return _SourceTile(
      title: 'Play Song',
      subtitle: widget.url,
      setSource: () => controller.setSource(source: UrlSource(widget.url)),
      play: () => controller.play(source: UrlSource(widget.url)),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _SourceTile extends StatelessWidget {
  final void Function() setSource;
  final void Function() play;

  final String title;
  final String? subtitle;

  const _SourceTile({
    required this.setSource,
    required this.play,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            tooltip: 'Set Source',
            key: const Key('set_source_button'),
            onPressed: setSource,
            icon: const Icon(Icons.upload_file),
            color: Theme.of(context).primaryColor,
          ),
          IconButton(
            key: const Key('play_button'),
            tooltip: 'Play',
            onPressed: play,
            icon: const Icon(Icons.play_arrow),
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}

import 'package:flow_music/core/const/roots/rutas.dart';
import 'package:flow_music/datasource/model/song_id_response.dart';
import 'package:flow_music/pages/shared/portada_albun/portada_albun.dart';
import 'package:flow_music/pages/shared/search_delegate/search_song.dart';
import 'package:flow_music/pages/shared/seek_bar/seek_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio/just_audio.dart';

import 'controller/song_play_controller.dart';

class SongPlayWidget extends ConsumerStatefulWidget {
  final Map<String?, String?>? data;
  const SongPlayWidget({super.key, this.data});

  @override
  ConsumerState<SongPlayWidget> createState() => _PlaySongState();
}

class _PlaySongState extends ConsumerState<SongPlayWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(songPlayController)
      ..idSong(idSong: widget.data?['idSong']);
    print('data: ${widget.data?['idSong']}');

    return switch ((widget.data?['idSong']?.isEmpty ?? false)) {
      false => FutureBuilder<SongIdResponde?>(
          future: controller.getSong(data: widget.data!['idSong'] ?? ''),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Material(
                  child:
                      Center(child: CircularProgressIndicator(strokeWidth: 2)));
            }
            if (snapshot.hasError) {
              return Scaffold(
                  appBar: AppBar(title: const Text('Error')),
                  body: Center(child: Text('Error ${snapshot.error}')));
            }

            controller.setData(data: snapshot.data);
            return ScreenPlay(
                data: snapshot.data,
                idSong: controller.getIdSong,
                url: controller.urlSong(data: snapshot.data!));
          }),
      true => const ScreenPlay(),
    };
  }
}

class ScreenPlay extends ConsumerStatefulWidget {
  final String? url;
  final SongIdResponde? data;
  final String? idSong;
  const ScreenPlay({super.key, this.url, this.idSong, this.data});

  @override
  ConsumerState<ScreenPlay> createState() => _ScreenPlayState();
}

class _ScreenPlayState extends ConsumerState<ScreenPlay>
    with AutomaticKeepAliveClientMixin<ScreenPlay> {
  @override
  void initState() {
    super.initState();
    ref.read(songPlayController).autoPlay(data: widget.url);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final controller = ref.watch(songPlayController);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: StreamBuilder<SongIdResponde>(
            stream: controller.streamController.stream,
            builder: (context, snapshot) {
              return Text(snapshot.data?.videoDetails?.author ??
                  widget.data?.videoDetails?.author ??
                  '');
            }),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => controller.back(context: context)),
        actions: [
          IconButton(
              icon: const Icon(Icons.search),
              onPressed: () => controller.search(
                  context: context, delegate: SearchSong(ref: ref))),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => context.go(Rutas.home.rootValue),
          ),
        ],
      ),
      body: FutureBuilder(
          future: controller.loadPlayList(idSong: widget.idSong),
          builder: (context, playListSnapshot) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(width: 10),
                    Flexible(
                        child: StreamBuilder<SongIdResponde>(
                            stream: controller.streamController.stream,
                            builder: (context, snapshot) {
                              return Text(
                                  snapshot.data?.videoDetails?.title ??
                                      widget.data?.videoDetails?.title ??
                                      '',
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis);
                            })),
                  ],
                ),
                Expanded(flex: 2, child: SourceTile(data: widget.data)),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    StreamBuilder<PositionData>(
                        stream: controller.positionDataStream(
                            data: playListSnapshot.data),
                        builder: (context, snapshot) {
                          final positionData = snapshot.data;
                          return SizedBox(
                            height: 50,
                            child: SeekBar(
                              duration: positionData?.duration ?? Duration.zero,
                              position: positionData?.position ?? Duration.zero,
                              bufferedPosition:
                                  positionData?.bufferedPosition ??
                                      Duration.zero,
                              onChangeEnd: (duration) =>
                                  controller.seek(duration: duration),
                            ),
                          );
                        }),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: StreamBuilder<PlayerState>(
                          stream: controller.statusStream,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator.adaptive();
                            }
                            if (snapshot.hasError) {
                              return Text('Error ${snapshot.error}');
                            }
                            if (snapshot.data == null) {
                              return const CircularProgressIndicator.adaptive();
                            }
                            if (!snapshot.hasData) {
                              return const SizedBox();
                            }

                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () => controller.prevSong(
                                        data: playListSnapshot.data),
                                    icon: const Icon(
                                        Icons.skip_previous_rounded)),
                                IconButton(
                                    onPressed: () =>
                                        snapshot.data?.playing ?? false
                                            ? controller.setAudioStateStopped()
                                            : controller.replay(),
                                    icon: Icon(snapshot.data!.playing
                                        ? Icons.stop
                                        : Icons.replay)),
                                const SizedBox(width: 10),
                                IconButton(
                                    onPressed: () =>
                                        snapshot.data?.playing ?? false
                                            ? controller.setAudioStatePaused()
                                            : controller.replay(),
                                    icon: Icon(snapshot.data?.playing ?? false
                                        ? Icons.pause
                                        : Icons.play_arrow)),
                                IconButton(
                                    onPressed: () => controller.nextSong(
                                        data: playListSnapshot.data),
                                    icon: const Icon(Icons.skip_next_rounded)),
                              ],
                            );
                          }),
                    ),
                  ],
                )
              ],
            );
          }),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class SourceTile extends ConsumerWidget {
  final SongIdResponde? data;
  const SourceTile({super.key, this.data});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(songPlayController);

    return Column(
      children: [
        Expanded(child: PortadaAlbun(data: data)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const IconButton(onPressed: null, icon: Icon(Icons.music_note)),
            const SizedBox(width: 10),
            IconButton(
                onPressed: () => controller.changeVieo(
                    videoId: data?.videoDetails?.videoId ?? ''),
                icon: const Icon(Icons.video_library_outlined)),
          ],
        ),
      ],
    );
  }
}

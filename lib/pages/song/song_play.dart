import 'package:cached_network_image/cached_network_image.dart';
import 'package:flow_music/core/const/roots/rutas.dart';
import 'package:flow_music/datasource/model/song_id_response.dart';
import 'package:flow_music/pages/shared/search_delegate/search_song.dart';
import 'package:flow_music/pages/shared/seek_bar/seek_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio/just_audio.dart';

import 'controller/song_play_controller.dart';

class SongPlayWidget extends ConsumerStatefulWidget {
  final Map<String?, String?> data;
  const SongPlayWidget({super.key, required this.data});

  @override
  ConsumerState<SongPlayWidget> createState() => _PlaySongState();
}

class _PlaySongState extends ConsumerState<SongPlayWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(songPlayController)
      ..idSong(idSong: widget.data['idSong']);

    return FutureBuilder<SongIdResponde?>(
        future: controller.getSong(data: controller.getIdSong),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(strokeWidth: 2));
          }
          if (snapshot.hasError) {
            return Scaffold(
                appBar: AppBar(title: const Text('Error')),
                body: Center(child: Text('Error ${snapshot.error}')));
          }
          return ScreenPlay(
              data: snapshot.data,
              idSong: widget.data['idSong']!,
              url: controller.urlSong(data: snapshot.data!));
        });
  }
}

class ScreenPlay extends ConsumerStatefulWidget {
  final String url;
  final SongIdResponde? data;
  final String idSong;
  const ScreenPlay(
      {super.key, required this.url, required this.idSong, this.data});

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
    return StreamBuilder<SongIdResponde>(
        stream: controller.streamController.stream,
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(snapshot.data?.videoDetails?.author ??
                  widget.data?.videoDetails?.author ??
                  ''),
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
                              child: Text(
                                  snapshot.data?.videoDetails?.title ??
                                      widget.data?.videoDetails?.title ??
                                      '',
                                  maxLines: 2,
                                  textAlign: TextAlign.end,
                                  overflow: TextOverflow.ellipsis)),
                        ],
                      ),
                      Expanded(
                          flex: 2,
                          child:
                              SourceTile(data: snapshot.data ?? widget.data)),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          StreamBuilder<PositionData>(
                              stream: controller.positionDataStream,
                              builder: (context, snapshot) {
                                final positionData = snapshot.data;
                                return SizedBox(
                                  height: 50,
                                  child: SeekBar(
                                    duration:
                                        positionData?.duration ?? Duration.zero,
                                    position:
                                        positionData?.position ?? Duration.zero,
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
                                    return const CircularProgressIndicator
                                        .adaptive();
                                  }
                                  if (snapshot.hasError) {
                                    return Text('Error ${snapshot.error}');
                                  }
                                  if (snapshot.data == null) {
                                    return const CircularProgressIndicator
                                        .adaptive();
                                  }
                                  if (!snapshot.hasData) {
                                    return const SizedBox();
                                  }

                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                          onPressed: () =>
                                              controller.prevSong(data: playListSnapshot.data),
                                          icon: const Icon(
                                              Icons.skip_previous_rounded)),
                                      IconButton(
                                          onPressed: () =>
                                              snapshot.data!.playing
                                                  ? controller
                                                      .setAudioStateStopped()
                                                  : controller.replay(),
                                          icon: Icon(snapshot.data!.playing
                                              ? Icons.stop
                                              : Icons.replay)),
                                      const SizedBox(width: 10),
                                      IconButton(
                                          onPressed: () => snapshot
                                                  .data!.playing
                                              ? controller.setAudioStatePaused()
                                              : controller.replay(),
                                          icon: Icon(snapshot.data!.playing
                                              ? Icons.pause
                                              : Icons.play_arrow)),
                                      IconButton(
                                          onPressed: () => controller.nextSong(
                                              data: playListSnapshot.data),
                                          icon: const Icon(
                                              Icons.skip_next_rounded)),
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
        });
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
        Expanded(
          child: CachedNetworkImage(
            imageUrl: data?.videoDetails?.thumbnail?.thumbnails?[4].url ?? '',
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator(strokeWidth: 2)),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
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

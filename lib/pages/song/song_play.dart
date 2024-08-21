import 'package:cached_network_image/cached_network_image.dart';
import 'package:flow_music/controller/main_controller.dart';
import 'package:flow_music/core/const/roots/rutas.dart';
import 'package:flow_music/datasource/model/song_id_response.dart';
import 'package:flow_music/pages/shared/seek_bar/seek_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio/just_audio.dart';

class SongWidget extends ConsumerStatefulWidget {
  final Map<String?, String?> data;
  const SongWidget({super.key, required this.data});

  @override
  ConsumerState<SongWidget> createState() => _PlaySongState();
}

class _PlaySongState extends ConsumerState<SongWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(mainController);
    String? idSong = widget.data['idSong'] ?? '';

    return FutureBuilder<SongIdResponde?>(
        future: controller.getSong(data: idSong),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            );
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error ${snapshot.error}'));
          }
          return ScreenPlay(
              data: snapshot.data!,
              url: controller.urlSong(data: snapshot.data!));
        });
  }
}

class ScreenPlay extends ConsumerStatefulWidget {
  final String url;
  final SongIdResponde data;
  const ScreenPlay({super.key, required this.url, required this.data});

  @override
  ConsumerState<ScreenPlay> createState() => _ScreenPlayState();
}

class _ScreenPlayState extends ConsumerState<ScreenPlay>
    with AutomaticKeepAliveClientMixin<ScreenPlay> {
  @override
  void initState() {
    super.initState();
    debugPrint('Id video: ${widget.data.videoDetails?.videoId}');
    ref.read(mainController).autoPlay(data: widget.url);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final controller = ref.watch(mainController);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.go(RutasShelf.songs.rootValue)),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => context.go(RutasShelf.search.rootValue),
          ),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => context.go(Rutas.home.rootValue),
          ),
        ],
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.music_note),
            const SizedBox(width: 10),
            Text(widget.data.videoDetails?.author ?? ''),
            const SizedBox(width: 10),
            const SizedBox(width: 10),
            Text(widget.data.videoDetails?.title ?? ''),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(flex: 2, child: _SourceTile(data: widget.data)),
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
                        duration: positionData?.duration ?? Duration.zero,
                        position: positionData?.position ?? Duration.zero,
                        bufferedPosition:
                            positionData?.bufferedPosition ?? Duration.zero,
                        onChangeEnd: (duration) =>
                            controller.seek(duration: duration),
                      ),
                    );
                  }),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: StreamBuilder<PlayerState>(
                    stream: controller.playerState,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return const SizedBox();

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          StreamBuilder<PlayerState>(
                              stream: controller.playerState,
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) return const SizedBox();
                                return SizedBox(
                                  width: 80,
                                  height: 80,
                                  child: FloatingActionButton(
                                      shape: const CircleBorder(),
                                      onPressed: () => snapshot.data!.playing
                                          ? controller.setAudioStateStopped()
                                          : controller.replay(),
                                      child: Icon(snapshot.data!.playing
                                          ? Icons.stop
                                          : Icons.replay)),
                                );
                              }),
                          const SizedBox(width: 10),
                          SizedBox(
                            width: 80,
                            height: 80,
                            child: FloatingActionButton(
                                shape: const CircleBorder(),
                                onPressed: () =>
                                    controller.setAudioStatePaused(),
                                child: Icon(snapshot.data!.playing
                                    ? Icons.pause
                                    : Icons.play_arrow)),
                          ),
                        ],
                      );
                    }),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _SourceTile extends ConsumerWidget {
  final SongIdResponde data;
  const _SourceTile({
    required this.data,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(mainController);
    return Column(
      children: [
        Expanded(
          child: CachedNetworkImage(
            imageUrl: data.videoDetails?.thumbnail?.thumbnails?[4].url ?? '',
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
                    videoId: data.videoDetails?.videoId ?? ''),
                icon: const Icon(Icons.video_library_outlined)),
          ],
        ),
      ],
    );
  }
}

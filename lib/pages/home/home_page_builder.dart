import 'package:flow_music/controller/main_controller.dart';
import 'package:flow_music/pages/components/appbar/app_bar.dart';
import 'package:flow_music/pages/components/drawer/drawer.dart';
import 'package:flow_music/pages/contract/contract.dart';
import 'package:flow_music/pages/shared/lateral_list/latelar_list.dart';
import 'package:flow_music/pages/shared/search_delegate/search_song.dart';
import 'package:flow_music/pages/shared/seek_bar/seek_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio/just_audio.dart';

class HomePageBuilder extends ConsumerStatefulWidget {
  final Widget? view;
  const HomePageBuilder({super.key, this.view});

  @override
  ConsumerState<HomePageBuilder> createState() => _HomePageBuilderState();
}

class _HomePageBuilderState extends ConsumerState<HomePageBuilder>
    with WidgetsBindingObserver
    implements Contract {
  @override
  void initState() {
    super.initState();
    ambiguate(WidgetsBinding.instance)!.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(mainController)..initHome(iO: this);
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarMain(),
        drawer: const AppDrawer(),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LateralList(),
            Expanded(
                flex: 2,
                child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                    child: widget.view ??
                        const SizedBox(child: Text('Pantalla')))),
          ],
        ),
        floatingActionButton: StreamBuilder<PlayerState>(
            stream: controller.statusStream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const SizedBox();
              return Visibility(
                visible: !snapshot.data!.playing,
                child: SizedBox(
                    width: 50,
                    child: FloatingActionButton(
                        heroTag: 'search',
                        elevation: 1,
                        backgroundColor: Colors.white,
                        shape: const CircleBorder(),
                        onPressed: () => controller.search(
                            context: context, delegate: SearchSong(ref: ref)),
                        child: const Icon(Icons.search))),
              );
            }),
        bottomSheet: StreamBuilder<PlayerState>(
            stream: controller.statusStream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const SizedBox();
              return Visibility(
                visible: snapshot.data!.playing,
                child: Card(
                  child: SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: StreamBuilder<PositionData>(
                            stream: controller.positionDataStream,
                            builder: (context, snapshot) {
                              final positionData = snapshot.data;
                              return SeekBar(
                                duration:
                                    positionData?.duration ?? Duration.zero,
                                position:
                                    positionData?.position ?? Duration.zero,
                                bufferedPosition:
                                    positionData?.bufferedPosition ??
                                        Duration.zero,
                                onChangeEnd: (newDuration) =>
                                    controller.seek(duration: newDuration),
                              );
                            },
                          ),
                        ),
                        IconButton(
                            onPressed: () => controller.setAudioStateStopped(),
                            icon: const Icon(Icons.stop)),
                        IconButton(
                            onPressed: () => controller.setAudioStatePaused(),
                            icon: Icon(snapshot.data!.playing
                                ? Icons.pause
                                : Icons.play_arrow)),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  @override
  void disposeLoad() {
    if (mounted && context.canPop()) context.pop();
  }

  @override
  void load() {
    showDialog(
        context: context,
        builder: (context) =>
            const Center(child: CircularProgressIndicator(strokeWidth: 2)));
  }
}

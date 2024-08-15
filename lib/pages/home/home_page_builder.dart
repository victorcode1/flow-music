import 'package:audioplayers/audioplayers.dart';
import 'package:flow_music/controller/main_controller.dart';
import 'package:flow_music/pages/components/appbar/app_bar.dart';
import 'package:flow_music/pages/components/drawer/drawer.dart';
import 'package:flow_music/pages/contract/contract.dart';
import 'package:flow_music/pages/shared/search_delegate/search_song.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePageBuilder extends ConsumerStatefulWidget {
  final Widget? view;
  const HomePageBuilder({super.key, required this.view});

  @override
  ConsumerState<HomePageBuilder> createState() => _HomePageBuilderState();
}

class _HomePageBuilderState extends ConsumerState<HomePageBuilder>
    implements Contract {
  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(mainController)..initHome(contractView: this);
    debugPrint('Estate ${controller.playerState}');
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarMain(),
        drawer: const AppDrawer(),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    child: TextButton(
                        onPressed: () {
                          if (context.canPop()) context.pop();
                          context.go('/radio');
                        },
                        child: const RotatedBox(
                            quarterTurns: 3, child: Text('Radio'))),
                  ),
                  const SizedBox(
                    height: 100,
                    child: TextButton(
                      onPressed: null,
                      child: RotatedBox(
                          quarterTurns: 3,
                          child:
                              SizedBox(height: 100, child: Text('Home Page'))),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                    child: TextButton(
                      onPressed: null,
                      child:
                          RotatedBox(quarterTurns: 3, child: Text('Home Page')),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(flex: 2, child: widget.view ?? const SizedBox()),
          ],
        ),
        floatingActionButton: Visibility(
          visible: controller.playerState != PlayerState.playing &&
              controller.playerState != PlayerState.paused,
          child: SizedBox(
            width: 50,
            child: FloatingActionButton(
                heroTag: 'search',
                elevation: 1,
                backgroundColor: Colors.white,
                shape: const CircleBorder(),
                onPressed: () => controller.search(
                    context: context, delegate: SearchSong(ref: ref)),
                child: const Icon(Icons.search)),
          ),
        ),
        bottomSheet: Visibility(
          visible: controller.playerState == PlayerState.playing ||
              controller.playerState == PlayerState.paused,
          child: Card(
            child: SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () => controller.setAudioStateStopped(),
                      icon: const Icon(Icons.stop)),
                  IconButton(
                      onPressed: () => controller.setAudioStatePaused(),
                      icon: Icon(controller.playerState == PlayerState.playing
                          ? Icons.pause
                          : Icons.play_arrow)),
                ],
              ),
            ),
          ),
        ),
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
        builder: (context) => const Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            ));
  }
}

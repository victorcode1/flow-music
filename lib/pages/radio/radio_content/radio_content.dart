import 'package:audioplayers/audioplayers.dart' as audio;
import 'package:flow_music/controller/main_controller.dart';
import 'package:flow_music/core/sources.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RadioContent extends ConsumerStatefulWidget {
  final String url;
  const RadioContent({super.key, required this.url});

  @override
  ConsumerState<RadioContent> createState() => _RadioContentState();
}

class _RadioContentState extends ConsumerState<RadioContent> {
  @override
  void initState() {
    super.initState();

    ref.read(mainController).playRadio(source: UrlSource(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.read(mainController);
    return StreamBuilder<audio.PlayerState>(
        stream: controller.statusRadio,
        builder: (context, snapshot) {
         
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error'),
            );
          }
          return switch (snapshot.data) {
            null => Center(
                child: Text('Error'),
              ),
            audio.PlayerState.stopped =>
              Center(child: CircularProgressIndicator()),
            audio.PlayerState.playing => Center(child: Text('Playing')),
            audio.PlayerState.paused => Text('Paused'),
            audio.PlayerState.completed => Text('Completed'),
            audio.PlayerState.disposed => Text('Disposed'),
          };
        });
  }
}

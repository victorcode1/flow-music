import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flutter/material.dart';

class StreamWidget extends StatefulWidget {
  final AudioPlayer player;

  const StreamWidget({required this.player, super.key});

  @override
  State<StreamWidget> createState() => _StreamWidgetState();
}

class _StreamWidgetState extends State<StreamWidget> {
  Duration? streamDuration;
  Duration? streamPosition;
  PlayerState? streamState;
  late List<StreamSubscription> streams;

  AudioPlayer get player => widget.player;

  @override
  void initState() {
    super.initState();
    // Use initial values from player
    streamState = player.state;
    player.getDuration().then((it) => setState(() => streamDuration = it));
    player.getCurrentPosition().then(
      (it) => setState(() => streamPosition = it),
    );

    streams = <StreamSubscription>[
      player.onDurationChanged.listen(
        (it) => setState(() => streamDuration = it),
      ),
      player.onPlayerStateChanged.listen(
        (it) => setState(() => streamState = it),
      ),
      player.onPositionChanged.listen(
        (it) => setState(() => streamPosition = it),
      ),
    ];
  }

  @override
  void dispose() {
    super.dispose();
    for (var it in streams) {
      it.cancel();
    }
  }

  @override
  void setState(VoidCallback fn) {
    // Subscriptions only can be closed asynchronously,
    // therefore events can occur after widget has been disposed.
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(title: Text(LocaleKeys.streams.tr())),
        ListTile(
          title: Text(
            streamDuration?.toString() ?? '-',
            key: const Key('onDurationText'),
          ),
          subtitle: Text(LocaleKeys.duration_stream.tr()),
          leading: const Icon(Icons.timelapse),
        ),
        ListTile(
          title: Text(
            streamPosition?.toString() ?? '-',
            key: const Key('onPositionText'),
          ),
          subtitle: Text(LocaleKeys.position_stream.tr()),
          leading: const Icon(Icons.timer),
        ),
        ListTile(
          title: Text(
            streamState?.toString() ?? '-',
            key: const Key('onStateText'),
          ),
          subtitle: Text(LocaleKeys.state_stream.tr()),
          leading: const Icon(
            Icons.play_arrow,
            //streamState?.getIcon() ?? Icons.stop
          ),
        ),
      ],
    );
  }
}

import 'package:audioplayers/audioplayers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flutter/material.dart';

class PropertiesWidget extends StatefulWidget {
  final AudioPlayer player;

  const PropertiesWidget({required this.player, super.key});

  @override
  State<PropertiesWidget> createState() => _PropertiesWidgetState();
}

class _PropertiesWidgetState extends State<PropertiesWidget> {
  Future<void> refresh() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(LocaleKeys.properties.tr()),
          trailing: ElevatedButton.icon(
            icon: const Icon(Icons.refresh),
            key: const Key('refreshButton'),
            label: Text(LocaleKeys.refresh.tr()),
            onPressed: refresh,
          ),
        ),
        ListTile(
          title: FutureBuilder<Duration?>(
            future: widget.player.getDuration(),
            builder: (context, snap) {
              return Text(
                snap.data?.toString() ?? '-',
                key: const Key('durationText'),
              );
            },
          ),
          subtitle: Text(LocaleKeys.duration.tr()),
          leading: const Icon(Icons.timelapse),
        ),
        ListTile(
          title: FutureBuilder<Duration?>(
            future: widget.player.getCurrentPosition(),
            builder: (context, snap) {
              return Text(
                snap.data?.toString() ?? '-',
                key: const Key('positionText'),
              );
            },
          ),
          subtitle: Text(LocaleKeys.position.tr()),
          leading: const Icon(Icons.timer),
        ),
        ListTile(
          title: Text(
            widget.player.state.toString(),
            key: const Key('playerStateText'),
          ),
          subtitle: Text(LocaleKeys.state.tr()),
          leading: const Icon(
            Icons.play_arrow,
            //widget.player.state.getIcon()
          ),
        ),
        ListTile(
          title: Text(
            widget.player.source?.toString() ?? '-',
            key: const Key('sourceText'),
          ),
          subtitle: Text(LocaleKeys.source.tr()),
          leading: const Icon(Icons.audio_file),
        ),
        ListTile(
          title: Text(
            widget.player.volume.toString(),
            key: const Key('volumeText'),
          ),
          subtitle: Text(LocaleKeys.volume.tr()),
          leading: const Icon(Icons.volume_up),
        ),
        ListTile(
          title: Text(
            widget.player.balance.toString(),
            key: const Key('balanceText'),
          ),
          subtitle: Text(LocaleKeys.balance.tr()),
          leading: const Icon(Icons.balance),
        ),
        ListTile(
          title: Text(
            widget.player.playbackRate.toString(),
            key: const Key('playbackRateText'),
          ),
          subtitle: Text(LocaleKeys.playback_rate.tr()),
          leading: const Icon(Icons.speed),
        ),
      ],
    );
  }
}

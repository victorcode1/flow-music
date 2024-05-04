import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flow_music/settings/utils/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'audio_player_controller.g.dart';

@Riverpod(keepAlive: true)
class AudioPlayerProvider extends _$AudioPlayerProvider {
  List<StreamSubscription> streams = [];
  @override
  AudioPlayer build() => AudioPlayer()..setReleaseMode(ReleaseMode.stop);

  Future<void> play({required Source source}) async {
    await state.stop();
    await state.play(source);

    ref.read(mainController).sendMesage(
          'Playing...',
          textKey: const Key('toast-playing'),
        );
  }

  Future<void> setSource({required Source source}) async {
    await state.setSource(source);

    ref.read(mainController).sendMesage(
          'Completed setting source.',
          textKey: const Key('toast-set-source'),
        );
  }

  void initState() {
    streams.add(
      state.onPlayerStateChanged.listen(
        (it) {
          switch (it) {
            case PlayerState.stopped:
              ref.read(mainController).sendMesage(
                    'Player stopped!',
                    textKey: const Key('toast-player-stopped'),
                  );
              break;
            case PlayerState.completed:
              ref.read(mainController).sendMesage(
                    'Player complete!',
                    textKey: const Key('toast-player-complete-'),
                  );
              break;
            default:
              break;
          }
        },
      ),
    );
    streams.add(
      state.onSeekComplete.listen(
        (it) => ref.read(mainController).sendMesage(
              'Seek complete!',
              textKey: const Key('toast-seek-complete-'),
            ),
      ),
    );
  }
}

import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flow_music/core/utils/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'audio_player_controller.g.dart';

@Riverpod(keepAlive: true)
class AudioPlayerProvider extends _$AudioPlayerProvider {
  final List<StreamSubscription> _streams = [];

  PlayerState status() => state.state;
  @override
  AudioPlayer build() => AudioPlayer()..setReleaseMode(ReleaseMode.stop);

  Future<void> play({required Source source}) async {
    await state.play(source);
    ref
        .read(mainController)
        .sendMesage(
          LocaleKeys.playing_toast.tr(),
          textKey: const Key('toast-playing'),
        );
  }

  Future<void> setSource({required Source source}) async {
    await state.setSource(source);

    ref
        .read(mainController)
        .sendMesage(
          LocaleKeys.source_set.tr(),
          textKey: const Key('toast-set-source'),
        );
  }

  void initState() {
    _streams.add(
      state.onPlayerStateChanged.listen((it) {
        switch (it) {
          case PlayerState.stopped:
            ref
                .read(mainController)
                .sendMesage(
                  LocaleKeys.player_stopped.tr(),
                  textKey: const Key('toast-player-stopped'),
                );
            break;
          case PlayerState.completed:
            ref
                .read(mainController)
                .sendMesage(
                  LocaleKeys.player_complete.tr(),
                  textKey: const Key('toast-player-complete-'),
                );
            break;
          default:
            break;
        }
      }),
    );
    _streams.add(
      state.onSeekComplete.listen(
        (it) => ref
            .read(mainController)
            .sendMesage(
              LocaleKeys.seek_complete.tr(),
              textKey: const Key('toast-seek-complete-'),
            ),
      ),
    );
  }

  void resume() {
    state.resume();
  }

  void dispose() {
    state.dispose();
    for (var element in _streams) {
      element.cancel();
    }
  }

  void pause() {
    state.pause();
  }
}

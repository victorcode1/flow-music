import 'dart:async';

import 'package:flow_music/core/audio/background_audio_handler.dart';
import 'package:flow_music/core/utils/main_controller.dart';
import 'package:flow_music/features/history/presentation/controllers/playback_history_controller.dart';
import 'package:flow_music/features/radio/data/models/radio_station.dart';
import 'package:flow_music/features/radio/data/repositories/radio_browser_repository.dart';
import 'package:flow_music/features/radio/presentation/controllers/radio_queue_controller.dart';
import 'package:flow_music/features/settings/presentation/controllers/autoplay_enabled_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final mainAppControllerProvider = Provider<MainAppController>(
  MainAppController.new,
);

class MainAppController {
  MainAppController(this.ref);

  final Ref ref;

  void initialize() {
    flowAudioHandler.onTrackComplete = handleTrackComplete;
    flowAudioHandler.onSkipToNext = handleSkipToNext;
    flowAudioHandler.onSkipToPrevious = handleSkipToPrevious;
  }

  void dispose() {
    if (flowAudioHandler.onTrackComplete == handleTrackComplete) {
      flowAudioHandler.onTrackComplete = null;
    }
    if (flowAudioHandler.onSkipToNext == handleSkipToNext) {
      flowAudioHandler.onSkipToNext = null;
    }
    if (flowAudioHandler.onSkipToPrevious == handleSkipToPrevious) {
      flowAudioHandler.onSkipToPrevious = null;
    }
  }

  Future<void> handleTrackComplete() async {
    if (!ref.read(autoplayEnabledControllerProvider)) return;
    await _playQueuedStation(
      ref.read(radioQueueControllerProvider.notifier).next(),
    );
  }

  Future<void> handleSkipToNext() async {
    await _playQueuedStation(
      ref.read(radioQueueControllerProvider.notifier).next(),
    );
  }

  Future<void> handleSkipToPrevious() async {
    final previous = ref.read(radioQueueControllerProvider.notifier).previous();
    if (previous == null) {
      await flowAudioHandler.seek(Duration.zero);
      return;
    }
    await _playQueuedStation(previous);
  }

  void handleAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.detached:
        ref.read(mainController).setAudioStateDetached();
      case AppLifecycleState.resumed:
        ref.read(mainController).setAudioStateResumed();
        break;
      case AppLifecycleState.inactive:
        ref.read(mainController).setAudioStateInactive();
        break;
      case AppLifecycleState.paused:
        ref.read(mainController).setAudioStatePaused();
        break;
      case AppLifecycleState.hidden:
        ref.read(mainController).setAudioStateHidden();
        break;
    }
  }

  Future<void> _playQueuedStation(RadioStation? station) async {
    if (station == null || !station.isPlayable) return;

    try {
      final repository = RadioBrowserRepository();
      final streamUrl = await repository.countClickAndResolveUrl(station);
      final artUrl = await repository.resolveArtworkUrl(station);
      await flowAudioHandler.playUrl(
        url: streamUrl,
        id: station.stationUuid.isEmpty ? streamUrl : station.stationUuid,
        title: station.name,
        artist: station.country,
        artUrl: artUrl,
      );
      await ref
          .read(playbackHistoryControllerProvider.notifier)
          .recordRadio(
            stationId: station.stationUuid.isEmpty
                ? station.streamUrl
                : station.stationUuid,
            name: station.name,
            country: station.country,
            artworkUrl: artUrl ?? station.artworkUrl,
          );
    } catch (error) {
      debugPrint('Unable to advance the radio queue: $error');
    }
  }
}

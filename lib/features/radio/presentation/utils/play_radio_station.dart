import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/audio/background_audio_handler.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flow_music/features/history/presentation/controllers/playback_history_controller.dart';
import 'package:flow_music/features/radio/data/models/radio_station.dart';
import 'package:flow_music/features/radio/data/repositories/radio_browser_repository.dart';
import 'package:flow_music/features/radio/presentation/controllers/radio_queue_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Reproduce una emisora resolviendo su stream y registrandola en el
/// historial. Las paginas (radio, favoritos, biblioteca) comparten este
/// flujo para evitar duplicar logica.
///
/// Si se pasan [queue] e [index], la lista completa se encola para que el
/// reproductor de radio y el mini player puedan avanzar a la siguiente /
/// anterior emisora.
Future<void> playRadioStation({
  required BuildContext context,
  required WidgetRef ref,
  required RadioStation station,
  List<RadioStation>? queue,
  int? index,
}) async {
  if (!station.isPlayable) return;
  if (queue != null && index != null) {
    ref.read(radioQueueControllerProvider.notifier).enqueue(queue, index);
  }
  await _resolveAndPlay(context: context, ref: ref, station: station);
}

/// Avanza a la siguiente emisora de la cola y la reproduce.
Future<void> playNextRadioStation({
  required BuildContext context,
  required WidgetRef ref,
}) async {
  final next = ref.read(radioQueueControllerProvider.notifier).next();
  if (next == null) return;
  await _resolveAndPlay(context: context, ref: ref, station: next);
}

/// Retrocede a la emisora anterior de la cola y la reproduce.
Future<void> playPreviousRadioStation({
  required BuildContext context,
  required WidgetRef ref,
}) async {
  final previous = ref.read(radioQueueControllerProvider.notifier).previous();
  if (previous == null) return;
  await _resolveAndPlay(context: context, ref: ref, station: previous);
}

Future<void> _resolveAndPlay({
  required BuildContext context,
  required WidgetRef ref,
  required RadioStation station,
}) async {
  final repository = RadioBrowserRepository();
  try {
    final streamUrl = await repository.countClickAndResolveUrl(station);
    final artUrl = await repository.resolveArtworkUrl(station);
    await flowAudioHandler.playUrl(
      url: streamUrl,
      id: station.stationUuid.isEmpty ? streamUrl : station.stationUuid,
      title: station.name,
      artist: [
        if (station.country.isNotEmpty) station.country,
        if (station.codec.isNotEmpty) station.codec,
        if (station.bitrate > 0) '${station.bitrate} kbps',
      ].join(' · '),
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
  } catch (_) {
    if (!context.mounted) return;
    ScaffoldMessenger.maybeOf(
      context,
    )?.showSnackBar(SnackBar(content: Text(LocaleKeys.radio_play_error.tr())));
  }
}

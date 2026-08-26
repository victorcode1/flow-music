import 'dart:async';

import 'package:flow_music/core/analytics/product_analytics.dart';
import 'package:flow_music/core/engagement/review_prompt_coordinator.dart';
import 'package:flow_music/features/radio/data/models/radio_station.dart';
import 'package:flow_music/features/radio/data/radio_favorites_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final radioFavoritesControllerProvider =
    NotifierProvider<RadioFavoritesController, List<RadioStation>>(
      RadioFavoritesController.new,
    );

class RadioFavoritesController extends Notifier<List<RadioStation>> {
  final RadioFavoritesRepository _repository = const RadioFavoritesRepository();

  @override
  List<RadioStation> build() => _repository.readAll();

  bool contains(RadioStation station) => _repository.contains(station);

  Future<bool> toggle(RadioStation station) async {
    final added = await _repository.toggle(station);
    state = _repository.readAll();
    unawaited(
      ref
          .read(productAnalyticsProvider)
          .track(
            added ? 'favorite_added' : 'favorite_removed',
            properties: {
              if (station.stationUuid.isNotEmpty)
                'station_id': station.stationUuid,
              if (station.countryCode.isNotEmpty)
                'country_code': station.countryCode.toUpperCase(),
            },
          ),
    );
    if (added) {
      unawaited(
        ref
            .read(reviewPromptCoordinatorProvider)
            .considerReviewAfterPositiveMoment('favorite_added'),
      );
    }
    return added;
  }

  Future<void> remove(String stationId) async {
    RadioStation? station;
    for (final candidate in state) {
      if (candidate.stationUuid == stationId ||
          candidate.streamUrl == stationId) {
        station = candidate;
        break;
      }
    }
    await _repository.remove(stationId);
    state = _repository.readAll();
    unawaited(
      ref
          .read(productAnalyticsProvider)
          .track(
            'favorite_removed',
            properties: {
              if (station?.stationUuid.isNotEmpty ?? false)
                'station_id': station!.stationUuid,
              if (station?.countryCode.isNotEmpty ?? false)
                'country_code': station!.countryCode.toUpperCase(),
            },
          ),
    );
  }
}

import 'dart:async';

import 'package:flow_music/features/radio/data/models/radio_station.dart';

enum DailyRecommendationToggleResult {
  enabled,
  disabled,
  permissionDenied,
  unavailable,
  failed,
}

abstract interface class DailyRecommendationRepository {
  bool get isSupported;
  bool get isEnabled;
  Stream<RadioStation> get openedStations;

  Future<void> initialize();

  Future<DailyRecommendationToggleResult> setEnabled(
    bool enabled, {
    required String languageCode,
  });

  Future<void> refresh({required String languageCode});

  RadioStation? takeInitialStation();

  void dispose();
}

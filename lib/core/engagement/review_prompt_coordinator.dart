import 'dart:async';

import 'package:flow_music/core/analytics/product_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:hive_ce/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_app_review/in_app_review.dart';

const _firstLaunchAtKey = 'engagement_first_launch_at_ms';
const _successfulPlayCountKey = 'engagement_successful_play_count';
const _activationLoggedKey = 'engagement_activation_logged';
const _reviewRequestedAtKey = 'engagement_review_requested_at_ms';

final reviewPromptCoordinatorProvider = Provider<ReviewPromptCoordinator>(
  (ref) => ReviewPromptCoordinator.noop(),
);

abstract interface class EngagementStore {
  int? readInt(String key);

  bool readBool(String key);

  Future<void> writeInt(String key, int value);

  Future<void> writeBool(String key, bool value);
}

class HiveEngagementStore implements EngagementStore {
  const HiveEngagementStore(this._box);

  final Box<dynamic> _box;

  @override
  int? readInt(String key) => _box.get(key) as int?;

  @override
  bool readBool(String key) => _box.get(key) as bool? ?? false;

  @override
  Future<void> writeInt(String key, int value) => _box.put(key, value);

  @override
  Future<void> writeBool(String key, bool value) => _box.put(key, value);
}

abstract interface class ReviewGateway {
  Future<bool> isAvailable();

  Future<void> requestReview();
}

class InAppReviewGateway implements ReviewGateway {
  InAppReviewGateway({InAppReview? inAppReview})
    : _inAppReview = inAppReview ?? InAppReview.instance;

  final InAppReview _inAppReview;

  @override
  Future<bool> isAvailable() => _inAppReview.isAvailable();

  @override
  Future<void> requestReview() => _inAppReview.requestReview();
}

class ReviewPromptCoordinator {
  ReviewPromptCoordinator({
    required EngagementStore store,
    required ReviewGateway gateway,
    required ProductAnalytics analytics,
    DateTime Function()? now,
    this.minimumSuccessfulPlays = 3,
    this.minimumAppAge = const Duration(days: 2),
  }) : _store = store,
       _gateway = gateway,
       _analytics = analytics,
       _now = now ?? DateTime.now;

  factory ReviewPromptCoordinator.noop() {
    return ReviewPromptCoordinator(
      store: _MemoryEngagementStore(),
      gateway: const _UnavailableReviewGateway(),
      analytics: ProductAnalytics.noop(),
    );
  }

  final EngagementStore _store;
  final ReviewGateway _gateway;
  final ProductAnalytics _analytics;
  final DateTime Function() _now;
  final int minimumSuccessfulPlays;
  final Duration minimumAppAge;
  bool _reviewCheckInProgress = false;
  Future<void> _playWrites = Future<void>.value();

  Future<void> initialize() async {
    if (_store.readInt(_firstLaunchAtKey) != null) return;
    await _store.writeInt(_firstLaunchAtKey, _now().millisecondsSinceEpoch);
  }

  Future<void> recordSuccessfulPlay({
    required String stationId,
    required String countryCode,
    required String source,
  }) {
    _playWrites = _playWrites.then((_) async {
      try {
        await _recordSuccessfulPlay(
          stationId: stationId,
          countryCode: countryCode,
          source: source,
        );
      } catch (error) {
        debugPrint('Unable to record a successful play milestone: $error');
      }
    });
    return _playWrites;
  }

  Future<void> _recordSuccessfulPlay({
    required String stationId,
    required String countryCode,
    required String source,
  }) async {
    await initialize();
    final playCount = (_store.readInt(_successfulPlayCountKey) ?? 0) + 1;
    await _store.writeInt(_successfulPlayCountKey, playCount);
    await _analytics.track(
      'radio_played',
      properties: {
        'station_id': stationId,
        if (countryCode.isNotEmpty) 'country_code': countryCode.toUpperCase(),
        'source': source,
      },
    );

    if (playCount >= minimumSuccessfulPlays &&
        !_store.readBool(_activationLoggedKey)) {
      await _store.writeBool(_activationLoggedKey, true);
      await _analytics.track(
        'activation_completed',
        properties: {'successful_play_count': playCount},
      );
    }
  }

  Future<void> considerReviewAfterPositiveMoment(String reason) async {
    if (_reviewCheckInProgress ||
        _store.readInt(_reviewRequestedAtKey) != null) {
      return;
    }

    await initialize();
    final firstLaunchAt = _store.readInt(_firstLaunchAtKey);
    final playCount = _store.readInt(_successfulPlayCountKey) ?? 0;
    if (firstLaunchAt == null || playCount < minimumSuccessfulPlays) return;

    final appAge = _now().difference(
      DateTime.fromMillisecondsSinceEpoch(firstLaunchAt),
    );
    if (appAge < minimumAppAge) return;

    _reviewCheckInProgress = true;
    try {
      if (!await _gateway.isAvailable()) return;
      await _gateway.requestReview();
      await _store.writeInt(
        _reviewRequestedAtKey,
        _now().millisecondsSinceEpoch,
      );
      await _analytics.track(
        'review_requested',
        properties: {'reason': reason, 'successful_play_count': playCount},
      );
    } on PlatformException catch (error) {
      debugPrint('Unable to request an in-app review: $error');
    } catch (error) {
      debugPrint('Unable to evaluate the in-app review prompt: $error');
    } finally {
      _reviewCheckInProgress = false;
    }
  }
}

class _MemoryEngagementStore implements EngagementStore {
  final Map<String, Object> _values = {};

  @override
  int? readInt(String key) => _values[key] as int?;

  @override
  bool readBool(String key) => _values[key] as bool? ?? false;

  @override
  Future<void> writeInt(String key, int value) async => _values[key] = value;

  @override
  Future<void> writeBool(String key, bool value) async => _values[key] = value;
}

class _UnavailableReviewGateway implements ReviewGateway {
  const _UnavailableReviewGateway();

  @override
  Future<bool> isAvailable() async => false;

  @override
  Future<void> requestReview() async {}
}

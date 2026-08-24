import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/routes/app_navigator_key.dart';
import 'package:flow_music/features/daily_recommendations/presentation/providers/daily_recommendation_providers.dart';
import 'package:flow_music/features/daily_recommendations/domain/repositories/daily_recommendation_repository.dart';
import 'package:flow_music/features/radio/data/models/radio_station.dart';
import 'package:flow_music/features/radio/presentation/pages/radio_player_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DailyRecommendationListener extends ConsumerStatefulWidget {
  const DailyRecommendationListener({super.key, required this.child});

  final Widget child;

  @override
  ConsumerState<DailyRecommendationListener> createState() =>
      _DailyRecommendationListenerState();
}

class _DailyRecommendationListenerState
    extends ConsumerState<DailyRecommendationListener> {
  StreamSubscription<RadioStation>? _subscription;
  bool _isOpening = false;

  @override
  void initState() {
    super.initState();
    final repository = ref.read(dailyRecommendationRepositoryProvider);
    _subscription = repository.openedStations.listen(_openStation);
    unawaited(_initialize(repository));
  }

  Future<void> _initialize(DailyRecommendationRepository repository) async {
    try {
      await repository.initialize();
      if (!mounted) return;
      final initialStation = repository.takeInitialStation();
      if (initialStation != null) _openStation(initialStation);
      await repository.refresh(languageCode: context.locale.languageCode);
    } catch (error, stackTrace) {
      debugPrint('Unable to initialize daily recommendations: $error');
      debugPrintStack(stackTrace: stackTrace);
    }
  }

  void _openStation(RadioStation station) {
    if (!mounted || _isOpening) return;
    final navigator = ref.read(appNavigatorKeyProvider).currentState;
    if (navigator == null) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => _openStation(station),
      );
      return;
    }
    _isOpening = true;
    unawaited(
      navigator.push<void>(
        MaterialPageRoute<void>(
          builder: (_) => RadioPlayerPage(initialStation: station),
        ),
      ),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) => _isOpening = false);
  }

  @override
  void dispose() {
    unawaited(_subscription?.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

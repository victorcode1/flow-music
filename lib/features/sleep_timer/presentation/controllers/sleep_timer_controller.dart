import 'dart:async';

import 'package:flow_music/core/audio/background_audio_handler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final sleepTimerControllerProvider =
    NotifierProvider<SleepTimerController, SleepTimerState>(
      SleepTimerController.new,
    );

class SleepTimerState {
  const SleepTimerState({this.endsAt});

  final DateTime? endsAt;

  bool get isActive => endsAt != null && endsAt!.isAfter(DateTime.now());

  Duration? get remaining {
    final end = endsAt;
    if (end == null) return null;
    final value = end.difference(DateTime.now());
    return value.isNegative ? Duration.zero : value;
  }
}

class SleepTimerController extends Notifier<SleepTimerState> {
  Timer? _timer;
  Timer? _ticker;

  @override
  SleepTimerState build() {
    ref.onDispose(() {
      _timer?.cancel();
      _ticker?.cancel();
    });
    return const SleepTimerState();
  }

  void start(Duration duration) {
    if (duration <= Duration.zero) return;
    _timer?.cancel();
    _ticker?.cancel();
    final endsAt = DateTime.now().add(duration);
    state = SleepTimerState(endsAt: endsAt);
    _timer = Timer(duration, () async {
      await flowAudioHandler.stop();
      state = const SleepTimerState();
      _ticker?.cancel();
    });
    _ticker = Timer.periodic(const Duration(seconds: 1), (_) {
      final end = state.endsAt;
      if (end == null || end.isBefore(DateTime.now())) {
        cancel();
      } else {
        state = SleepTimerState(endsAt: end);
      }
    });
  }

  void cancel() {
    _timer?.cancel();
    _ticker?.cancel();
    state = const SleepTimerState();
  }
}

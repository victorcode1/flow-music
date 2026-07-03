import 'dart:async';

import 'package:flow_music/features/auth/domain/entities/auth_user.dart';
import 'package:flow_music/features/auth/presentation/notifiers/auth_notifier.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'user_location_providers.dart';
import 'user_location_repository.dart';

part 'user_location_tracker.g.dart';

@Riverpod(keepAlive: true)
class UserLocationTracker extends _$UserLocationTracker {
  Timer? _timer;
  StreamSubscription<Duration>? _intervalSubscription;
  AuthUser? _activeUser;
  String? _activeUid;
  Duration? _activeInterval;
  DateTime? _lastSaveAttemptAt;
  bool _saveInFlight = false;

  @override
  void build() {
    ref.onDispose(_clear);

    final user = ref.watch(authProvider).asData?.value;
    // El usuario anonimo es solo local y no tiene idToken/refreshToken, asi que
    // las llamadas al backend siempre fallarian con `unauthenticated`. No
    // arrancamos el seguimiento para evitar el bucle de errores cada 15s.
    if (user == null || user.isAnonymous) {
      _clear();
      return;
    }

    if (_activeUid == user.id) return;
    _startForUser(user);
  }

  void _startForUser(AuthUser user) {
    _clear();
    _activeUser = user;
    _activeUid = user.id;

    _intervalSubscription = ref
        .read(userLocationRepositoryProvider)
        .watchLocationUpdateInterval(user.id)
        .listen(
          (interval) {
            if (_activeUid != user.id || _activeInterval == interval) return;
            _startTimer(user, interval);
          },
          onError: (_) {
            if (_activeUid == user.id) {
              _startTimer(user, defaultUserLocationSaveInterval);
            }
          },
        );
  }

  void handleLifecycleState(AppLifecycleState state) {
    if (state != AppLifecycleState.resumed) return;
    final user = _activeUser;
    final interval = _activeInterval;
    if (user == null || interval == null) return;
    _saveIfDue(user, interval);
  }

  void _startTimer(AuthUser user, Duration interval) {
    _activeInterval = interval;
    _timer?.cancel();
    if (kDebugMode) {
      debugPrint(
        '[----LocationTracker----] '
        '${DateTime.now().toIso8601String()} '
        'timer started uid=${user.id} interval=${interval.inMinutes}m',
      );
    }
    _saveIfDue(user, interval);
    _timer = Timer.periodic(interval, (_) {
      _saveIfDue(user, interval);
    });
  }

  void _saveIfDue(AuthUser user, Duration interval) {
    if (_saveInFlight) {
      if (kDebugMode) {
        debugPrint(
          '[----LocationTracker----] '
          '${DateTime.now().toIso8601String()} '
          'save skipped uid=${user.id} reason=in-flight',
        );
      }
      return;
    }
    final lastAttemptAt = _lastSaveAttemptAt;
    if (lastAttemptAt != null &&
        DateTime.now().difference(lastAttemptAt) <
            const Duration(seconds: 20)) {
      if (kDebugMode) {
        debugPrint(
          '[----LocationTracker----] '
          '${DateTime.now().toIso8601String()} '
          'save skipped uid=${user.id} reason=attempt-throttle',
        );
      }
      return;
    }
    _saveInFlight = true;
    _lastSaveAttemptAt = DateTime.now();
    if (kDebugMode) {
      debugPrint(
        '[----LocationTracker----] '
        '${DateTime.now().toIso8601String()} '
        'save requested uid=${user.id} interval=${interval.inMinutes}m',
      );
    }
    unawaited(
      ref
          .read(userLocationRepositoryProvider)
          .saveCurrentLocationIfDue(
            user,
            interval: interval,
            requestAlwaysPermission: true,
          )
          .whenComplete(() => _saveInFlight = false),
    );
  }

  void _clear() {
    _activeUser = null;
    _activeUid = null;
    _activeInterval = null;
    _lastSaveAttemptAt = null;
    _saveInFlight = false;
    _timer?.cancel();
    _timer = null;
    unawaited(_intervalSubscription?.cancel());
    _intervalSubscription = null;
  }
}

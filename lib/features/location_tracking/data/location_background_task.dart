import 'dart:ui';

import 'package:flow_music/features/auth/data/local/auth_session_store.dart';
import 'package:flow_music/features/auth/data/local/auth_token_store.dart';
import 'package:flow_music/features/auth/data/remote/auth_api_client.dart';
import 'package:flow_music/features/auth/data/remote/authenticated_function_client.dart';
import 'package:flow_music/features/home/data/location_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:workmanager/workmanager.dart';

import 'user_location_repository.dart';

const locationBackgroundTaskUniqueName = 'com.streambeat.location.refresh';
const locationBackgroundTaskName = 'location-background-refresh';
const locationBackgroundTaskFrequency = Duration(minutes: 15);

Future<void> initializeLocationBackgroundTask() async {
  // workmanager solo tiene implementacion en Android e iOS. En web y en
  // escritorio (macOS/Windows/Linux) lanza UnimplementedError, asi que
  // omitimos el agendado para no romper el arranque de la app.
  if (kIsWeb) {
    _debugLocationBackgroundLog('skipped: background tasks unsupported on web');
    return;
  }
  if (defaultTargetPlatform != TargetPlatform.android &&
      defaultTargetPlatform != TargetPlatform.iOS) {
    _debugLocationBackgroundLog(
      'skipped: background tasks only supported on Android/iOS '
      '(platform=$defaultTargetPlatform)',
    );
    return;
  }
  await Workmanager().initialize(locationBackgroundTaskDispatcher);
  await Workmanager().registerPeriodicTask(
    locationBackgroundTaskUniqueName,
    locationBackgroundTaskName,
    frequency: locationBackgroundTaskFrequency,
    constraints: Constraints(networkType: NetworkType.connected),
    existingWorkPolicy: ExistingPeriodicWorkPolicy.update,
  );
  _debugLocationBackgroundLog('periodic task registered');
}

@pragma('vm:entry-point')
void locationBackgroundTaskDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    DartPluginRegistrant.ensureInitialized();
    _debugLocationBackgroundLog(
      'callback received task=$task inputData=${inputData ?? const {}}',
    );
    if (!_isLocationTask(task)) {
      _debugLocationBackgroundLog('ignored unrelated task=$task');
      return true;
    }

    try {
      _debugLocationBackgroundLog('task started task=$task');
      await _performLocationBackgroundSave();
      _debugLocationBackgroundLog('task completed task=$task');
      return true;
    } catch (error, stackTrace) {
      _debugLocationBackgroundLog('task failed task=$task error=$error');
      debugPrint('Location background task failed: $error');
      debugPrintStack(stackTrace: stackTrace);
      return false;
    }
  });
}

bool _isLocationTask(String task) {
  return task == locationBackgroundTaskName ||
      task == locationBackgroundTaskUniqueName ||
      task == Workmanager.iOSBackgroundTask;
}

Future<void> _performLocationBackgroundSave() async {
  const secureStorage = FlutterSecureStorage();
  final tokenStore = AuthTokenStore(secureStorage);
  final sessionStore = AuthSessionStore(tokenStore: tokenStore);
  final user = await sessionStore.readBackgroundUser();
  if (user == null || user.isAnonymous) {
    _debugLocationBackgroundLog('skipped: no authenticated session');
    return;
  }

  final repository = UserLocationRepository(
    client: AuthenticatedFunctionClient(
      tokenStore: tokenStore,
      apiClient: const AuthApiClient(),
    ),
    locationService: const LocationService(),
  );
  final interval = await repository.readLocationUpdateInterval(user.id);
  _debugLocationBackgroundLog(
    'saving if due uid=${user.id} interval=${interval.inMinutes}m',
  );
  await repository.saveCurrentLocationIfDue(
    user,
    interval: interval,
    requestPermission: false,
    requireAlwaysPermission: true,
  );
}

void _debugLocationBackgroundLog(String message) {
  if (!kDebugMode) return;
  debugPrint(
    '[----LocationBackgroundTask----] '
    '${DateTime.now().toIso8601String()} '
    'scheduledEvery=${locationBackgroundTaskFrequency.inMinutes}m '
    '$message',
  );
}

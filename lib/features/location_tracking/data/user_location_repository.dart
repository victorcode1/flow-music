import 'dart:async';

import 'package:flow_music/features/auth/data/remote/authenticated_function_client.dart';
import 'package:flutter/foundation.dart';

import '../../auth/domain/entities/auth_user.dart';
import '../../home/data/location_service.dart';
import 'user_location_record.dart';

const defaultUserLocationSaveInterval = Duration(hours: 24);
const minUserLocationSaveInterval = Duration(seconds: 10);
const maxUserLocationSaveInterval = Duration(days: 7);

class UserLocationRepository {
  UserLocationRepository({
    required AuthenticatedFunctionClient client,
    required LocationService locationService,
  }) : _client = client,
       _locationService = locationService;

  final AuthenticatedFunctionClient _client;
  final LocationService _locationService;
  String? _lastReportedLocationStatusKey;
  DateTime? _lastReportedLocationStatusAt;

  Stream<Duration> watchLocationUpdateInterval(String uid) {
    if (uid.isEmpty) return Stream.value(defaultLocationUpdateInterval);
    late final StreamController<Duration> controller;
    Timer? pollTimer;
    StreamSubscription<Map<String, dynamic>>? sseSubscription;
    Duration? lastEmitted;
    var readInFlight = false;
    var closed = false;

    void emit(Duration interval) {
      if (closed || controller.isClosed || interval == lastEmitted) return;
      lastEmitted = interval;
      controller.add(interval);
      if (kDebugMode) {
        debugPrint(
          '[----LocationTracker----] '
          '${DateTime.now().toIso8601String()} '
          'interval updated uid=$uid interval=${interval.inMinutes}m',
        );
      }
    }

    Future<void> poll() async {
      if (readInFlight || closed) return;
      readInFlight = true;
      try {
        emit(await readLocationUpdateInterval(uid));
      } catch (error) {
        if (lastEmitted == null) emit(defaultLocationUpdateInterval);
        if (kDebugMode) {
          debugPrint(
            '[----LocationTracker----] '
            '${DateTime.now().toIso8601String()} '
            'interval poll failed uid=$uid error=$error',
          );
        }
      } finally {
        readInFlight = false;
      }
    }

    controller = StreamController<Duration>(
      onListen: () {
        unawaited(poll());
        pollTimer = Timer.periodic(const Duration(seconds: 15), (_) {
          unawaited(poll());
        });
        sseSubscription = _client
            .sse('userLocationReadInterval', {'uid': uid})
            .listen(
              (json) {
                emit(_intervalFromJson(json));
              },
              onError: (Object error) {
                if (kDebugMode) {
                  debugPrint(
                    '[----LocationTracker----] '
                    '${DateTime.now().toIso8601String()} '
                    'interval stream failed uid=$uid error=$error',
                  );
                }
              },
            );
      },
      onCancel: () async {
        closed = true;
        pollTimer?.cancel();
        await sseSubscription?.cancel();
      },
    );
    return controller.stream;
  }

  Future<Duration> readLocationUpdateInterval(String uid) async {
    final json = await _client.post('userLocationReadInterval', {'uid': uid});
    return _intervalFromJson(json);
  }

  Stream<Duration> watchGlobalLocationUpdateInterval() {
    return _client.sse('locationReadGlobalInterval', {}).map((json) {
      return _intervalFromJson(json);
    });
  }

  Stream<List<UserLocationRecord>> watchUsersWithLocations() {
    return _client.sse('locationUsersWithLocations', {}).map((json) {
      return _records(json['users'], UserLocationRecord.fromJson);
    });
  }

  Stream<List<UserProfileRecord>> watchAnonymousUsers() {
    return _client.sse('locationAnonymousUsers', {}).map((json) {
      return _records(json['users'], UserProfileRecord.fromJson);
    });
  }

  Stream<List<UserLocationHistoryEntry>> watchLocationHistory(String uid) {
    if (uid.isEmpty) return Stream.value(const <UserLocationHistoryEntry>[]);
    return _client.sse('locationHistory', {'uid': uid}).map((json) {
      return _records(json['items'], UserLocationHistoryEntry.fromJson);
    });
  }

  Stream<LocationHistoryCleanupSchedule> watchLocationHistoryCleanupSchedule() {
    return _client.sse('locationReadCleanupSchedule', {}).map((json) {
      return LocationHistoryCleanupSchedule.fromJson(json['schedule']);
    });
  }

  Stream<AnonymousUserCleanupConfig> watchAnonymousUserCleanupConfig() {
    return _client.sse('locationReadAnonymousUserCleanup', {}).map((json) {
      return AnonymousUserCleanupConfig.fromJson(json['config']);
    });
  }

  Future<void> deleteLocationHistoryEntry({
    required String uid,
    required String entryId,
  }) async {
    if (uid.isEmpty || entryId.isEmpty) return;
    await _client.post('locationDeleteHistoryEntry', {
      'uid': uid,
      'entryId': entryId,
    });
  }

  Future<int> deleteAllLocationHistory(String uid) async {
    if (uid.isEmpty) return 0;
    final json = await _client.post('locationDeleteAllUsersHistory', {
      'uid': uid,
    });
    return _readInt(json['deletedCount']) ?? 0;
  }

  Future<int> deleteAllUsersLocationHistory() async {
    final json = await _client.post('locationDeleteAllUsersHistory', {});
    return _readInt(json['deletedCount']) ?? 0;
  }

  Future<void> updateLocationHistoryCleanupSchedule(
    LocationHistoryCleanupSchedule schedule,
  ) async {
    await _client.post('locationReadCleanupSchedule', {
      'enabled': schedule.enabled,
      'hour': schedule.hour,
      'minute': schedule.minute,
      'timezone': schedule.timezone,
    });
  }

  Future<void> updateAnonymousUserCleanupEnabled(bool enabled) async {
    await _client.post('locationReadAnonymousUserCleanup', {
      'enabled': enabled,
    });
  }

  Future<void> updateLocationUpdateInterval({
    required String uid,
    required Duration interval,
  }) async {
    if (uid.isEmpty) return;
    await _client.post('locationSetUserInterval', {
      'uid': uid,
      'seconds': locationIntervalToSeconds(interval),
    });
  }

  Future<int> updateGlobalLocationUpdateInterval(Duration interval) async {
    final json = await _client.post('locationSetGlobalInterval', {
      'seconds': locationIntervalToSeconds(interval),
    });
    return _readInt(json['updatedCount']) ?? 0;
  }

  Future<void> saveCurrentLocationIfDue(
    AuthUser user, {
    Duration interval = defaultUserLocationSaveInterval,
    bool requestPermission = true,
    bool requestAlwaysPermission = false,
    bool requireAlwaysPermission = false,
  }) async {
    try {
      final location = await _locationService.resolveLocation(
        timeLimit: const Duration(seconds: 10),
        allowLastKnownFallback: true,
        maxLastKnownAge: const Duration(minutes: 30),
        requestPermission: requestPermission,
        requestAlwaysPermission: requestAlwaysPermission,
        requireAlwaysPermission: requireAlwaysPermission,
      );
      if (!location.isResolved) {
        await _reportLocationStatus(user, location);
        return;
      }

      final response = await _client.post('userLocationSaveIfDue', {
        'intervalSeconds': locationIntervalToSeconds(interval),
        'latitude': location.latitude,
        'longitude': location.longitude,
        'source': location.isLastKnown ? 'lastKnown' : 'current',
        'positionCapturedAt': location.positionCapturedAt?.toIso8601String(),
        'user': {
          'email': user.email,
          'displayName': _displayNameFor(user),
          'photoUrl': user.photoUrl,
          'isAnonymous': user.isAnonymous,
        },
      });
      if (kDebugMode && response['saved'] == true) {
        debugPrint(
          '[----LocationUpload----] '
          '${DateTime.now().toIso8601String()} '
          'saved uid=${user.id} '
          'interval=${_formatIntervalForLog(interval)} '
          'lat=${location.latitude} lng=${location.longitude}',
        );
      } else if (kDebugMode) {
        debugPrint(
          '[----LocationUpload----] '
          '${DateTime.now().toIso8601String()} '
          'not-saved uid=${user.id} reason=not-due '
          'interval=${_formatIntervalForLog(interval)}',
        );
      }
    } catch (error, stackTrace) {
      debugPrint('UserLocationRepository save failed: $error');
      debugPrintStack(stackTrace: stackTrace);
    }
  }

  Future<void> _reportLocationStatus(
    AuthUser user,
    ResolvedLocation location,
  ) async {
    final reason = location.failureReason ?? 'unavailable';
    final statusKey = '${location.trackingStatus}:$reason';
    final lastReportedAt = _lastReportedLocationStatusAt;
    if (_lastReportedLocationStatusKey == statusKey &&
        lastReportedAt != null &&
        DateTime.now().difference(lastReportedAt) <
            const Duration(minutes: 15)) {
      return;
    }

    await _client.post('userLocationReportStatus', {
      'status': location.trackingStatus,
      'reason': reason,
      'user': {
        'email': user.email,
        'displayName': _displayNameFor(user),
        'photoUrl': user.photoUrl,
        'isAnonymous': user.isAnonymous,
      },
    });
    _lastReportedLocationStatusKey = statusKey;
    _lastReportedLocationStatusAt = DateTime.now();
    if (kDebugMode) {
      debugPrint(
        '[----LocationUpload----] '
        '${DateTime.now().toIso8601String()} '
        'not-saved uid=${user.id} status=${location.trackingStatus} '
        'reason=$reason',
      );
    }
  }
}

Duration _intervalFromJson(Map<String, dynamic> json) {
  return locationIntervalFromSeconds(
    seconds: _readInt(json['seconds']),
    minutes: _readInt(json['minutes']),
  );
}

const defaultLocationHistoryCleanupSchedule = LocationHistoryCleanupSchedule(
  enabled: true,
  hour: 6,
  minute: 0,
  timezone: 'America/Panama',
);

const defaultAnonymousUserCleanupConfig = AnonymousUserCleanupConfig(
  enabled: true,
  inactivityDays: 7,
);

class AnonymousUserCleanupConfig {
  const AnonymousUserCleanupConfig({
    required this.enabled,
    required this.inactivityDays,
    this.lastRunAt,
    this.lastDeletedCount,
  });

  final bool enabled;
  final int inactivityDays;
  final DateTime? lastRunAt;
  final int? lastDeletedCount;

  static AnonymousUserCleanupConfig fromJson(Object? value) {
    if (value is! Map) return defaultAnonymousUserCleanupConfig;
    final data = Map<String, dynamic>.from(value);
    return AnonymousUserCleanupConfig(
      enabled: data['enabled'] != false,
      inactivityDays:
          _readBoundedInt(data['inactivityDays'], min: 1, max: 365) ??
          defaultAnonymousUserCleanupConfig.inactivityDays,
      lastRunAt: _readDate(data['lastRunAt']),
      lastDeletedCount: _readInt(data['lastDeletedCount']),
    );
  }
}

class LocationHistoryCleanupSchedule {
  const LocationHistoryCleanupSchedule({
    required this.enabled,
    required this.hour,
    required this.minute,
    required this.timezone,
    this.lastRunAt,
    this.lastDeletedCount,
  });

  final bool enabled;
  final int hour;
  final int minute;
  final String timezone;
  final DateTime? lastRunAt;
  final int? lastDeletedCount;

  LocationHistoryCleanupSchedule copyWith({
    bool? enabled,
    int? hour,
    int? minute,
    String? timezone,
    DateTime? lastRunAt,
    int? lastDeletedCount,
  }) {
    return LocationHistoryCleanupSchedule(
      enabled: enabled ?? this.enabled,
      hour: hour ?? this.hour,
      minute: minute ?? this.minute,
      timezone: timezone ?? this.timezone,
      lastRunAt: lastRunAt ?? this.lastRunAt,
      lastDeletedCount: lastDeletedCount ?? this.lastDeletedCount,
    );
  }

  static LocationHistoryCleanupSchedule fromJson(Object? value) {
    if (value is! Map) return defaultLocationHistoryCleanupSchedule;
    final data = Map<String, dynamic>.from(value);
    return LocationHistoryCleanupSchedule(
      enabled: data['enabled'] != false,
      hour:
          _readBoundedInt(data['hour'], min: 0, max: 23) ??
          defaultLocationHistoryCleanupSchedule.hour,
      minute:
          _readBoundedInt(data['minute'], min: 0, max: 59) ??
          defaultLocationHistoryCleanupSchedule.minute,
      timezone: (data['timezone'] as String?)?.trim().isNotEmpty == true
          ? (data['timezone'] as String).trim()
          : defaultLocationHistoryCleanupSchedule.timezone,
      lastRunAt: _readDate(data['lastRunAt']),
      lastDeletedCount: _readInt(data['lastDeletedCount']),
    );
  }
}

List<T> _records<T>(
  Object? value,
  T? Function(String id, Map<String, dynamic> data) parse,
) {
  if (value is! List) return <T>[];
  return value
      .whereType<Map>()
      .map((item) {
        final data = Map<String, dynamic>.from(item);
        final id = data['id'] as String? ?? data['uid'] as String? ?? '';
        if (id.isEmpty) return null;
        return parse(id, data);
      })
      .whereType<T>()
      .toList(growable: false);
}

int? _readInt(Object? value) {
  if (value is int) return value;
  if (value is double) return value.round();
  return null;
}

int? _readBoundedInt(Object? value, {required int min, required int max}) {
  final intValue = _readInt(value);
  if (intValue == null || intValue < min || intValue > max) return null;
  return intValue;
}

DateTime? _readDate(Object? value) {
  if (value is DateTime) return value;
  if (value is String) return DateTime.tryParse(value);
  if (value is int) return DateTime.fromMillisecondsSinceEpoch(value);
  if (value is double) {
    return DateTime.fromMillisecondsSinceEpoch(value.round());
  }
  return null;
}

String _formatIntervalForLog(Duration interval) {
  final seconds = locationIntervalToSeconds(interval);
  if (seconds < Duration.secondsPerMinute) return '${seconds}s';
  if (seconds % Duration.secondsPerHour == 0) {
    return '${seconds ~/ Duration.secondsPerHour}h';
  }
  if (seconds % Duration.secondsPerMinute == 0) {
    return '${seconds ~/ Duration.secondsPerMinute}m';
  }
  return '${seconds}s';
}

String _displayNameFor(AuthUser user) {
  final displayName = user.displayName?.trim();
  if (displayName != null && displayName.isNotEmpty) return displayName;
  return user.isAnonymous ? 'Usuario anonimo' : user.id;
}

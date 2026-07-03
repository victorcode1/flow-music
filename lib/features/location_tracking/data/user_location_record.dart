const defaultLocationUpdateInterval = Duration(hours: 24);
const minLocationUpdateInterval = Duration(seconds: 10);
const maxLocationUpdateInterval = Duration(days: 7);

class UserLocationRecord {
  const UserLocationRecord({
    required this.uid,
    required this.latitude,
    required this.longitude,
    required this.updateInterval,
    this.email,
    this.displayName,
    this.photoUrl,
    this.isAnonymous = false,
    this.locationUpdatedAt,
    this.isOnline = false,
    this.appState,
    this.activeSessionId,
    this.lastOpenedAt,
    this.lastSeenAt,
    this.lastOnlineAt,
    this.lastOfflineAt,
    this.presenceUpdatedAt,
    this.appVersion,
    this.buildNumber,
    this.platform,
    this.deviceLocale,
    this.timezoneName,
    this.timezoneOffsetMinutes,
    this.openCount,
    this.locationStatus,
    this.campaignSegments = const <String>[],
  });

  final String uid;
  final String? email;
  final String? displayName;
  final String? photoUrl;
  final bool isAnonymous;
  final double latitude;
  final double longitude;
  final DateTime? locationUpdatedAt;
  final Duration updateInterval;
  final bool isOnline;
  final String? appState;
  final String? activeSessionId;
  final DateTime? lastOpenedAt;
  final DateTime? lastSeenAt;
  final DateTime? lastOnlineAt;
  final DateTime? lastOfflineAt;
  final DateTime? presenceUpdatedAt;
  final String? appVersion;
  final String? buildNumber;
  final String? platform;
  final String? deviceLocale;
  final String? timezoneName;
  final int? timezoneOffsetMinutes;
  final int? openCount;
  final LocationTrackingStatus? locationStatus;
  final List<String> campaignSegments;

  bool get isEffectivelyOnline => isOnline;

  String get title {
    final name = displayName?.trim();
    if (name != null && name.isNotEmpty) return name;
    final cleanEmail = email?.trim();
    if (cleanEmail != null && cleanEmail.isNotEmpty) return cleanEmail;
    if (isAnonymous) return 'Usuario anonimo';
    return uid;
  }

  String get subtitle {
    final cleanEmail = email?.trim();
    if (cleanEmail != null && cleanEmail.isNotEmpty && cleanEmail != title) {
      return cleanEmail;
    }
    if (isAnonymous) return 'Invitado · $uid';
    return uid;
  }

  static UserLocationRecord? fromJson(String uid, Map<String, dynamic> data) {
    final location = data['lastLocation'];
    if (location is! Map<String, dynamic>) return null;

    final latitude = _readDouble(location['latitude']);
    final longitude = _readDouble(location['longitude']);
    if (latitude == null || longitude == null) return null;
    final email = data['email'] as String?;
    final displayName = data['displayName'] as String?;

    return UserLocationRecord(
      uid: uid,
      email: email,
      displayName: displayName,
      photoUrl: data['photoUrl'] as String?,
      isAnonymous: _isAnonymousLike(
        isAnonymous: data['isAnonymous'] == true,
        email: email,
        displayName: displayName,
      ),
      latitude: latitude,
      longitude: longitude,
      locationUpdatedAt: _readDate(location['updatedAt']),
      updateInterval: locationIntervalFromSeconds(
        seconds: _readInt(data['locationUpdateIntervalSeconds']),
        minutes: _readInt(data['locationUpdateIntervalMinutes']),
      ),
      isOnline: data['isOnline'] == true,
      appState: data['appState'] as String?,
      activeSessionId: data['activeSessionId'] as String?,
      lastOpenedAt: _readDate(data['lastOpenedAt']),
      lastSeenAt: _readDate(data['lastSeenAt']),
      lastOnlineAt: _readDate(data['lastOnlineAt']),
      lastOfflineAt: _readDate(data['lastOfflineAt']),
      presenceUpdatedAt: _readDate(data['presenceUpdatedAt']),
      appVersion: data['appVersion'] as String?,
      buildNumber: data['buildNumber'] as String?,
      platform: data['platform'] as String?,
      deviceLocale: data['deviceLocale'] as String?,
      timezoneName: data['timezoneName'] as String?,
      timezoneOffsetMinutes: _readInt(data['timezoneOffsetMinutes']),
      openCount: _readInt(data['openCount']),
      locationStatus: LocationTrackingStatus.fromJson(data['locationStatus']),
      campaignSegments: _readStringList(data['campaignSegments']),
    );
  }
}

class LocationTrackingStatus {
  const LocationTrackingStatus({
    required this.status,
    required this.reason,
    this.updatedAt,
  });

  final String status;
  final String reason;
  final DateTime? updatedAt;

  bool get isHealthy => status == 'saved';

  static LocationTrackingStatus? fromJson(Object? value) {
    if (value is! Map) return null;
    final data = Map<String, dynamic>.from(value);
    final status = data['status'];
    if (status is! String || status.trim().isEmpty) return null;
    final reason = data['reason'];
    return LocationTrackingStatus(
      status: status.trim(),
      reason: reason is String && reason.trim().isNotEmpty
          ? reason.trim()
          : 'unavailable',
      updatedAt: _readDate(data['updatedAt']),
    );
  }
}

class UserLocationHistoryEntry {
  const UserLocationHistoryEntry({
    required this.id,
    required this.latitude,
    required this.longitude,
    this.createdAt,
  });

  final String id;
  final double latitude;
  final double longitude;
  final DateTime? createdAt;

  static UserLocationHistoryEntry? fromJson(
    String id,
    Map<String, dynamic> data,
  ) {
    final latitude = _readDouble(data['latitude']);
    final longitude = _readDouble(data['longitude']);
    if (latitude == null || longitude == null) return null;

    return UserLocationHistoryEntry(
      id: id,
      latitude: latitude,
      longitude: longitude,
      createdAt: _readDate(data['createdAt']),
    );
  }
}

class UserProfileRecord {
  const UserProfileRecord({
    required this.uid,
    this.email,
    this.displayName,
    this.photoUrl,
    this.isAnonymous = false,
    this.latitude,
    this.longitude,
    this.locationUpdatedAt,
    this.hasLocation = false,
    this.isOnline = false,
    this.appState,
    this.lastSeenAt,
    this.appVersion,
    this.buildNumber,
    this.platform,
    this.deviceLocale,
    this.openCount,
    this.locationStatus,
  });

  final String uid;
  final String? email;
  final String? displayName;
  final String? photoUrl;
  final bool isAnonymous;
  final double? latitude;
  final double? longitude;
  final DateTime? locationUpdatedAt;
  final bool hasLocation;
  final bool isOnline;
  final String? appState;
  final DateTime? lastSeenAt;
  final String? appVersion;
  final String? buildNumber;
  final String? platform;
  final String? deviceLocale;
  final int? openCount;
  final LocationTrackingStatus? locationStatus;

  bool get isEffectivelyOnline => isOnline;

  String get title {
    final name = displayName?.trim();
    if (name != null && name.isNotEmpty) return name;
    final cleanEmail = email?.trim();
    if (cleanEmail != null && cleanEmail.isNotEmpty) return cleanEmail;
    if (isAnonymousLike) return 'Usuario anonimo';
    return uid;
  }

  String get subtitle {
    final cleanEmail = email?.trim();
    if (cleanEmail != null && cleanEmail.isNotEmpty && cleanEmail != title) {
      return cleanEmail;
    }
    if (isAnonymousLike) return 'Invitado · $uid';
    return uid;
  }

  bool get isAnonymousLike {
    return _isAnonymousLike(
      isAnonymous: isAnonymous,
      email: email,
      displayName: displayName,
    );
  }

  UserLocationRecord? get locationRecord {
    final resolvedLatitude = latitude;
    final resolvedLongitude = longitude;
    if (!hasLocation || resolvedLatitude == null || resolvedLongitude == null) {
      return null;
    }

    return UserLocationRecord(
      uid: uid,
      email: email,
      displayName: displayName,
      photoUrl: photoUrl,
      isAnonymous: isAnonymousLike,
      latitude: resolvedLatitude,
      longitude: resolvedLongitude,
      locationUpdatedAt: locationUpdatedAt,
      updateInterval: defaultLocationUpdateInterval,
      isOnline: isOnline,
      appState: appState,
      lastSeenAt: lastSeenAt,
      appVersion: appVersion,
      buildNumber: buildNumber,
      platform: platform,
      deviceLocale: deviceLocale,
      openCount: openCount,
      locationStatus: locationStatus,
    );
  }

  static UserProfileRecord fromJson(String uid, Map<String, dynamic> data) {
    final location = data['lastLocation'];
    final latitude = location is Map<String, dynamic>
        ? _readDouble(location['latitude'])
        : null;
    final longitude = location is Map<String, dynamic>
        ? _readDouble(location['longitude'])
        : null;

    final email = data['email'] as String?;
    final displayName = data['displayName'] as String?;

    return UserProfileRecord(
      uid: uid,
      email: email,
      displayName: displayName,
      photoUrl: data['photoUrl'] as String?,
      isAnonymous: _isAnonymousLike(
        isAnonymous: data['isAnonymous'] == true,
        email: email,
        displayName: displayName,
      ),
      latitude: latitude,
      longitude: longitude,
      locationUpdatedAt: location is Map<String, dynamic>
          ? _readDate(location['updatedAt'])
          : null,
      hasLocation:
          data['hasLocation'] == true && latitude != null && longitude != null,
      isOnline: data['isOnline'] == true,
      appState: data['appState'] as String?,
      lastSeenAt: _readDate(data['lastSeenAt']),
      appVersion: data['appVersion'] as String?,
      buildNumber: data['buildNumber'] as String?,
      platform: data['platform'] as String?,
      deviceLocale: data['deviceLocale'] as String?,
      openCount: _readInt(data['openCount']),
      locationStatus: LocationTrackingStatus.fromJson(data['locationStatus']),
    );
  }
}

Duration locationIntervalFromSeconds({int? seconds, int? minutes}) {
  if (seconds != null) {
    return _clampDuration(Duration(seconds: seconds));
  }
  if (minutes != null) {
    return _clampDuration(Duration(minutes: minutes));
  }
  return defaultLocationUpdateInterval;
}

int locationIntervalToSeconds(Duration interval) {
  return _clampDuration(interval).inSeconds;
}

Duration _clampDuration(Duration interval) {
  if (interval < minLocationUpdateInterval) return minLocationUpdateInterval;
  if (interval > maxLocationUpdateInterval) return maxLocationUpdateInterval;
  return interval;
}

double? _readDouble(Object? value) {
  if (value is int) return value.toDouble();
  if (value is double) return value;
  return null;
}

int? _readInt(Object? value) {
  if (value is int) return value;
  if (value is double) return value.round();
  return null;
}

DateTime? _readDate(Object? value) {
  if (value is DateTime) return value.toLocal();
  if (value is String) return DateTime.tryParse(value)?.toLocal();
  if (value is int) return DateTime.fromMillisecondsSinceEpoch(value);
  if (value is double) {
    return DateTime.fromMillisecondsSinceEpoch(value.round());
  }
  return null;
}

bool _isAnonymousLike({
  required bool isAnonymous,
  required String? email,
  required String? displayName,
}) {
  if (isAnonymous) return true;

  final cleanEmail = email?.trim();
  if (cleanEmail != null && cleanEmail.isNotEmpty) return false;

  final cleanName = displayName?.trim().toLowerCase();
  return cleanName == null ||
      cleanName.isEmpty ||
      cleanName == 'usuario anonimo' ||
      cleanName == 'usuario anónimo';
}

List<String> _readStringList(Object? value) {
  if (value is! Iterable) return const <String>[];
  return value.whereType<String>().where((item) => item.isNotEmpty).toList();
}

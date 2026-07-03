import 'package:flow_music/features/auth/data/remote/authenticated_function_client.dart';

import '../../auth/domain/entities/auth_user.dart';

class UserPresenceMetadata {
  const UserPresenceMetadata({
    required this.appVersion,
    required this.buildNumber,
    required this.platform,
    required this.deviceLocale,
    required this.timezoneName,
    required this.timezoneOffsetMinutes,
    required this.campaignSegments,
  });

  final String appVersion;
  final String buildNumber;
  final String platform;
  final String deviceLocale;
  final String timezoneName;
  final int timezoneOffsetMinutes;
  final List<String> campaignSegments;

  Map<String, Object?> toJson() {
    return {
      'appVersion': appVersion,
      'buildNumber': buildNumber,
      'platform': platform,
      'deviceLocale': deviceLocale,
      'timezoneName': timezoneName,
      'timezoneOffsetMinutes': timezoneOffsetMinutes,
      'campaignSegments': campaignSegments,
    };
  }
}

class UserPresenceRepository {
  const UserPresenceRepository({required AuthenticatedFunctionClient client})
    : _client = client;

  final AuthenticatedFunctionClient _client;

  Future<void> startSession({
    required AuthUser user,
    required String sessionId,
    required UserPresenceMetadata metadata,
  }) async {
    if (user.id.isEmpty || sessionId.isEmpty || user.isAnonymous) return;
    await _client.post('userPresenceStart', {
      'sessionId': sessionId,
      'user': _userJson(user),
      'metadata': metadata.toJson(),
    });
  }

  Future<void> updatePresence({
    required String uid,
    required String sessionId,
    required bool isOnline,
    required String appState,
  }) async {
    if (uid.isEmpty || sessionId.isEmpty) return;
    await _client.post('userPresenceUpdate', {
      'sessionId': sessionId,
      'isOnline': isOnline,
      'appState': appState,
    });
  }

  Future<void> endSession({
    required String uid,
    required String sessionId,
    required String appState,
  }) async {
    if (uid.isEmpty || sessionId.isEmpty) return;
    await _client.post('userPresenceEnd', {
      'sessionId': sessionId,
      'appState': appState,
    });
  }

  Future<void> deleteAnonymousUserData(String uid) async {
    if (uid.isEmpty) return;
    await _client.post('userPresenceDeleteAnonymousData', {'uid': uid});
  }
}

Map<String, Object?> _userJson(AuthUser user) {
  return {
    'email': user.email,
    'displayName': user.displayName,
    'photoUrl': user.photoUrl,
    'isAnonymous': user.isAnonymous,
  };
}

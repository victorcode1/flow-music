import 'dart:async';

import 'package:flow_music/features/auth/domain/entities/auth_user.dart';
import 'package:flow_music/features/auth/presentation/notifiers/auth_notifier.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'user_presence_providers.dart';
import 'user_presence_repository.dart';

part 'user_presence_tracker.g.dart';

@Riverpod(keepAlive: true)
class UserPresenceTracker extends _$UserPresenceTracker {
  AuthUser? _activeUser;
  String? _activeSessionId;
  UserPresenceRepository? _repository;

  @override
  void build() {
    _repository ??= ref.read(userPresenceRepositoryProvider);
    ref.onDispose(() {
      _endActiveSession('disposed');
    });

    final user = ref.watch(authProvider).asData?.value;
    if (user == null) {
      _endActiveSession('signedOut');
      return;
    }

    if (_activeUser?.id == user.id) return;
    _endActiveSession('accountChanged');
    _startSession(user);
  }

  void handleLifecycleState(AppLifecycleState state) {
    final user = _activeUser;
    final sessionId = _activeSessionId;
    if (user == null || sessionId == null) return;

    switch (state) {
      case AppLifecycleState.resumed:
        unawaited(_updatePresence(isOnline: true, appState: 'foreground'));
      case AppLifecycleState.paused:
        unawaited(_updatePresence(isOnline: false, appState: 'background'));
      case AppLifecycleState.hidden:
        unawaited(_updatePresence(isOnline: false, appState: 'hidden'));
      case AppLifecycleState.detached:
        if (user.isAnonymous) {
          unawaited(_deleteAnonymousAndEnd(user));
        } else {
          _endActiveSession('terminated');
        }
      case AppLifecycleState.inactive:
        break;
    }
  }

  void _startSession(AuthUser user) {
    _activeUser = user;
    _activeSessionId = DateTime.now().microsecondsSinceEpoch.toString();
    unawaited(_startOrRefreshSession(user));
  }

  Future<void> _startOrRefreshSession(AuthUser user) async {
    final sessionId = _activeSessionId;
    if (sessionId == null) return;
    try {
      await _repository?.startSession(
        user: user,
        sessionId: sessionId,
        metadata: await _metadata(),
      );
    } catch (e) {
      debugPrint('UserPresenceTracker start session failed: $e');
    }
  }

  Future<void> _updatePresence({
    required bool isOnline,
    required String appState,
  }) async {
    final uid = _activeUser?.id;
    final sessionId = _activeSessionId;
    if (uid == null || sessionId == null) return;
    try {
      await _repository?.updatePresence(
        uid: uid,
        sessionId: sessionId,
        isOnline: isOnline,
        appState: appState,
      );
    } catch (e) {
      debugPrint('UserPresenceTracker update presence failed: $e');
    }
  }

  void _endActiveSession(String appState) {
    final uid = _activeUser?.id;
    final sessionId = _activeSessionId;
    _activeUser = null;
    _activeSessionId = null;
    if (uid == null || sessionId == null) return;

    unawaited(_endSession(uid: uid, sessionId: sessionId, appState: appState));
  }

  Future<void> _endSession({
    required String uid,
    required String sessionId,
    required String appState,
  }) async {
    try {
      await _repository?.endSession(
        uid: uid,
        sessionId: sessionId,
        appState: appState,
      );
    } catch (e) {
      debugPrint('UserPresenceTracker end session failed: $e');
    }
  }

  Future<void> _deleteAnonymousAndEnd(AuthUser user) async {
    _activeUser = null;
    _activeSessionId = null;
    try {
      await _repository?.deleteAnonymousUserData(user.id);
    } catch (e) {
      debugPrint('UserPresenceTracker anon firestore cleanup failed: $e');
    }
  }

  Future<UserPresenceMetadata> _metadata() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final now = DateTime.now();
    final locale = WidgetsBinding.instance.platformDispatcher.locale;
    final platform = _platformName();
    final language = locale.languageCode.toLowerCase();

    return UserPresenceMetadata(
      appVersion: packageInfo.version,
      buildNumber: packageInfo.buildNumber,
      platform: platform,
      deviceLocale: locale.toLanguageTag(),
      timezoneName: now.timeZoneName,
      timezoneOffsetMinutes: now.timeZoneOffset.inMinutes,
      campaignSegments: ['platform_$platform', 'locale_$language'],
    );
  }

  String _platformName() {
    if (kIsWeb) return 'web';
    return switch (defaultTargetPlatform) {
      TargetPlatform.android => 'android',
      TargetPlatform.iOS => 'ios',
      TargetPlatform.macOS => 'macos',
      TargetPlatform.windows => 'windows',
      TargetPlatform.linux => 'linux',
      TargetPlatform.fuchsia => 'fuchsia',
    };
  }
}

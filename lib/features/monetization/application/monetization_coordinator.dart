import 'dart:async';

import 'package:flow_music/features/account/domain/entities/app_user.dart';
import 'package:flow_music/features/account/domain/repositories/auth_repository.dart';
import 'package:flow_music/features/account/domain/repositories/customer_profile_repository.dart';
import 'package:flow_music/features/monetization/domain/repositories/subscription_repository.dart';
import 'package:flutter/foundation.dart';

/// Mantiene alineadas la identidad de Supabase y la de RevenueCat.
class MonetizationCoordinator {
  MonetizationCoordinator(this._auth, this._profiles, this._subscriptions);

  final AuthRepository _auth;
  final CustomerProfileRepository _profiles;
  final SubscriptionRepository _subscriptions;
  StreamSubscription<AppUser?>? _authSubscription;
  String? _lastUserId;
  bool _hasHandledIdentity = false;

  Future<void> initialize() async {
    await _handleUser(_auth.currentUser);
    _authSubscription = _auth.authStateChanges.listen((user) {
      unawaited(_handleUser(user));
    });
  }

  Future<void> _handleUser(AppUser? user) async {
    if (_hasHandledIdentity && _lastUserId == user?.id) return;
    _hasHandledIdentity = true;
    _lastUserId = user?.id;
    try {
      await _subscriptions.initialize(userId: user?.id);
      await _subscriptions.identify(user?.id);
      if (user != null) await _profiles.sync(user);
    } catch (error, stackTrace) {
      debugPrint('Unable to synchronize monetization identity: $error');
      debugPrintStack(stackTrace: stackTrace);
    }
  }

  void dispose() {
    _authSubscription?.cancel();
  }
}

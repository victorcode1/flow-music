import 'dart:async';

import 'package:flow_music/features/account/domain/entities/app_user.dart';
import 'package:flow_music/features/account/domain/repositories/auth_repository.dart';
import 'package:flow_music/features/account/domain/repositories/customer_profile_repository.dart';
import 'package:flow_music/features/monetization/application/monetization_coordinator.dart';
import 'package:flow_music/features/monetization/domain/entities/subscription_access.dart';
import 'package:flow_music/features/monetization/domain/repositories/subscription_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'initializes RevenueCat even when the first user is anonymous',
    () async {
      final auth = _StreamingAuthRepository();
      final subscriptions = _TrackingSubscriptionRepository();
      final coordinator = MonetizationCoordinator(
        auth,
        const NoopCustomerProfileRepository(),
        subscriptions,
      );

      await coordinator.initialize();

      expect(subscriptions.initializedUserIds, [null]);
      expect(subscriptions.identifiedUserIds, [null]);

      coordinator.dispose();
      await auth.dispose();
    },
  );

  test(
    'uses the same Supabase id for profile and subscription state',
    () async {
      final auth = _StreamingAuthRepository();
      final profiles = _TrackingProfileRepository();
      final subscriptions = _TrackingSubscriptionRepository();
      final coordinator = MonetizationCoordinator(
        auth,
        profiles,
        subscriptions,
      );
      await coordinator.initialize();

      const user = AppUser(id: 'supabase-user-id', email: 'user@example.com');
      auth.emit(user);
      await Future<void>.delayed(Duration.zero);

      expect(subscriptions.initializedUserIds, [null, 'supabase-user-id']);
      expect(subscriptions.identifiedUserIds, [null, 'supabase-user-id']);
      expect(profiles.syncedUserIds, ['supabase-user-id']);

      coordinator.dispose();
      await auth.dispose();
    },
  );
}

class _StreamingAuthRepository implements AuthRepository {
  final _changes = StreamController<AppUser?>.broadcast();
  AppUser? _user;

  void emit(AppUser? user) {
    _user = user;
    _changes.add(user);
  }

  Future<void> dispose() => _changes.close();

  @override
  Stream<AppUser?> get authStateChanges => _changes.stream;

  @override
  AppUser? get currentUser => _user;

  @override
  bool get isAvailable => true;

  @override
  Future<void> deleteAccount() async {}

  @override
  Future<void> sendPasswordReset(String email) async {}

  @override
  Future<AppUser> signIn({required String email, required String password}) =>
      throw UnimplementedError();

  @override
  Future<void> signOut() async {}

  @override
  Future<SignUpResult> signUp({
    required String email,
    required String password,
    String? displayName,
  }) => throw UnimplementedError();

  @override
  Future<void> updatePassword(String password) async {}
}

class _TrackingProfileRepository implements CustomerProfileRepository {
  final syncedUserIds = <String>[];

  @override
  Future<void> sync(AppUser user) async => syncedUserIds.add(user.id);
}

class _TrackingSubscriptionRepository implements SubscriptionRepository {
  final initializedUserIds = <String?>[];
  final identifiedUserIds = <String?>[];

  @override
  bool get isAvailable => true;

  @override
  void dispose() {}

  @override
  Future<SubscriptionAccess> identify(String? userId) async {
    identifiedUserIds.add(userId);
    return const SubscriptionAccess.free();
  }

  @override
  Future<void> initialize({String? userId}) async {
    initializedUserIds.add(userId);
  }

  @override
  Future<SubscriptionOffer> loadMonthlyOffer() => throw UnimplementedError();

  @override
  Future<SubscriptionAccess> purchaseMonthly() => throw UnimplementedError();

  @override
  Future<SubscriptionAccess> refresh() async => const SubscriptionAccess.free();

  @override
  Future<SubscriptionAccess> restore() => throw UnimplementedError();

  @override
  Stream<SubscriptionAccess> watchAccess() =>
      Stream.value(const SubscriptionAccess.free());
}

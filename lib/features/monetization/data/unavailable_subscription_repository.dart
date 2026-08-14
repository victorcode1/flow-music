import 'package:flow_music/features/monetization/domain/entities/subscription_access.dart';
import 'package:flow_music/features/monetization/domain/repositories/subscription_repository.dart';

class UnavailableSubscriptionRepository implements SubscriptionRepository {
  const UnavailableSubscriptionRepository();

  static const _failure = SubscriptionFailure(
    'Las suscripciones todavia no estan configuradas.',
  );

  @override
  bool get isAvailable => false;

  @override
  Future<SubscriptionAccess> identify(String? userId) async =>
      const SubscriptionAccess.unavailable();

  @override
  Future<void> initialize({String? userId}) async {}

  @override
  Future<SubscriptionOffer> loadMonthlyOffer() => Future.error(_failure);

  @override
  Future<SubscriptionAccess> purchaseMonthly() => Future.error(_failure);

  @override
  Future<SubscriptionAccess> refresh() async =>
      const SubscriptionAccess.unavailable();

  @override
  Future<SubscriptionAccess> restore() => Future.error(_failure);

  @override
  Stream<SubscriptionAccess> watchAccess() =>
      Stream.value(const SubscriptionAccess.unavailable());

  @override
  void dispose() {}
}

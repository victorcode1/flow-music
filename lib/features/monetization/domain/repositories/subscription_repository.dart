import 'package:flow_music/features/monetization/domain/entities/subscription_access.dart';

abstract interface class SubscriptionRepository {
  bool get isAvailable;

  Stream<SubscriptionAccess> watchAccess();

  Future<void> initialize({String? userId});

  Future<SubscriptionAccess> identify(String? userId);

  Future<SubscriptionOffer> loadMonthlyOffer();

  Future<SubscriptionAccess> purchaseMonthly();

  Future<SubscriptionAccess> restore();

  Future<SubscriptionAccess> refresh();

  void dispose();
}

class SubscriptionFailure implements Exception {
  const SubscriptionFailure(this.message, {this.cancelled = false});

  final String message;
  final bool cancelled;

  @override
  String toString() => message;
}

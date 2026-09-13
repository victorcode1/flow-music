class SubscriptionAccess {
  const SubscriptionAccess({
    required this.isResolved,
    required this.serviceAvailable,
    required bool isActive,
    this.willRenew = false,
    this.productId,
    this.expiresAt,
    this.store,
    this.managementUrl,
    this.userId,
    this.hasMonthlySubscription = false,
    this.monthlyExpiresAt,
  }) : _isActive = isActive;

  const SubscriptionAccess.loading()
    : this(isResolved: false, serviceAvailable: true, isActive: false);

  const SubscriptionAccess.unavailable()
    : this(isResolved: true, serviceAvailable: false, isActive: false);

  const SubscriptionAccess.free()
    : this(isResolved: true, serviceAvailable: true, isActive: false);

  final bool isResolved;
  final bool serviceAvailable;
  final bool _isActive;
  bool get isActive =>
      _isActive && (expiresAt == null || expiresAt!.isAfter(DateTime.now()));
  final bool willRenew;
  final String? productId;
  final DateTime? expiresAt;
  final String? store;
  final String? managementUrl;
  final String? userId;
  final bool hasMonthlySubscription;
  final DateTime? monthlyExpiresAt;
}

enum PremiumOfferKind { monthly, lifetime }

class PremiumOffer {
  const PremiumOffer({
    required this.kind,
    required this.productId,
    required this.priceLabel,
    this.period,
  });

  final PremiumOfferKind kind;
  final String productId;
  final String priceLabel;
  final String? period;
}

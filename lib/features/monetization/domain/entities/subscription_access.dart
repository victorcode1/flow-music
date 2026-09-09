class SubscriptionAccess {
  const SubscriptionAccess({
    required this.isResolved,
    required this.serviceAvailable,
    required this.isActive,
    this.willRenew = false,
    this.productId,
    this.expiresAt,
    this.store,
  });

  const SubscriptionAccess.loading()
    : this(isResolved: false, serviceAvailable: true, isActive: false);

  const SubscriptionAccess.unavailable()
    : this(isResolved: true, serviceAvailable: false, isActive: false);

  const SubscriptionAccess.free()
    : this(isResolved: true, serviceAvailable: true, isActive: false);

  final bool isResolved;
  final bool serviceAvailable;
  final bool isActive;
  final bool willRenew;
  final String? productId;
  final DateTime? expiresAt;
  final String? store;
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

import 'dart:async';

import 'package:flow_music/core/config/app_environment.dart';
import 'package:flow_music/features/monetization/domain/entities/subscription_access.dart';
import 'package:flow_music/features/monetization/domain/repositories/subscription_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class RevenueCatSubscriptionRepository implements SubscriptionRepository {
  RevenueCatSubscriptionRepository();

  final _updates = StreamController<SubscriptionAccess>.broadcast();
  SubscriptionAccess _current = const SubscriptionAccess.loading();
  final _packages = <PremiumOfferKind, Package>{};
  bool _initialized = false;
  String? _identifiedUserId;
  bool _changingIdentity = false;
  Timer? _expiryTimer;

  late final CustomerInfoUpdateListener _customerInfoListener =
      _handleCustomerInfo;

  @override
  bool get isAvailable =>
      AppEnvironment.supportsNativeMonetization &&
      AppEnvironment.revenueCatApiKey.trim().isNotEmpty;

  @override
  Stream<SubscriptionAccess> watchAccess() async* {
    yield _current;
    yield* _updates.stream;
  }

  @override
  Future<void> initialize({String? userId}) async {
    if (_initialized) {
      await identify(userId);
      return;
    }
    if (!isAvailable) {
      _emit(const SubscriptionAccess.unavailable());
      return;
    }

    if (kDebugMode) await Purchases.setLogLevel(LogLevel.debug);
    final configuration = PurchasesConfiguration(
      AppEnvironment.revenueCatApiKey,
    )..appUserID = userId;
    await Purchases.configure(configuration);
    Purchases.addCustomerInfoUpdateListener(_customerInfoListener);
    _initialized = true;
    _identifiedUserId = userId;
    await refresh();
  }

  @override
  Future<SubscriptionAccess> identify(String? userId) async {
    if (!_initialized) {
      await initialize(userId: userId);
      return _current;
    }
    if (_identifiedUserId == userId) return refresh();

    _changingIdentity = true;
    _emit(const SubscriptionAccess.loading());
    try {
      final CustomerInfo info;
      if (userId == null) {
        final isAnonymous = await Purchases.isAnonymous;
        info = isAnonymous
            ? await Purchases.getCustomerInfo()
            : await Purchases.logOut();
      } else {
        info = (await Purchases.logIn(userId)).customerInfo;
      }
      _identifiedUserId = userId;
      return _map(info);
    } on PlatformException catch (error) {
      _identifiedUserId = null;
      throw _failure(error);
    } finally {
      _changingIdentity = false;
    }
  }

  @override
  Future<List<PremiumOffer>> loadOffers() async {
    await initialize(userId: _identifiedUserId);
    if (!_initialized) {
      throw const SubscriptionFailure(
        'Las suscripciones todavia no estan configuradas.',
      );
    }
    try {
      final offerings = await Purchases.getOfferings();
      final offering = offerings.current;
      final monthly = _findPackage(
        offering,
        kind: PremiumOfferKind.monthly,
        productId: AppEnvironment.revenueCatMonthlyProductId,
      );
      final lifetime = _findPackage(
        offering,
        kind: PremiumOfferKind.lifetime,
        productId: AppEnvironment.revenueCatLifetimeProductId,
      );
      _packages.clear();
      if (monthly != null) _packages[PremiumOfferKind.monthly] = monthly;
      if (lifetime != null) _packages[PremiumOfferKind.lifetime] = lifetime;
      if (_packages.isEmpty) {
        throw const SubscriptionFailure(
          'Las opciones Premium no estan disponibles en esta tienda.',
        );
      }
      return _packages.entries
          .map(
            (entry) => PremiumOffer(
              kind: entry.key,
              productId: entry.value.storeProduct.identifier,
              priceLabel: entry.value.storeProduct.priceString,
              period: entry.value.storeProduct.subscriptionPeriod,
            ),
          )
          .toList(growable: false);
    } on PlatformException catch (error) {
      throw _failure(error);
    }
  }

  @override
  Future<SubscriptionAccess> purchase(PremiumOfferKind kind) async {
    final purchasingUserId = _identifiedUserId;
    try {
      if (!_packages.containsKey(kind)) await loadOffers();
      final selected = _packages[kind];
      if (selected == null) {
        throw SubscriptionFailure(
          kind == PremiumOfferKind.lifetime
              ? 'La compra de por vida no esta disponible en esta tienda.'
              : 'El plan mensual no esta disponible en esta tienda.',
        );
      }
      final result = await Purchases.purchase(PurchaseParams.package(selected));
      if (_identifiedUserId != purchasingUserId || _changingIdentity) {
        throw const SubscriptionFailure(
          'La cuenta cambió. Inicia sesión con la cuenta de la compra para restaurarla.',
        );
      }
      return _map(result.customerInfo);
    } on PlatformException catch (error) {
      throw _failure(error);
    }
  }

  Package? _findPackage(
    Offering? offering, {
    required PremiumOfferKind kind,
    required String productId,
  }) {
    if (offering == null) return null;
    final predefined = switch (kind) {
      PremiumOfferKind.monthly => offering.monthly,
      PremiumOfferKind.lifetime => offering.lifetime,
    };
    if (predefined != null &&
        revenueCatProductIdentifierMatches(
          predefined.storeProduct.identifier,
          productId,
        )) {
      return predefined;
    }
    return offering.availablePackages.cast<Package?>().firstWhere(
      (item) =>
          item != null &&
          revenueCatProductIdentifierMatches(
            item.storeProduct.identifier,
            productId,
          ),
      orElse: () => null,
    );
  }

  @override
  Future<SubscriptionAccess> restore() async {
    final restoringUserId = _identifiedUserId;
    try {
      final info = await Purchases.restorePurchases();
      if (_identifiedUserId != restoringUserId || _changingIdentity) {
        throw const SubscriptionFailure(
          'La cuenta cambió. Inicia sesión de nuevo para restaurar la compra.',
        );
      }
      return _map(info);
    } on PlatformException catch (error) {
      throw _failure(error);
    }
  }

  @override
  Future<SubscriptionAccess> refresh() async {
    if (!_initialized) return _current;
    final userId = _identifiedUserId;
    try {
      final info = await Purchases.getCustomerInfo();
      return userId == _identifiedUserId && !_changingIdentity
          ? _map(info)
          : _current;
    } on PlatformException catch (error) {
      throw _failure(error);
    }
  }

  void _handleCustomerInfo(CustomerInfo info) {
    if (!_changingIdentity) _map(info);
  }

  SubscriptionAccess _map(CustomerInfo info) {
    final entitlement =
        info.entitlements.all[AppEnvironment.revenueCatEntitlementId];
    DateTime? monthlyExpiry;
    for (final id in info.activeSubscriptions) {
      if (!revenueCatProductIdentifierMatches(
        id,
        AppEnvironment.revenueCatMonthlyProductId,
      )) {
        continue;
      }
      final expiry = DateTime.tryParse(info.allExpirationDates[id] ?? '');
      if (expiry != null &&
          expiry.isAfter(DateTime.now()) &&
          (monthlyExpiry == null || expiry.isAfter(monthlyExpiry))) {
        monthlyExpiry = expiry;
      }
    }
    final access = SubscriptionAccess(
      isResolved: true,
      serviceAvailable: true,
      isActive: _identifiedUserId != null && (entitlement?.isActive ?? false),
      userId: _identifiedUserId,
      hasMonthlySubscription:
          _identifiedUserId != null && monthlyExpiry != null,
      monthlyExpiresAt: monthlyExpiry,
      managementUrl: info.managementURL,
      willRenew: entitlement?.willRenew ?? false,
      productId: entitlement?.productIdentifier,
      expiresAt: entitlement?.expirationDate == null
          ? null
          : DateTime.tryParse(entitlement!.expirationDate!),
      store: entitlement?.store.name,
    );
    _emit(access);
    return access;
  }

  void _emit(SubscriptionAccess access) {
    _current = access;
    if (_updates.isClosed) return;
    _updates.add(access);
    _expiryTimer?.cancel();
    final now = DateTime.now();
    final expirations = [
      access.expiresAt,
      access.monthlyExpiresAt,
    ].whereType<DateTime>().where((date) => date.isAfter(now)).toList()..sort();
    if (access.isResolved && access.userId != null && expirations.isNotEmpty) {
      _expiryTimer = Timer(expirations.first.difference(now), () async {
        // Refresh at the paid boundary even if the app stays in the foreground.
        try {
          await Purchases.invalidateCustomerInfoCache();
          await refresh();
        } catch (_) {
          _emit(_current);
        }
      });
    }
  }

  SubscriptionFailure _failure(PlatformException error) {
    PurchasesErrorCode code;
    try {
      code = PurchasesErrorHelper.getErrorCode(error);
    } catch (_) {
      code = PurchasesErrorCode.unknownError;
    }
    return SubscriptionFailure(
      error.message ?? 'No se pudo completar la operacion con la tienda.',
      cancelled: code == PurchasesErrorCode.purchaseCancelledError,
    );
  }

  @override
  void dispose() {
    _expiryTimer?.cancel();
    if (_initialized) {
      Purchases.removeCustomerInfoUpdateListener(_customerInfoListener);
    }
    _updates.close();
  }
}

@visibleForTesting
bool revenueCatProductIdentifierMatches(
  String storeIdentifier,
  String configuredProductId,
) {
  return storeIdentifier == configuredProductId ||
      storeIdentifier.startsWith('$configuredProductId:');
}

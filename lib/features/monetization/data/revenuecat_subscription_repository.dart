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
  Package? _monthlyPackage;
  bool _initialized = false;
  String? _identifiedUserId;

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
      throw _failure(error);
    }
  }

  @override
  Future<SubscriptionOffer> loadMonthlyOffer() async {
    await initialize(userId: _identifiedUserId);
    if (!_initialized) {
      throw const SubscriptionFailure(
        'Las suscripciones todavia no estan configuradas.',
      );
    }
    try {
      final offerings = await Purchases.getOfferings();
      final offering = offerings.current;
      final monthly =
          offering?.monthly ??
          offering?.availablePackages.cast<Package?>().firstWhere(
            (item) =>
                item?.storeProduct.identifier ==
                AppEnvironment.revenueCatMonthlyProductId,
            orElse: () => null,
          );
      if (monthly == null) {
        throw const SubscriptionFailure(
          'El plan mensual no esta disponible en esta tienda.',
        );
      }
      _monthlyPackage = monthly;
      return SubscriptionOffer(
        productId: monthly.storeProduct.identifier,
        priceLabel: monthly.storeProduct.priceString,
        period: monthly.storeProduct.subscriptionPeriod ?? 'P1M',
      );
    } on PlatformException catch (error) {
      throw _failure(error);
    }
  }

  @override
  Future<SubscriptionAccess> purchaseMonthly() async {
    try {
      if (_monthlyPackage == null) await loadMonthlyOffer();
      final result = await Purchases.purchase(
        PurchaseParams.package(_monthlyPackage!),
      );
      return _map(result.customerInfo);
    } on PlatformException catch (error) {
      throw _failure(error);
    }
  }

  @override
  Future<SubscriptionAccess> restore() async {
    try {
      return _map(await Purchases.restorePurchases());
    } on PlatformException catch (error) {
      throw _failure(error);
    }
  }

  @override
  Future<SubscriptionAccess> refresh() async {
    if (!_initialized) return _current;
    try {
      return _map(await Purchases.getCustomerInfo());
    } on PlatformException catch (error) {
      throw _failure(error);
    }
  }

  void _handleCustomerInfo(CustomerInfo info) => _map(info);

  SubscriptionAccess _map(CustomerInfo info) {
    final entitlement =
        info.entitlements.all[AppEnvironment.revenueCatEntitlementId];
    final access = SubscriptionAccess(
      isResolved: true,
      serviceAvailable: true,
      isActive: entitlement?.isActive ?? false,
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
    if (!_updates.isClosed) _updates.add(access);
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
    if (_initialized) {
      Purchases.removeCustomerInfoUpdateListener(_customerInfoListener);
    }
    _updates.close();
  }
}

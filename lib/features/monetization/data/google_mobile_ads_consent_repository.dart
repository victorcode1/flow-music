import 'dart:async';

import 'package:flow_music/core/config/app_environment.dart';
import 'package:flow_music/features/monetization/domain/repositories/ad_consent_repository.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class GoogleMobileAdsConsentRepository implements AdConsentRepository {
  bool _initialized = false;
  Future<bool>? _preparation;

  @override
  bool get isAvailable =>
      AppEnvironment.supportsNativeMonetization &&
      AppEnvironment.admobBannerId.trim().isNotEmpty;

  @override
  Future<bool> prepareAds() {
    if (!isAvailable) return Future.value(false);
    return _preparation ??= _requestConsentAndInitialize();
  }

  Future<bool> _requestConsentAndInitialize() async {
    final completer = Completer<bool>();
    ConsentInformation.instance.requestConsentInfoUpdate(
      ConsentRequestParameters(),
      () async {
        await ConsentForm.loadAndShowConsentFormIfRequired((_) {});
        await _finishPreparation(completer);
      },
      (_) async {
        // El consentimiento en cache puede seguir permitiendo anuncios aun si
        // la actualizacion de red falla.
        await _finishPreparation(completer);
      },
    );
    return completer.future;
  }

  Future<void> _finishPreparation(Completer<bool> completer) async {
    if (completer.isCompleted) return;
    final canRequestAds = await ConsentInformation.instance.canRequestAds();
    if (canRequestAds && !_initialized) {
      await MobileAds.instance.initialize();
      _initialized = true;
    }
    completer.complete(canRequestAds);
  }

  @override
  Future<bool> isPrivacyOptionsRequired() async {
    if (!isAvailable) return false;
    return await ConsentInformation.instance
            .getPrivacyOptionsRequirementStatus() ==
        PrivacyOptionsRequirementStatus.required;
  }

  @override
  Future<void> showPrivacyOptions() {
    return ConsentForm.showPrivacyOptionsForm((error) {
      if (error != null) throw StateError(error.message);
    });
  }
}

class UnavailableAdConsentRepository implements AdConsentRepository {
  const UnavailableAdConsentRepository();

  @override
  bool get isAvailable => false;

  @override
  Future<bool> isPrivacyOptionsRequired() async => false;

  @override
  Future<bool> prepareAds() async => false;

  @override
  Future<void> showPrivacyOptions() async {}
}

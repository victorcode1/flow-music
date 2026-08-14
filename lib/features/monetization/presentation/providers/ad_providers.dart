import 'package:flow_music/features/monetization/data/google_mobile_ads_consent_repository.dart';
import 'package:flow_music/features/monetization/domain/repositories/ad_consent_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final adConsentRepositoryProvider = Provider<AdConsentRepository>((ref) {
  final repository = GoogleMobileAdsConsentRepository();
  return repository.isAvailable
      ? repository
      : const UnavailableAdConsentRepository();
});

final canRequestAdsProvider = FutureProvider<bool>((ref) {
  return ref.watch(adConsentRepositoryProvider).prepareAds();
});

final privacyOptionsRequiredProvider = FutureProvider<bool>((ref) async {
  final repository = ref.watch(adConsentRepositoryProvider);
  await repository.prepareAds();
  return repository.isPrivacyOptionsRequired();
});

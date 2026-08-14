abstract interface class AdConsentRepository {
  bool get isAvailable;

  Future<bool> prepareAds();

  Future<bool> isPrivacyOptionsRequired();

  Future<void> showPrivacyOptions();
}

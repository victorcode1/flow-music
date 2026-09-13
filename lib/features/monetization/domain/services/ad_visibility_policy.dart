import 'package:flow_music/features/monetization/domain/entities/subscription_access.dart';

class AdVisibilityPolicy {
  const AdVisibilityPolicy._();

  /// Solo muestra publicidad cuando sabemos con certeza que el usuario no es
  /// premium. La reproduccion no cambia el derecho a mostrar el banner.
  static bool shouldShow({
    required SubscriptionAccess access,
    required bool adsSupported,
  }) {
    return adsSupported &&
        access.isResolved &&
        access.serviceAvailable &&
        !access.isActive;
  }
}

import 'package:flow_music/features/monetization/domain/entities/subscription_access.dart';

class AdVisibilityPolicy {
  const AdVisibilityPolicy._();

  /// Solo muestra publicidad cuando sabemos con certeza que el usuario no es
  /// premium. Tambien la oculta mientras hay una emisora activa para no apilar
  /// anuncio, controles del reproductor y navegacion.
  static bool shouldShow({
    required SubscriptionAccess access,
    required bool audioSessionActive,
    required bool adsSupported,
  }) {
    return adsSupported &&
        access.isResolved &&
        access.serviceAvailable &&
        !access.isActive &&
        !audioSessionActive;
  }
}

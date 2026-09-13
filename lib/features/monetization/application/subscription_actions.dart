import 'package:flow_music/features/account/domain/repositories/auth_repository.dart';
import 'package:flow_music/features/monetization/domain/entities/subscription_access.dart';
import 'package:flow_music/features/monetization/domain/repositories/subscription_repository.dart';

class SubscriptionActions {
  const SubscriptionActions(this._auth, this._subscriptions);

  final AuthRepository _auth;
  final SubscriptionRepository _subscriptions;

  Future<SubscriptionAccess> purchase(PremiumOfferKind kind) async {
    final user = _auth.currentUser;
    if (user == null) {
      throw const SubscriptionFailure(
        'Inicia sesion antes de comprar para conservar tu acceso.',
      );
    }
    await _subscriptions.identify(user.id);
    return _subscriptions.purchase(kind);
  }

  Future<SubscriptionAccess> restore() async {
    final user = _auth.currentUser;
    if (user == null) {
      throw const SubscriptionFailure(
        'Inicia sesion antes de restaurar tu suscripcion.',
      );
    }
    await _subscriptions.identify(user.id);
    return _subscriptions.restore();
  }
}

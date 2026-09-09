import 'package:flow_music/features/account/domain/repositories/auth_repository.dart';

/// Local cooldown avoids accidental repeated requests; server limits remain the
/// authority. This is not a substitute for CAPTCHA or server-side protection.
class AuthAttemptGuard {
  AuthAttemptGuard({DateTime Function()? now}) : _now = now ?? DateTime.now;
  final DateTime Function() _now;
  final Map<String, List<DateTime>> _attempts = {};
  void check(String operation) {
    final current = _now();
    final window = operation == 'password_reset' || operation == 'sign_up'
        ? const Duration(minutes: 10)
        : const Duration(minutes: 1);
    final maximum = operation == 'password_reset' || operation == 'sign_up'
        ? 3
        : 5;
    final attempts = _attempts.putIfAbsent(operation, () => []);
    attempts.removeWhere((at) => !at.isAfter(current.subtract(window)));
    if (attempts.length >= maximum) {
      throw const AuthFailure(
        'auth_local_rate_limit',
        code: 'local_rate_limit',
      );
    }
    attempts.add(current);
  }
}

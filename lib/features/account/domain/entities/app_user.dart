class AppUser {
  const AppUser({
    required this.id,
    required this.email,
    this.displayName,
    this.emailConfirmed = false,
  });

  final String id;
  final String email;
  final String? displayName;
  final bool emailConfirmed;
}

class SignUpResult {
  const SignUpResult({required this.user, required this.requiresConfirmation});

  final AppUser user;
  final bool requiresConfirmation;
}

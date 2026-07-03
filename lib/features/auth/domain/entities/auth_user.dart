/// Usuario autenticado expuesto al dominio. Es la proyeccion minima del
/// usuario de Firebase que la UI y la sincronizacion necesitan: identidad,
/// nombre legible y avatar.
class AuthUser {
  const AuthUser({
    required this.id,
    this.email,
    this.displayName,
    this.photoUrl,
    this.isAnonymous = false,
    this.claims = const <String, Object?>{},
  });

  final String id;
  final String? email;
  final String? displayName;
  final String? photoUrl;
  final bool isAnonymous;
  final Map<String, Object?> claims;

  bool get isAdmin => claims['admin'] == true;

  bool get canAccessLocationDashboard {
    return isAdmin || claims['locationAdmin'] == true;
  }
}

import 'package:flow_music/features/auth/data/remote/authenticated_function_client.dart';
import 'package:flow_music/features/settings/data/user_settings.dart';

/// Acceso de bajo nivel al documento de ajustes remotos del usuario.
///
/// Estructura: users/{uid}/profile/settings -> UserSettings.toJson()
class SettingsRemoteDataSource {
  SettingsRemoteDataSource(this._client);

  final AuthenticatedFunctionClient _client;

  Future<UserSettings?> read(String uid) async {
    final json = await _client.post('userDataRead', {'resource': 'settings'});
    final data = json['settings'];
    if (data is! Map) return null;
    return UserSettings.fromJson(Map<String, dynamic>.from(data));
  }

  Future<void> write(String uid, UserSettings settings) async {
    await _client.post('userDataUpsert', {
      'resource': 'settings',
      'id': 'settings',
      'data': settings.toJson(),
    });
  }
}

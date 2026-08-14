import 'package:flow_music/core/config/app_environment.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BackendBootstrapResult {
  const BackendBootstrapResult({this.supabaseClient});

  final SupabaseClient? supabaseClient;
}

/// Inicializa proveedores externos sin exponerlos al dominio de la app.
class BackendBootstrap {
  const BackendBootstrap._();

  static Future<BackendBootstrapResult> initialize() async {
    if (!AppEnvironment.hasSupabaseConfiguration) {
      return const BackendBootstrapResult();
    }

    await Supabase.initialize(
      url: AppEnvironment.supabaseUrl,
      publishableKey: AppEnvironment.supabasePublishableKey,
      debug: false,
    );
    return BackendBootstrapResult(supabaseClient: Supabase.instance.client);
  }
}

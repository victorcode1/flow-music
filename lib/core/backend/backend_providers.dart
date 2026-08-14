import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Punto unico de inyeccion del backend. En pruebas o builds sin configurar es
/// `null`, por lo que la app conserva toda su funcionalidad gratuita local.
final supabaseClientProvider = Provider<SupabaseClient?>((ref) => null);

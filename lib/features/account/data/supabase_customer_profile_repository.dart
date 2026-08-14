import 'package:flow_music/features/account/domain/entities/app_user.dart';
import 'package:flow_music/features/account/domain/repositories/customer_profile_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseCustomerProfileRepository implements CustomerProfileRepository {
  const SupabaseCustomerProfileRepository(this._client);

  final SupabaseClient _client;

  @override
  Future<void> sync(AppUser user) {
    return _client.from('profiles').upsert({
      'id': user.id,
      'email': user.email,
      'display_name': user.displayName,
      'last_seen_at': DateTime.now().toUtc().toIso8601String(),
    });
  }
}

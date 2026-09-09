import 'package:flow_music/features/account/domain/entities/cloud_sync_access.dart';
import 'package:flow_music/features/account/domain/repositories/cloud_sync_access_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseCloudSyncAccessRepository implements CloudSyncAccessRepository {
  const SupabaseCloudSyncAccessRepository(this._client);
  final SupabaseClient _client;

  @override
  Future<CloudSyncAccess> verify() async {
    final response = await _client.functions.invoke('cloud-sync-access');
    final data = response.data;
    if (response.status != 200 || data is! Map) {
      throw StateError('Cloud subscription verification unavailable');
    }
    return CloudSyncAccess(
      allowed: data['allowed'] == true,
      accessUntil: DateTime.tryParse(data['access_until'] as String? ?? ''),
    );
  }
}

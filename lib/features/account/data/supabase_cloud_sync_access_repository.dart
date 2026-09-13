import 'package:flow_music/features/account/domain/entities/cloud_sync_access.dart';
import 'package:flow_music/features/account/domain/entities/cloud_library_status.dart';
import 'package:flow_music/features/account/domain/repositories/cloud_sync_access_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseCloudSyncAccessRepository implements CloudSyncAccessRepository {
  const SupabaseCloudSyncAccessRepository(this._client);
  final SupabaseClient _client;

  @override
  Future<CloudSyncAccess> verify() async {
    late FunctionResponse response;
    try {
      response = await _client.functions.invoke('cloud-sync-access');
    } on FunctionException catch (error) {
      if (error.status == 429) throw const CloudLibraryFailure('rate_limited');
      rethrow;
    }
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

import 'package:flow_music/features/account/domain/entities/cloud_library_status.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CloudLibraryApi {
  const CloudLibraryApi(this.client, {this.expectedUserId});
  final SupabaseClient client;
  final String? expectedUserId;

  Future<Map<String, dynamic>> call(
    String action, [
    Map<String, dynamic> payload = const {},
  ]) async {
    final session = client.auth.currentSession;
    if (session == null ||
        (expectedUserId != null && session.user.id != expectedUserId)) {
      throw const CloudLibraryFailure('account_switch_pending');
    }
    // Pin this request to the captured account even if another device/user
    // signs in while the asynchronous HTTP client prepares the request.
    final result = await client
        .rpc(
          'cloud_library',
          params: {'p_action': action, 'p_payload': payload},
        )
        .setHeader('Authorization', 'Bearer ${session.accessToken}');
    if (result is! Map) throw const CloudLibraryFailure('unavailable');
    final data = Map<String, dynamic>.from(result);
    if (data['error'] is String) {
      throw CloudLibraryFailure(data['error'] as String);
    }
    return data;
  }
}

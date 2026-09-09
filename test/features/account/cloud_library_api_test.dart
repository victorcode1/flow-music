import 'dart:convert';
import 'package:flow_music/features/account/data/cloud_library_api.dart';
import 'package:flow_music/features/account/domain/entities/cloud_library_status.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

String token(String id) {
  String part(Object value) =>
      base64Url.encode(utf8.encode(jsonEncode(value))).replaceAll('=', '');
  return '${part({'alg': 'HS256', 'typ': 'JWT'})}.${part({'sub': id, 'exp': 4102444800})}.signature';
}

Future<void> identify(SupabaseClient client, String id) => client.auth
    .recoverSession(
      jsonEncode({
        'access_token': token(id),
        'token_type': 'bearer',
        'refresh_token': 'fixture-refresh',
        'expires_in': 3600,
        'expires_at': 4102444800,
        'user': {
          'id': id,
          'app_metadata': {},
          'user_metadata': {},
          'aud': 'authenticated',
          'created_at': '2026-09-09T00:00:00Z',
        },
      }),
    )
    .then((_) {});

void main() {
  late SupabaseClient client;
  late List<http.Request> sent;
  setUp(() {
    sent = [];
    client = SupabaseClient(
      'https://test.supabase.co',
      'public-test-key',
      authOptions: const AuthClientOptions(autoRefreshToken: false),
      httpClient: MockClient((request) async {
        sent.add(request);
        return http.Response(
          '{"has_backup":false,"snapshot":null}',
          200,
          headers: {'content-type': 'application/json'},
          request: request,
        );
      }),
    );
  });
  tearDown(() => client.dispose());

  test(
    'cloud requests capture account authorization across a session switch',
    () async {
      await identify(client, 'account-a');
      final pending = CloudLibraryApi(
        client,
        expectedUserId: 'account-a',
      ).call('write', {'favorites': []});
      await identify(client, 'account-b');
      await pending;
      expect(
        sent.single.headers['authorization'],
        'Bearer ${token('account-a')}',
      );
      expect(jsonDecode(sent.single.body), {
        'p_action': 'write',
        'p_payload': {'favorites': []},
      });
    },
  );
  test(
    'old coordinator cannot send a library with a new account session',
    () async {
      await identify(client, 'account-b');
      await expectLater(
        CloudLibraryApi(
          client,
          expectedUserId: 'account-a',
        ).call('write', {'favorites': []}),
        throwsA(isA<CloudLibraryFailure>()),
      );
      expect(sent, isEmpty);
    },
  );
  test('guest cannot call cloud RPC', () async {
    await expectLater(
      CloudLibraryApi(client).call('read'),
      throwsA(isA<CloudLibraryFailure>()),
    );
    expect(sent, isEmpty);
  });
}

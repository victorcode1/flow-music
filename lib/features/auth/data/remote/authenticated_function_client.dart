import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../domain/repositories/auth_repository.dart';
import '../local/auth_token_store.dart';
import 'auth_api_client.dart';

class AuthenticatedFunctionClient {
  const AuthenticatedFunctionClient({
    required AuthTokenStore tokenStore,
    required AuthApiClient apiClient,
    this.baseUrl = const String.fromEnvironment(
      'FLOW_AUTH_API_BASE_URL',
      defaultValue: defaultFlowAuthApiBaseUrl,
    ),
  }) : _tokenStore = tokenStore,
       _apiClient = apiClient;

  final AuthTokenStore _tokenStore;
  final AuthApiClient _apiClient;
  final String baseUrl;

  Future<Map<String, dynamic>> post(
    String functionName,
    Map<String, Object?> body,
  ) async {
    final route = _routeFor(functionName);
    final token = await _readIdToken();
    final response = await http.post(
      _uri(route.functionName),
      headers: {'content-type': 'application/json', 'x-flow-auth-token': token},
      body: jsonEncode({'action': route.action, ...body}),
    );
    return _decodeResponse(response);
  }

  Stream<Map<String, dynamic>> sse(
    String functionName,
    Map<String, Object?> query,
  ) async* {
    final route = _routeFor(functionName);
    var retryDelay = const Duration(seconds: 2);

    while (true) {
      final client = http.Client();
      try {
        final token = await _readIdToken();
        final request =
            http.Request(
                'GET',
                _uri(route.functionName).replace(
                  queryParameters: {
                    'action': route.action,
                    ..._queryParameters(query),
                  },
                ),
              )
              ..headers['accept'] = 'text/event-stream'
              ..headers['cache-control'] = 'no-cache'
              ..headers['x-flow-auth-token'] = token;

        final response = await client.send(request);
        if (response.statusCode < 200 || response.statusCode >= 300) {
          final body = await response.stream.bytesToString();
          throw _decodeStreamError(response.statusCode, body);
        }

        retryDelay = const Duration(seconds: 2);
        yield* _decodeSseStream(response.stream);
      } on AuthException {
        rethrow;
      } catch (_) {
        // SSE can be closed by the network or platform timeout. Reconnect
        // while the caller keeps listening to the stream.
      } finally {
        client.close();
      }

      await Future<void>.delayed(retryDelay);
      retryDelay = retryDelay * 2;
      if (retryDelay > const Duration(seconds: 30)) {
        retryDelay = const Duration(seconds: 30);
      }
    }
  }

  Future<String> _readIdToken() async {
    final tokens = await _tokenStore.read();
    var idToken = tokens?.idToken;
    final refreshToken = tokens?.refreshToken;
    final expiresAtMs = tokens?.expiresAtMs;

    final shouldRefresh =
        refreshToken != null &&
        refreshToken.isNotEmpty &&
        (idToken == null ||
            idToken.isEmpty ||
            expiresAtMs == null ||
            DateTime.now().millisecondsSinceEpoch + 60000 >= expiresAtMs);

    if (shouldRefresh) {
      final refreshed = await _apiClient.refreshSession(refreshToken);
      await _tokenStore.write(
        AuthSessionTokens(
          idToken: refreshed.idToken,
          refreshToken: refreshed.refreshToken,
          expiresAtMs: refreshed.expiresAtMs,
        ),
      );
      idToken = refreshed.idToken;
    }

    if (idToken == null || idToken.isEmpty) {
      throw const AuthException(
        'unauthenticated',
        'Debes iniciar sesion para sincronizar datos.',
      );
    }
    return idToken;
  }

  Map<String, dynamic> _decodeResponse(http.Response response) {
    final decoded = _tryDecodeJson(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      if (decoded is Map<String, dynamic>) return decoded;
      throw const AuthException('invalid-response', 'Respuesta invalida.');
    }

    final error = decoded is Map<String, dynamic> ? decoded : null;
    throw AuthException(
      error?['code'] as String? ?? _errorCodeForStatus(response.statusCode),
      error?['message'] as String? ??
          _plainErrorMessage(
            response.body,
            fallback: 'No pudimos sincronizar los datos.',
          ),
    );
  }

  Uri _uri(String functionName) {
    final normalized = baseUrl.endsWith('/')
        ? baseUrl.substring(0, baseUrl.length - 1)
        : baseUrl;
    return Uri.parse('$normalized/$functionName');
  }
}

Map<String, String> _queryParameters(Map<String, Object?> query) {
  return query.map((key, value) => MapEntry(key, value?.toString() ?? ''));
}

Object _decodeStreamError(int statusCode, String body) {
  final decoded = _tryDecodeJson(body);
  final error = decoded is Map<String, dynamic> ? decoded : null;
  final code = error?['code'] as String? ?? _errorCodeForStatus(statusCode);
  final message =
      error?['message'] as String? ??
      _plainErrorMessage(body, fallback: 'No pudimos abrir el stream.');
  if (statusCode == 401 || statusCode == 403) {
    return AuthException(code, message);
  }
  return _FunctionStreamException(code, message);
}

Object? _tryDecodeJson(String body) {
  if (body.isEmpty) return null;
  try {
    return jsonDecode(body);
  } on FormatException {
    return null;
  }
}

String _errorCodeForStatus(int statusCode) {
  return switch (statusCode) {
    429 => 'rate-exceeded',
    500 || 502 || 503 || 504 => 'service-unavailable',
    _ => 'request-failed',
  };
}

String _plainErrorMessage(String body, {required String fallback}) {
  final text = body.trim();
  if (text.isEmpty) return fallback;
  return text.length <= 180 ? text : text.substring(0, 180);
}

class _FunctionStreamException implements Exception {
  const _FunctionStreamException(this.code, this.message);

  final String code;
  final String message;

  @override
  String toString() => 'FunctionStreamException($code): $message';
}

Stream<Map<String, dynamic>> _decodeSseStream(
  Stream<List<int>> byteStream,
) async* {
  final lines = byteStream
      .transform(utf8.decoder)
      .transform(const LineSplitter());
  final dataLines = <String>[];

  await for (final line in lines) {
    if (line.isEmpty) {
      if (dataLines.isEmpty) continue;
      final decoded = jsonDecode(dataLines.join('\n'));
      dataLines.clear();
      if (decoded is Map<String, dynamic>) yield decoded;
      continue;
    }

    if (line.startsWith(':')) continue;
    if (line.startsWith('data:')) {
      dataLines.add(line.substring(5).trimLeft());
    }
  }
}

_FunctionRoute _routeFor(String functionName) {
  if (functionName.startsWith('userData')) {
    return _FunctionRoute(
      'userDataApi',
      _stripPrefix(functionName, 'userData'),
    );
  }
  if (functionName.startsWith('userPresence')) {
    return _FunctionRoute(
      'userPresenceApi',
      _stripPrefix(functionName, 'userPresence'),
    );
  }
  if (functionName.startsWith('userLocation')) {
    return _FunctionRoute(
      'locationApi',
      _stripPrefix(functionName, 'userLocation'),
    );
  }
  if (functionName.startsWith('location')) {
    return _FunctionRoute(
      'locationApi',
      _stripPrefix(functionName, 'location'),
    );
  }
  return _FunctionRoute(functionName, functionName);
}

String _stripPrefix(String value, String prefix) {
  final raw = value.substring(prefix.length);
  if (raw.isEmpty) return value;
  return raw[0].toLowerCase() + raw.substring(1);
}

class _FunctionRoute {
  const _FunctionRoute(this.functionName, this.action);

  final String functionName;
  final String action;
}

import 'dart:convert';

import 'package:flow_music/features/radio/data/models/radio_station.dart';
import 'package:flow_music/features/radio/data/models/radio_tag.dart';
import 'package:http/http.dart' as http;

class RadioBrowserRepository {
  RadioBrowserRepository({http.Client? client})
    : _client = client ?? http.Client();

  static const _serverDiscoveryUrl =
      'https://all.api.radio-browser.info/json/servers';
  static const _fallbackBaseUrl = 'https://de1.api.radio-browser.info';

  final http.Client _client;
  String? _baseUrl;

  Future<List<RadioStation>> topStations({int limit = 30}) async {
    final uri = await _uri('/json/stations/topclick/$limit', {
      'hidebroken': 'true',
      'order': 'clickcount',
      'reverse': 'true',
    });
    return _getStations(uri);
  }

  Future<List<RadioStation>> searchStations({
    String name = '',
    String tag = '',
    String countryCode = '',
    int limit = 30,
  }) async {
    final uri = await _uri('/json/stations/search', {
      if (name.trim().isNotEmpty) 'name': name.trim(),
      if (tag.trim().isNotEmpty) 'tag': tag.trim(),
      if (countryCode.trim().isNotEmpty)
        'countrycode': countryCode.trim().toUpperCase(),
      'hidebroken': 'true',
      'order': 'clickcount',
      'reverse': 'true',
      'limit': '$limit',
    });
    return _getStations(uri);
  }

  Future<List<RadioTag>> topTags({int limit = 16}) async {
    final uri = await _uri('/json/tags', {
      'order': 'stationcount',
      'reverse': 'true',
      'limit': '$limit',
    });
    final data = await _getList(uri);
    return data
        .map(RadioTag.fromJson)
        .where((tag) => tag.name.isNotEmpty)
        .toList();
  }

  Future<String> countClickAndResolveUrl(RadioStation station) async {
    if (station.stationUuid.isEmpty) return station.streamUrl;

    final uri = await _uri('/json/url/${station.stationUuid}');
    try {
      final response = await _client.get(uri, headers: _headers);
      if (response.statusCode < 200 || response.statusCode >= 300) {
        return station.streamUrl;
      }

      final data = jsonDecode(response.body);
      if (data is Map<String, dynamic>) {
        final resolvedUrl = data['url'] as String? ?? '';
        return resolvedUrl.isNotEmpty ? resolvedUrl : station.streamUrl;
      }
    } catch (_) {
      return station.streamUrl;
    }

    return station.streamUrl;
  }

  Future<String?> resolveArtworkUrl(RadioStation station) async {
    final artworkUrl = station.artworkUrl;
    if (artworkUrl.isEmpty) return null;

    try {
      final response = await _client.head(
        Uri.parse(artworkUrl),
        headers: _headers,
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return artworkUrl;
      }

      if (response.statusCode == 403 || response.statusCode == 405) {
        return artworkUrl;
      }
    } catch (_) {
      return null;
    }

    return null;
  }

  Future<List<RadioStation>> _getStations(Uri uri) async {
    final data = await _getList(uri);
    return data
        .map(RadioStation.fromJson)
        .where((station) => station.isPlayable)
        .toList();
  }

  Future<List<Map<String, dynamic>>> _getList(Uri uri) async {
    final response = await _client.get(uri, headers: _headers);
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw RadioBrowserException(
        'Radio Browser request failed with ${response.statusCode}',
      );
    }

    final data = jsonDecode(response.body);
    if (data is! List) {
      throw const RadioBrowserException('Radio Browser returned invalid data');
    }

    return data.whereType<Map<String, dynamic>>().toList();
  }

  Future<Uri> _uri(String path, [Map<String, String>? queryParameters]) async {
    final baseUrl = await _resolveBaseUrl();
    return Uri.parse('$baseUrl$path').replace(queryParameters: queryParameters);
  }

  Future<String> _resolveBaseUrl() async {
    final cached = _baseUrl;
    if (cached != null) return cached;

    try {
      final response = await _client.get(
        Uri.parse(_serverDiscoveryUrl),
        headers: _headers,
      );
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final data = jsonDecode(response.body);
        if (data is List && data.isNotEmpty) {
          for (final item in data) {
            if (item is! Map<String, dynamic>) continue;
            final host = item['name'] as String?;
            if (host != null && host.isNotEmpty) {
              _baseUrl = 'https://$host';
              return _baseUrl!;
            }
          }
        }
      }
    } catch (_) {
      // Fall back to a known public mirror.
    }

    _baseUrl = _fallbackBaseUrl;
    return _baseUrl!;
  }

  Map<String, String> get _headers => const {
    'Accept': 'application/json',
    'User-Agent': 'StreamBeat/0.1.0 (flow-music)',
  };
}

class RadioBrowserException implements Exception {
  const RadioBrowserException(this.message);

  final String message;

  @override
  String toString() => message;
}

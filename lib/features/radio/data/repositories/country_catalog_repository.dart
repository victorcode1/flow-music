import 'dart:convert';
import 'dart:math' as math;

import 'package:flow_music/features/radio/data/models/radio_country.dart';
import 'package:http/http.dart' as http;

class CountryCatalogRepository {
  CountryCatalogRepository({http.Client? client})
    : _client = client ?? http.Client();

  static final Uri _restCountriesUri = Uri.parse(
    'https://restcountries.com/v3.1/all',
  ).replace(queryParameters: {'fields': 'cca2,name,translations,latlng,area'});

  final http.Client _client;

  Future<List<RadioCountry>> countries() async {
    try {
      final response = await _client.get(
        _restCountriesUri,
        headers: const {'Accept': 'application/json'},
      );
      if (response.statusCode < 200 || response.statusCode >= 300) {
        return radioCountries;
      }

      final data = jsonDecode(response.body);
      if (data is! List) return radioCountries;

      final localByCode = {
        for (final country in radioCountries) country.code: country,
      };
      final countries = <RadioCountry>[];

      for (final item in data.whereType<Map<String, dynamic>>()) {
        final country = _countryFromJson(item, localByCode);
        if (country != null) countries.add(country);
      }

      if (countries.isEmpty) return radioCountries;
      countries.sort((a, b) => a.name.compareTo(b.name));
      return countries;
    } catch (_) {
      return radioCountries;
    }
  }

  RadioCountry? _countryFromJson(
    Map<String, dynamic> json,
    Map<String, RadioCountry> localByCode,
  ) {
    final code = (json['cca2'] as String? ?? '').trim().toUpperCase();
    if (code.length != 2) return null;

    final latlng = json['latlng'];
    if (latlng is! List || latlng.length < 2) return null;

    final latitude = _asDouble(latlng[0]);
    final longitude = _asDouble(latlng[1]);
    if (latitude == null || longitude == null) return null;

    final fallbackName = _nestedString(json, const ['name', 'common']);
    final spanishName =
        _nestedString(json, const ['translations', 'spa', 'common']) ??
        fallbackName;
    final name = spanishName?.trim();
    if (name == null || name.isEmpty) return null;

    final localCountry = localByCode[code];
    if (localCountry != null) {
      return localCountry.copyWith(name: name);
    }

    final area = _asDouble(json['area']) ?? 60000;
    final radius = (math.sqrt(area) / 111 * 1.25).clamp(0.8, 18.0);
    final longitudeRadius =
        radius /
        math.cos(latitude.abs().clamp(0, 80) * math.pi / 180).clamp(0.25, 1.0);

    return RadioCountry(
      code: code,
      name: name,
      latitude: latitude,
      longitude: longitude,
      south: (latitude - radius).clamp(-90.0, 90.0),
      west: (longitude - longitudeRadius).clamp(-180.0, 180.0),
      north: (latitude + radius).clamp(-90.0, 90.0),
      east: (longitude + longitudeRadius).clamp(-180.0, 180.0),
    );
  }

  static double? _asDouble(Object? value) {
    if (value is num) return value.toDouble();
    if (value is String) return double.tryParse(value);
    return null;
  }

  static String? _nestedString(Map<String, dynamic> json, List<String> path) {
    Object? value = json;
    for (final key in path) {
      if (value is! Map<String, dynamic>) return null;
      value = value[key];
    }
    return value is String ? value : null;
  }
}

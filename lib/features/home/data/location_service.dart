import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:geolocator/geolocator.dart';

/// Resultado de [LocationService.resolveCountry].
///
/// `countryCode` es el ISO 3166-1 alpha-2 en mayusculas (por ejemplo 'CO',
/// 'US', 'ES'), o `null` si no se pudo determinar (permiso denegado, GPS
/// apagado, sin red para reverse geocoding o error inesperado).
class ResolvedCountry {
  const ResolvedCountry({this.countryCode, this.countryName});

  final String? countryCode;
  final String? countryName;

  bool get isResolved => countryCode != null && countryCode!.isNotEmpty;
}

class ResolvedLocation {
  const ResolvedLocation({
    this.latitude,
    this.longitude,
    this.positionCapturedAt,
    this.isLastKnown = false,
    this.accessStatus = LocationAccessStatus.available,
    this.failureReason,
  });

  final double? latitude;
  final double? longitude;
  final DateTime? positionCapturedAt;
  final bool isLastKnown;
  final LocationAccessStatus accessStatus;
  final String? failureReason;

  bool get isResolved => latitude != null && longitude != null;

  String get trackingStatus {
    return switch (accessStatus) {
      LocationAccessStatus.available => 'unavailable',
      LocationAccessStatus.webUnsupported => 'unavailable',
      LocationAccessStatus.serviceDisabled => 'serviceDisabled',
      LocationAccessStatus.permissionDenied => 'permissionDenied',
      LocationAccessStatus.permissionDeniedForever => 'permissionDeniedForever',
      LocationAccessStatus.alwaysPermissionRequired =>
        'alwaysPermissionRequired',
    };
  }
}

enum LocationAccessStatus {
  available,
  webUnsupported,
  serviceDisabled,
  permissionDenied,
  permissionDeniedForever,
  alwaysPermissionRequired,
}

/// Servicio que encapsula el acceso a GPS y reverse-geocoding.
///
/// Es la unica entrada hacia los plugins `geolocator` y `geocoding`. Los
/// repositorios consultan este servicio para saber en que pais esta el
/// usuario; nunca tocan los plugins directamente.
class LocationService {
  const LocationService();

  Future<LocationAccessStatus> locationAccessStatus({
    bool requireAlwaysPermission = false,
  }) async {
    try {
      if (kIsWeb) {
        return LocationAccessStatus.webUnsupported;
      }

      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return LocationAccessStatus.serviceDisabled;
      }

      final permission = await Geolocator.checkPermission();
      return _statusForPermission(
        permission,
        requireAlwaysPermission: requireAlwaysPermission,
      );
    } catch (error, stackTrace) {
      debugPrint('LocationService.locationAccessStatus failed: $error');
      debugPrintStack(stackTrace: stackTrace);
      return LocationAccessStatus.permissionDenied;
    }
  }

  Future<LocationAccessStatus> requestLocationAccess({
    bool requestAlwaysPermission = false,
    bool requireAlwaysPermission = false,
  }) async {
    try {
      if (kIsWeb) {
        return LocationAccessStatus.webUnsupported;
      }

      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return LocationAccessStatus.serviceDisabled;
      }

      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (requestAlwaysPermission &&
          permission == LocationPermission.whileInUse) {
        permission = await Geolocator.requestPermission();
      }
      return _statusForPermission(
        permission,
        requireAlwaysPermission: requireAlwaysPermission,
      );
    } catch (error, stackTrace) {
      debugPrint('LocationService.requestLocationAccess failed: $error');
      debugPrintStack(stackTrace: stackTrace);
      return LocationAccessStatus.permissionDenied;
    }
  }

  Future<bool> openAppLocationSettings() {
    return Geolocator.openAppSettings();
  }

  Future<bool> openDeviceLocationSettings() {
    return Geolocator.openLocationSettings();
  }

  /// Intenta determinar el pais del usuario via GPS + reverse geocoding.
  ///
  /// Devuelve un [ResolvedCountry] vacio (sin codigo) cuando:
  /// - El servicio de ubicacion del sistema esta apagado
  /// - El permiso esta denegado (permanente o temporal)
  /// - Falla la obtencion de posicion (timeout, hardware)
  /// - Falla el reverse geocoding (sin red, sin resultados)
  ///
  /// Nunca lanza excepciones hacia arriba.
  Future<ResolvedCountry> resolveCountry({
    Duration timeLimit = const Duration(seconds: 8),
  }) async {
    try {
      final location = await resolveLocation(timeLimit: timeLimit);
      if (!location.isResolved) return const ResolvedCountry();

      final placemarks = await geocoding.placemarkFromCoordinates(
        location.latitude!,
        location.longitude!,
      );
      if (placemarks.isEmpty) return const ResolvedCountry();

      final placemark = placemarks.first;
      final code = placemark.isoCountryCode?.toUpperCase();
      final name = placemark.country;
      if (code == null || code.isEmpty) return const ResolvedCountry();

      return ResolvedCountry(countryCode: code, countryName: name);
    } catch (error, stackTrace) {
      debugPrint('LocationService.resolveCountry failed: $error');
      debugPrintStack(stackTrace: stackTrace);
      return const ResolvedCountry();
    }
  }

  Future<ResolvedLocation> resolveLocation({
    Duration timeLimit = const Duration(seconds: 8),
    bool allowLastKnownFallback = true,
    Duration maxLastKnownAge = const Duration(minutes: 30),
    bool requestPermission = true,
    bool requestAlwaysPermission = false,
    bool requireAlwaysPermission = false,
  }) async {
    try {
      final accessStatus = requestPermission
          ? await requestLocationAccess(
              requestAlwaysPermission: requestAlwaysPermission,
              requireAlwaysPermission: requireAlwaysPermission,
            )
          : await locationAccessStatus(
              requireAlwaysPermission: requireAlwaysPermission,
            );
      if (accessStatus != LocationAccessStatus.available) {
        return ResolvedLocation(
          accessStatus: accessStatus,
          failureReason: _failureReasonForAccessStatus(accessStatus),
        );
      }

      final lastKnownPosition = await Geolocator.getLastKnownPosition();
      try {
        final position = await Geolocator.getCurrentPosition(
          locationSettings: LocationSettings(
            accuracy: LocationAccuracy.low,
            timeLimit: timeLimit,
          ),
        );
        return _resolvedLocationFromPosition(position);
      } catch (error) {
        debugPrint('LocationService current position unavailable: $error');
        if (!allowLastKnownFallback) {
          return const ResolvedLocation(failureReason: 'current-unavailable');
        }
        if (!_isFreshEnough(lastKnownPosition, maxLastKnownAge)) {
          return const ResolvedLocation(failureReason: 'last-known-stale');
        }
        return _resolvedLocationFromPosition(lastKnownPosition, isLastKnown: true);
      }
    } catch (error, stackTrace) {
      debugPrint('LocationService.resolveLocation failed: $error');
      debugPrintStack(stackTrace: stackTrace);
      return const ResolvedLocation(failureReason: 'unexpected-error');
    }
  }

  ResolvedLocation _resolvedLocationFromPosition(
    Position? position, {
    bool isLastKnown = false,
  }) {
    if (position == null) return const ResolvedLocation();
    return ResolvedLocation(
      latitude: position.latitude,
      longitude: position.longitude,
      positionCapturedAt: position.timestamp,
      isLastKnown: isLastKnown,
    );
  }

  bool _isFreshEnough(Position? position, Duration maxAge) {
    if (position == null) return false;
    return DateTime.now().difference(position.timestamp) <= maxAge;
  }

  String _failureReasonForAccessStatus(LocationAccessStatus status) {
    return switch (status) {
      LocationAccessStatus.available => 'current-unavailable',
      LocationAccessStatus.webUnsupported => 'web-unsupported',
      LocationAccessStatus.serviceDisabled => 'service-disabled',
      LocationAccessStatus.permissionDenied => 'permission-denied',
      LocationAccessStatus.permissionDeniedForever =>
        'permission-denied-forever',
      LocationAccessStatus.alwaysPermissionRequired =>
        'always-permission-required',
    };
  }

  LocationAccessStatus _statusForPermission(
    LocationPermission permission, {
    bool requireAlwaysPermission = false,
  }) {
    if (requireAlwaysPermission &&
        permission == LocationPermission.whileInUse) {
      return LocationAccessStatus.alwaysPermissionRequired;
    }
    return switch (permission) {
      LocationPermission.always ||
      LocationPermission.whileInUse => LocationAccessStatus.available,
      LocationPermission.denied => LocationAccessStatus.permissionDenied,
      LocationPermission.deniedForever =>
        LocationAccessStatus.permissionDeniedForever,
      LocationPermission.unableToDetermine =>
        LocationAccessStatus.permissionDenied,
    };
  }
}

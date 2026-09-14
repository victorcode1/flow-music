import 'package:flutter/foundation.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

/// Cuanto tiempo se deja de tocar youtube.com despues de que YouTube marque la
/// IP por exceso de peticiones.
///
/// El prefetch resuelve y baja varias pistas por delante de la que suena, y con
/// eso YouTube llega a marcar la IP. Cuando pasa, seguir insistiendo solo
/// alarga el castigo: durante este rato todo va por Piped, que sirve los mismos
/// streams sin pasar por youtube.com.
const Duration youtubeRateLimitCooldown = Duration(minutes: 10);

DateTime? _rateLimitedUntil;

/// True mientras YouTube este limitando esta IP.
bool get isYoutubeRateLimited {
  final until = _rateLimitedUntil;
  if (until == null) return false;
  if (DateTime.now().isBefore(until)) return true;
  _rateLimitedUntil = null;
  return false;
}

/// Anota el corte si [error] es el limite de peticiones de YouTube.
///
/// Devuelve true cuando lo era, para que el llamador sepa que no vale la pena
/// reintentar por esa via y pase directo a Piped.
bool reportYoutubeFailure(Object error) {
  if (error is! RequestLimitExceededException) return false;

  final until = DateTime.now().add(youtubeRateLimitCooldown);
  _rateLimitedUntil = until;
  debugPrint('YouTube esta limitando la IP: todo va por Piped hasta $until');
  return true;
}

@visibleForTesting
void resetYoutubeRateLimit() => _rateLimitedUntil = null;

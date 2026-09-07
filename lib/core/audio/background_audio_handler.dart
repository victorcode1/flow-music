import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

late final FlowAudioHandler flowAudioHandler;

Future<FlowAudioHandler> initFlowAudioHandler() async {
  flowAudioHandler = await AudioService.init(
    builder: FlowAudioHandler.new,
    config: const AudioServiceConfig(
      androidNotificationChannelId: 'com.victorflores.streambeat.channel.audio',
      androidNotificationChannelName: 'Reproduccion de audio',
      androidNotificationChannelDescription:
          'Controles de reproduccion de StreamBeat',
      androidNotificationOngoing: true,
      androidStopForegroundOnPause: true,
      androidNotificationClickStartsActivity: true,
      artDownscaleWidth: 1024,
      artDownscaleHeight: 1024,
      rewindInterval: Duration(seconds: 10),
      fastForwardInterval: Duration(seconds: 10),
    ),
  );

  return flowAudioHandler;
}

class FlowAudioHandler extends BaseAudioHandler with SeekHandler {
  FlowAudioHandler() {
    _subscriptions.add(
      player.onPlayerStateChanged.listen((state) {
        _playerState = state;
        _broadcastPlaybackState();
      }),
    );
    _subscriptions.add(
      player.onPositionChanged.listen((position) {
        // Si tenemos una duracion confiable (la cabecera del proveedor),
        // recortamos la posicion reportada por audioplayers para que la UI
        // nunca muestre tiempo "vacio" mas alla del final real del audio.
        _position = _hasTrustedDuration && position > _duration
            ? _duration
            : position;
        // audioplayers sigue reproduciendo (silencio o padding) varios
        // segundos despues del fin canonico, asi que `onPlayerComplete`
        // llega tarde y autoplay se queda esperando. En cuanto la posicion
        // toca la duracion reportada, disparamos el complete nosotros
        // mismos para que la siguiente cancion arranque sin retraso.
        if (!_completionFired &&
            _duration > Duration.zero &&
            position >= _duration) {
          _completionFired = true;
          unawaited(_handleCompletion());
        }
      }),
    );
    _subscriptions.add(
      // Duration and completion are projections of the same broadcast stream.
      // Each listener without onError used to leak AndroidAudioError into the
      // app's uncaught-error handler when a playing stream lost connectivity.
      player.eventStream.listen((event) {
        switch (event.eventType) {
          case AudioEventType.duration:
            if (!_hasTrustedDuration && event.duration != null) {
              _applyDuration(event.duration!);
            }
          case AudioEventType.complete:
            if (_completionFired) return;
            _completionFired = true;
            unawaited(_handleCompletion());
          default:
            break;
        }
      }, onError: _onNativePlaybackError),
    );
  }

  final AudioPlayer player = AudioPlayer();
  final List<StreamSubscription> _subscriptions = [];
  PlayerState _playerState = PlayerState.stopped;
  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;
  bool _hasTrustedDuration = false;
  bool _completionFired = false;
  bool _isPreparingSource = false;
  Object? _playbackError;
  Source? _failedSource;
  Future<void>? _errorHandling;

  static const Duration _nativeCleanupTimeout = Duration(seconds: 2);
  static const Duration _sourceStartTimeout = Duration(seconds: 20);
  static const Duration _playbackConfirmationTimeout = Duration(seconds: 8);

  /// Hook fired when the current track finishes naturally. The app wires this
  /// to the autoplay queue so the next prefetched suggestion plays.
  Future<void> Function()? onTrackComplete;
  Future<void> Function()? onSkipToNext;
  Future<void> Function()? onSkipToPrevious;

  /// Disparado cuando la fuente no se puede reproducir (p. ej. un stream de
  /// radio HTTP bloqueado en web por mixed content, o un formato que el
  /// navegador no soporta -> MEDIA_ELEMENT_ERROR Code 4). La UI lo usa para
  /// avisar al usuario en vez de dejar el reproductor colgado en "loading".
  Future<void> Function(Object error)? onPlaybackError;

  Future<void> playUrl({
    required String url,
    required String id,
    required String title,
    required String artist,
    String? artUrl,
    String? mimeType,
    Duration? canonicalDuration,
  }) async {
    _isPreparingSource = true;
    _emitLoadingState();
    try {
      await _resetForNewSource();
      if (canonicalDuration != null && canonicalDuration > Duration.zero) {
        _applyDuration(canonicalDuration, trusted: true);
      }
      _setMediaItem(id: id, title: title, artist: artist, artUrl: artUrl);
      _emitLoadingState();
      await _playRemoteSource(url: url, mimeType: mimeType);
      _isPreparingSource = false;
      _playerState = player.state;
      _broadcastPlaybackState();
    } catch (error, stack) {
      await _handlePlaybackError(error, stack);
      Error.throwWithStackTrace(error, stack);
    }
  }

  Future<void> playFile({
    required String filePath,
    required String id,
    required String title,
    required String artist,
    String? artUrl,
    Duration? canonicalDuration,
  }) async {
    _isPreparingSource = true;
    _emitLoadingState();
    try {
      await _resetForNewSource();
      if (canonicalDuration != null && canonicalDuration > Duration.zero) {
        _applyDuration(canonicalDuration, trusted: true);
      }
      _setMediaItem(id: id, title: title, artist: artist, artUrl: artUrl);
      _emitLoadingState();
      await player
          .play(DeviceFileSource(filePath))
          .timeout(_sourceStartTimeout);
      await _confirmPlaybackStarted();
      _isPreparingSource = false;
      _playerState = player.state;
      _broadcastPlaybackState();
    } catch (error, stack) {
      await _handlePlaybackError(error, stack);
      Error.throwWithStackTrace(error, stack);
    }
  }

  Future<void> _resetForNewSource() async {
    // A user can retry or choose another station before native error cleanup
    // finishes. Complete that cleanup before starting the replacement source.
    await _errorHandling;
    _playbackError = null;
    _failedSource = null;
    // audioplayers can otherwise keep the previous MediaPlayer/AVPlayer alive
    // briefly, leaving two streams overlapping (most noticeable when the new
    // source is a live radio stream that takes longer to start).
    try {
      await player.stop().timeout(_nativeCleanupTimeout);
    } catch (_) {}
    _position = Duration.zero;
    _duration = Duration.zero;
    _hasTrustedDuration = false;
    _completionFired = false;
    await player.setVolume(1);
  }

  Future<void> _playRemoteSource({
    required String url,
    String? mimeType,
  }) async {
    await player
        .play(UrlSource(url, mimeType: mimeType))
        .timeout(_sourceStartTimeout);
    await _confirmPlaybackStarted();
  }

  Future<void> _confirmPlaybackStarted() async {
    if (player.state == PlayerState.playing) return;

    final state = await player.onPlayerStateChanged
        .firstWhere(
          (state) =>
              state == PlayerState.playing ||
              state == PlayerState.stopped ||
              state == PlayerState.completed,
        )
        .timeout(_playbackConfirmationTimeout, onTimeout: () => player.state);

    if (state != PlayerState.playing) {
      throw PlaybackStartException(state);
    }
  }

  Future<void> _handleCompletion() async {
    // Detenemos audioplayers explicitamente para que no siga reproduciendo
    // padding/silencio detras del fin canonico cuando autoplay esta
    // desactivado o no hay siguiente cancion en la cola.
    await player.stop();
    _position = Duration.zero;
    playbackState.add(
      playbackState.value.copyWith(
        processingState: AudioProcessingState.completed,
        playing: false,
        updatePosition: _position,
      ),
    );
    final hook = onTrackComplete;
    if (hook != null) {
      unawaited(hook());
    }
  }

  void _onNativePlaybackError(Object error, StackTrace stack) {
    // setSource/play already receive preparation errors through their Future,
    // and the caller owns the single automatic retry for those failures.
    if (_isPreparingSource || _playbackError != null) return;
    unawaited(_handlePlaybackError(error, stack));
    if (error is! PlatformException && error is! TimeoutException) {
      FlutterError.reportError(
        FlutterErrorDetails(
          exception: error,
          stack: stack,
          library: 'StreamBeat audio',
        ),
      );
    }
  }

  Future<void> _handlePlaybackError(Object error, StackTrace stack) {
    final pending = _errorHandling;
    if (pending != null) return pending;
    _playbackError = error;
    _failedSource = player.source;
    _isPreparingSource = false;
    _playerState = PlayerState.stopped;
    _completionFired = true;
    _broadcastPlaybackState();
    final cleanup = _cleanupPlaybackError(error, stack).whenComplete(() {
      _errorHandling = null;
    });
    _errorHandling = cleanup;
    return cleanup;
  }

  Future<void> _cleanupPlaybackError(Object error, StackTrace stack) async {
    debugPrint('Audio playback error: $error');
    // Evita que onPositionChanged dispare un "completion" fantasma sobre una
    // fuente que nunca llego a sonar.
    _completionFired = true;
    try {
      await player.stop().timeout(_nativeCleanupTimeout);
      await player.setVolume(1).timeout(_nativeCleanupTimeout);
    } catch (_) {}
    final hook = onPlaybackError;
    if (hook != null) {
      // A hook may itself start a retry, which waits for this cleanup. Observe
      // hook failures without making cleanup wait for its own retry.
      unawaited(
        Future<void>.sync(() => hook(error)).catchError((
          Object hookError,
          StackTrace hookStack,
        ) {
          FlutterError.reportError(
            FlutterErrorDetails(
              exception: hookError,
              stack: hookStack,
              library: 'StreamBeat audio',
            ),
          );
        }),
      );
    }
  }

  void _applyDuration(Duration duration, {bool trusted = false}) {
    _duration = duration;
    if (trusted) _hasTrustedDuration = true;
    final current = mediaItem.value;
    if (current != null) {
      mediaItem.add(current.copyWith(duration: duration));
    }
    _broadcastPlaybackState();
  }

  @override
  Future<void> play() async {
    if (_isPreparingSource) return;
    await _errorHandling;
    if (_isPreparingSource) return;
    final failedSource = _failedSource;
    try {
      if (failedSource != null) {
        _isPreparingSource = true;
        _emitLoadingState();
        await _resetForNewSource();
        await player.play(failedSource).timeout(_sourceStartTimeout);
        await _confirmPlaybackStarted();
        _isPreparingSource = false;
        _playerState = player.state;
        _broadcastPlaybackState();
      } else {
        await player.resume();
      }
    } catch (error, stack) {
      await _handlePlaybackError(error, stack);
      // Notification and button callbacks cannot await/retry playback errors.
      // Unexpected programming failures must remain visible to monitoring.
      if (error is! PlatformException &&
          error is! TimeoutException &&
          error is! PlaybackStartException) {
        FlutterError.reportError(
          FlutterErrorDetails(
            exception: error,
            stack: stack,
            library: 'StreamBeat audio',
          ),
        );
      }
    }
  }

  @override
  Future<void> pause() => player.pause();

  @override
  Future<void> stop() async {
    await _errorHandling;
    _playbackError = null;
    _failedSource = null;
    _isPreparingSource = false;
    await player.stop();
    _position = Duration.zero;
    playbackState.add(
      playbackState.value.copyWith(
        processingState: AudioProcessingState.idle,
        playing: false,
        updatePosition: Duration.zero,
      ),
    );
    return super.stop();
  }

  @override
  Future<void> seek(Duration position) async {
    await player.seek(position);
    _position = position;
    _broadcastPlaybackState();
  }

  @override
  Future<void> fastForward() {
    return seek(
      _boundedPosition(_position + AudioService.config.fastForwardInterval),
    );
  }

  @override
  Future<void> rewind() {
    return seek(
      _boundedPosition(_position - AudioService.config.rewindInterval),
    );
  }

  @override
  Future<void> skipToNext() async {
    final hook = onSkipToNext;
    if (hook == null) return;
    await hook();
  }

  @override
  Future<void> skipToPrevious() async {
    final hook = onSkipToPrevious;
    if (hook != null) {
      await hook();
      return;
    }
    await seek(Duration.zero);
  }

  Future<void> dispose() async {
    for (final subscription in _subscriptions) {
      await subscription.cancel();
    }
    await _errorHandling;
    await player.dispose();
  }

  void _setMediaItem({
    required String id,
    required String title,
    required String artist,
    String? artUrl,
  }) {
    mediaItem.add(
      MediaItem(
        id: id,
        title: title.isEmpty ? 'StreamBeat' : title,
        artist: artist.isEmpty ? 'StreamBeat' : artist,
        artUri: artUrl == null || artUrl.isEmpty ? null : Uri.parse(artUrl),
        duration: _duration == Duration.zero ? null : _duration,
      ),
    );
  }

  /// Publishes the selected station immediately, before its final stream URL
  /// has been resolved. This lets every player surface loading feedback from
  /// the user's tap instead of waiting on the radio directory request first.
  void beginMediaPreparation({
    required String id,
    required String title,
    required String artist,
    String? artUrl,
  }) {
    _isPreparingSource = true;
    _setMediaItem(id: id, title: title, artist: artist, artUrl: artUrl);
    _emitLoadingState();
  }

  /// Keeps loading visible between a failed attempt and its automatic retry.
  void continueMediaPreparation() {
    _isPreparingSource = true;
    _emitLoadingState();
  }

  /// Completes preparation when resolving a source fails before playback.
  void failMediaPreparation(Object error) {
    _isPreparingSource = false;
    _playbackError = error;
    playbackState.add(
      playbackState.value.copyWith(
        processingState: AudioProcessingState.error,
        playing: false,
        errorMessage: error.toString(),
      ),
    );
  }

  void _emitLoadingState() {
    playbackState.add(
      playbackState.value.copyWith(
        processingState: AudioProcessingState.loading,
        playing: false,
        updatePosition: Duration.zero,
        bufferedPosition: Duration.zero,
        errorCode: null,
        errorMessage: null,
      ),
    );
  }

  Duration _boundedPosition(Duration position) {
    if (position < Duration.zero) return Duration.zero;
    if (_duration > Duration.zero && position > _duration) return _duration;
    return position;
  }

  void _broadcastPlaybackState() {
    if (_isPreparingSource) {
      _emitLoadingState();
      return;
    }

    final playing =
        _playbackError == null && _playerState == PlayerState.playing;
    final processingState = _playbackError != null
        ? AudioProcessingState.error
        : switch (_playerState) {
            PlayerState.stopped => AudioProcessingState.idle,
            PlayerState.completed => AudioProcessingState.completed,
            _ => AudioProcessingState.ready,
          };

    playbackState.add(
      playbackState.value.copyWith(
        controls: [
          MediaControl.skipToPrevious,
          if (playing) MediaControl.pause else MediaControl.play,
          MediaControl.skipToNext,
          MediaControl.stop,
        ],
        androidCompactActionIndices: const [0, 1, 2],
        systemActions: const {MediaAction.seek},
        processingState: processingState,
        playing: playing,
        errorCode: null,
        errorMessage: _playbackError?.toString(),
        updatePosition: _position,
        bufferedPosition: _position,
        speed: 1,
      ),
    );

    debugPrint('Background audio state: $_playerState');
  }
}

class PlaybackStartException implements Exception {
  const PlaybackStartException(this.state);

  final PlayerState state;

  @override
  String toString() => 'Playback did not start (state: $state)';
}

import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

late final FlowAudioHandler flowAudioHandler;

Future<FlowAudioHandler> initFlowAudioHandler() async {
  flowAudioHandler = await AudioService.init(
    builder: FlowAudioHandler.new,
    config: const AudioServiceConfig(
      androidNotificationChannelId: 'com.example.flow_music.channel.audio',
      androidNotificationChannelName: 'Reproduccion de audio',
      androidNotificationChannelDescription:
          'Controles de reproduccion de StreamBeat',
      androidNotificationOngoing: true,
      androidStopForegroundOnPause: true,
      androidNotificationClickStartsActivity: true,
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
      player.onDurationChanged.listen((duration) {
        // Cuando el caller declara una duracion confiable, ignoramos la
        // duracion reportada
        // por audioplayers porque a veces excede el audio real por unos
        // segundos. Esto evita el "tail" vacio en la barra de progreso.
        if (_hasTrustedDuration) return;
        _applyDuration(duration);
      }),
    );
    _subscriptions.add(
      player.onPlayerComplete.listen((_) {
        if (_completionFired) return;
        _completionFired = true;
        unawaited(_handleCompletion());
      }),
    );
  }

  final AudioPlayer player = AudioPlayer();
  final List<StreamSubscription> _subscriptions = [];
  PlayerState _playerState = PlayerState.stopped;
  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;
  bool _hasTrustedDuration = false;
  bool _completionFired = false;

  static const Duration _nativeCleanupTimeout = Duration(seconds: 2);

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
    await _resetForNewSource();
    if (canonicalDuration != null && canonicalDuration > Duration.zero) {
      _applyDuration(canonicalDuration, trusted: true);
    }
    _setMediaItem(id: id, title: title, artist: artist, artUrl: artUrl);
    playbackState.add(
      playbackState.value.copyWith(
        processingState: AudioProcessingState.loading,
        playing: true,
        updatePosition: Duration.zero,
        bufferedPosition: Duration.zero,
      ),
    );
    try {
      await _playRemoteSource(url: url, mimeType: mimeType);
    } catch (error, stack) {
      _handlePlaybackError(error, stack);
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
    await _resetForNewSource();
    if (canonicalDuration != null && canonicalDuration > Duration.zero) {
      _applyDuration(canonicalDuration, trusted: true);
    }
    _setMediaItem(id: id, title: title, artist: artist, artUrl: artUrl);
    playbackState.add(
      playbackState.value.copyWith(
        processingState: AudioProcessingState.loading,
        playing: true,
        updatePosition: Duration.zero,
        bufferedPosition: Duration.zero,
      ),
    );
    try {
      await player.play(DeviceFileSource(filePath));
    } catch (error, stack) {
      _handlePlaybackError(error, stack);
    }
  }

  Future<void> _resetForNewSource() async {
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
    await player.play(UrlSource(url, mimeType: mimeType));
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

  Future<void> _handlePlaybackError(Object error, StackTrace stack) async {
    debugPrint('Audio playback error: $error');
    // Evita que onPositionChanged dispare un "completion" fantasma sobre una
    // fuente que nunca llego a sonar.
    _completionFired = true;
    try {
      await player.stop();
    } catch (_) {}
    await player.setVolume(1);
    playbackState.add(
      playbackState.value.copyWith(
        processingState: AudioProcessingState.error,
        playing: false,
        errorMessage: error.toString(),
      ),
    );
    final hook = onPlaybackError;
    if (hook != null) {
      unawaited(hook(error));
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
  Future<void> play() => player.resume();

  @override
  Future<void> pause() => player.pause();

  @override
  Future<void> stop() async {
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

  Duration _boundedPosition(Duration position) {
    if (position < Duration.zero) return Duration.zero;
    if (_duration > Duration.zero && position > _duration) return _duration;
    return position;
  }

  void _broadcastPlaybackState() {
    final playing = _playerState == PlayerState.playing;
    final processingState = switch (_playerState) {
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
        updatePosition: _position,
        bufferedPosition: _position,
        speed: 1,
      ),
    );

    debugPrint('Background audio state: $_playerState');
  }
}

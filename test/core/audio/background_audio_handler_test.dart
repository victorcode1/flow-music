import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:audioplayers/audioplayers.dart' show AudioLogger, AudioLogLevel;
import 'package:audioplayers_platform_interface/audioplayers_platform_interface.dart';
import 'package:flow_music/core/audio/background_audio_handler.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  AudioLogger.logLevel = AudioLogLevel.none;
  GlobalAudioplayersPlatformInterface.instance = _GlobalPlatform();
  late _AudioPlatform platform;
  late FlowAudioHandler handler;
  final nativeError = PlatformException(
    code: 'AndroidAudioError',
    message: 'MEDIA_ERROR_UNKNOWN {what:1}',
    details: 'MEDIA_ERROR_SYSTEM',
  );

  setUp(() async {
    platform = _AudioPlatform();
    AudioplayersPlatformInterface.instance = platform;
    handler = FlowAudioHandler();
    handler.player.positionUpdater = null;
    await handler.player.creatingCompleter.future;
  });
  tearDown(() => handler.dispose());

  Future<void> start({String id = 'station'}) => handler.playUrl(
    url: 'https://example.com/$id.mp3',
    id: id,
    title: id,
    artist: 'Radio',
  );
  Future<void> settle() async {
    for (var i = 0; i < 8; i++) {
      await Future<void>.delayed(Duration.zero);
    }
  }

  test(
    'native error during playback is handled and stays visible after stop',
    () async {
      await start();
      var notifications = 0;
      var completions = 0;
      handler.onPlaybackError = (_) async {
        notifications++;
      };
      handler.onTrackComplete = () async {
        completions++;
      };
      platform.events.addError(nativeError);
      await settle();
      expect(
        handler.playbackState.value.processingState,
        AudioProcessingState.error,
      );
      expect(handler.playbackState.value.playing, isFalse);
      expect(handler.player.state, PlayerState.stopped);
      expect(notifications, 1);
      platform.events.add(const AudioEvent(eventType: AudioEventType.complete));
      platform.events.add(
        const AudioEvent(
          eventType: AudioEventType.duration,
          duration: Duration(seconds: 120),
        ),
      );
      await settle();
      expect(completions, 0);
      expect(
        handler.playbackState.value.processingState,
        AudioProcessingState.error,
      );
    },
  );

  test(
    'preparation errors propagate once to the existing automatic retry',
    () async {
      platform.sourceError = nativeError;
      var notifications = 0;
      handler.onPlaybackError = (_) async {
        notifications++;
      };
      await expectLater(start(), throwsA(same(nativeError)));
      await settle();
      expect(notifications, 1);
      expect(
        handler.playbackState.value.processingState,
        AudioProcessingState.error,
      );
      platform.sourceError = null;
      await start();
      expect(handler.playbackState.value.playing, isTrue);
    },
  );

  test(
    'repeated native error events do not trigger duplicate cleanup',
    () async {
      await start();
      var notifications = 0;
      handler.onPlaybackError = (_) async {
        notifications++;
      };
      final stops = platform.stops;
      platform.events.addError(nativeError);
      platform.events.addError(nativeError);
      await settle();
      platform.events.addError(nativeError);
      await settle();
      expect(notifications, 1);
      expect(platform.stops, stops + 1);
    },
  );

  test(
    'play reloads a failed source and clears error after recovery',
    () async {
      await start();
      platform.events.addError(nativeError);
      await settle();
      final loads = platform.sources.length;
      await handler.play();
      await settle();
      expect(platform.sources.length, loads + 1);
      expect(platform.sources.last, 'https://example.com/station.mp3');
      expect(
        handler.playbackState.value.processingState,
        AudioProcessingState.ready,
      );
      expect(handler.playbackState.value.playing, isTrue);
      expect(handler.playbackState.value.errorMessage, isNull);
    },
  );

  test(
    'failed retry from media controls is reported without escaping',
    () async {
      await start();
      platform.events.addError(nativeError);
      await settle();
      platform.sourceError = nativeError;
      await handler.play();
      await settle();
      expect(
        handler.playbackState.value.processingState,
        AudioProcessingState.error,
      );
      expect(handler.playbackState.value.playing, isFalse);
    },
  );

  test('new station waits for failed native player cleanup', () async {
    await start();
    platform.stopGate = Completer<void>();
    platform.events.addError(nativeError);
    await settle();
    final next = start(id: 'next');
    await settle();
    expect(platform.sources, ['https://example.com/station.mp3']);
    platform.stopGate!.complete();
    platform.stopGate = null;
    await next;
    await settle();
    expect(platform.sources.last, 'https://example.com/next.mp3');
    expect(handler.playbackState.value.playing, isTrue);
  });

  test('error callback can retry without waiting on its own cleanup', () async {
    await start();
    handler.onPlaybackError = (_) => handler.play();
    platform.events.addError(nativeError);
    await settle();
    expect(platform.sources.length, 2);
    expect(handler.playbackState.value.playing, isTrue);
  });

  test('two rapid retry taps load the failed source only once', () async {
    await start();
    platform.events.addError(nativeError);
    await settle();
    await Future.wait([handler.play(), handler.play()]);
    expect(platform.sources.length, 2);
    expect(handler.playbackState.value.playing, isTrue);
  });

  test(
    'unexpected native stream errors remain visible to monitoring',
    () async {
      await start();
      final previous = FlutterError.onError;
      final reports = <FlutterErrorDetails>[];
      FlutterError.onError = reports.add;
      try {
        final error = StateError('Unexpected player invariant');
        platform.events.addError(error);
        await settle();
        expect(reports.single.exception, same(error));
        expect(
          handler.playbackState.value.processingState,
          AudioProcessingState.error,
        );
      } finally {
        FlutterError.onError = previous;
      }
    },
  );

  test('normal completion still advances the queue exactly once', () async {
    await start();
    var completions = 0;
    handler.onTrackComplete = () async {
      completions++;
    };
    platform.events.add(const AudioEvent(eventType: AudioEventType.complete));
    await settle();
    expect(completions, 1);
    expect(
      handler.playbackState.value.processingState,
      AudioProcessingState.completed,
    );
  });
}

class _GlobalPlatform extends GlobalAudioplayersPlatformInterface {
  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnsupportedError('${invocation.memberName}');
  @override
  Future<void> setGlobalAudioContext(AudioContext ctx) async {}
  @override
  Future<void> init() async {}
  @override
  Stream<GlobalAudioEvent> getGlobalEventStream() => const Stream.empty();
}

class _AudioPlatform extends AudioplayersPlatformInterface {
  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnsupportedError('${invocation.memberName}');
  final events = StreamController<AudioEvent>.broadcast();
  final sources = <String>[];
  Object? sourceError;
  Completer<void>? stopGate;
  int stops = 0;
  @override
  Future<void> create(String playerId) async {}
  @override
  Stream<AudioEvent> getEventStream(String playerId) => events.stream;
  @override
  Future<void> dispose(String playerId) async => events.close();
  @override
  Future<void> setSourceUrl(
    String playerId,
    String url, {
    bool? isLocal,
    String? mimeType,
  }) async {
    sources.add(url);
    if (sourceError case final error?) {
      events.addError(error);
    } else {
      events.add(
        const AudioEvent(eventType: AudioEventType.prepared, isPrepared: true),
      );
    }
  }

  @override
  Future<void> stop(String playerId) async {
    stops++;
    await stopGate?.future;
  }

  @override
  Future<void> resume(String playerId) async {}
  @override
  Future<void> pause(String playerId) async {}
  @override
  Future<void> release(String playerId) async {}
  @override
  Future<void> setVolume(String playerId, double volume) async {}
  @override
  Future<int?> getDuration(String playerId) async => 0;
  @override
  Future<int?> getCurrentPosition(String playerId) async => 0;
}

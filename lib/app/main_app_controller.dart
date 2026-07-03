import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/audio/background_audio_handler.dart';
import 'package:flow_music/core/routes/app_navigator_key.dart';
import 'package:flow_music/core/routes/routes.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flow_music/core/utils/main_controller.dart';
import 'package:flow_music/features/auth/presentation/notifiers/auth_notifier.dart';
import 'package:flow_music/features/autoplay/data/audio_cache_stub.dart'
    if (dart.library.io) 'package:flow_music/features/autoplay/data/audio_cache_io.dart';
import 'package:flow_music/features/autoplay/presentation/controllers/autoplay_queue_controller.dart';
import 'package:flow_music/features/autoplay/presentation/controllers/cache_status_controller.dart';
import 'package:flow_music/features/home/data/location_service.dart';
import 'package:flow_music/features/location_tracking/data/user_location_providers.dart';
import 'package:flow_music/features/location_tracking/data/user_location_tracker.dart';
import 'package:flow_music/features/settings/presentation/controllers/autoplay_enabled_controller.dart';
import 'package:flow_music/features/settings/presentation/controllers/theme_mode_controller.dart';
import 'package:flow_music/features/song/presentation/controllers/repeat_mode_controller.dart';
import 'package:flow_music/features/song/presentation/controllers/song_controller.dart';
import 'package:flow_music/features/user_presence/data/user_presence_tracker.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final mainAppControllerProvider = Provider<MainAppController>(
  MainAppController.new,
);

class MainAppController {
  MainAppController(this.ref);

  final Ref ref;
  DateTime? _lastLocationPromptAt;

  /// Clave en la caja `settings` con la marca de tiempo del ultimo recordatorio
  /// de registro mostrado a un invitado.
  static const String _guestSignUpPromptKey =
      'guest_signup_prompt_last_shown_ms';

  /// Tiempo minimo entre recordatorios de registro para no resultar invasivos.
  static const Duration _guestSignUpCooldown = Duration(hours: 6);

  /// Cada cuanto reevaluamos si toca mostrar el recordatorio durante una sesion
  /// larga (ademas de al iniciar la app y al volver del segundo plano).
  static const Duration _guestSignUpCheckInterval = Duration(minutes: 20);

  Timer? _guestSignUpTimer;
  bool _guestSignUpPromptVisible = false;

  void initialize() {
    flowAudioHandler.onTrackComplete = handleTrackComplete;
    flowAudioHandler.onSkipToNext = handleSkipToNext;
    flowAudioHandler.onSkipToPrevious = handleSkipToPrevious;
    ref.read(userPresenceTrackerProvider);
    ref.read(userLocationTrackerProvider);
    unawaited(ref.read(authProvider.notifier).ensureAnonymousSession());
    _guestSignUpTimer = Timer.periodic(_guestSignUpCheckInterval, (_) {
      unawaited(_promptGuestSignUpIfNeeded());
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(_promptTrackingLocationAccessIfNeeded());
      unawaited(_promptGuestSignUpIfNeeded());
    });
  }

  void dispose() {
    _guestSignUpTimer?.cancel();
    _guestSignUpTimer = null;
    if (flowAudioHandler.onTrackComplete == handleTrackComplete) {
      flowAudioHandler.onTrackComplete = null;
    }
    if (flowAudioHandler.onSkipToNext == handleSkipToNext) {
      flowAudioHandler.onSkipToNext = null;
    }
    if (flowAudioHandler.onSkipToPrevious == handleSkipToPrevious) {
      flowAudioHandler.onSkipToPrevious = null;
    }
  }

  Future<void> handleTrackComplete() async {
    if (ref.read(repeatModeControllerProvider)) {
      final player = flowAudioHandler.player;
      await player.seek(Duration.zero);
      await player.resume();
      return;
    }

    if (!ref.read(autoplayEnabledControllerProvider)) return;
    await _playQueueTrack(
      ref.read(autoplayQueueControllerProvider.notifier).playNext(),
    );
  }

  Future<void> handleSkipToNext() async {
    await _playQueueTrack(
      ref.read(autoplayQueueControllerProvider.notifier).playNext(),
    );
  }

  Future<void> handleSkipToPrevious() async {
    final previous = ref
        .read(autoplayQueueControllerProvider.notifier)
        .playPrevious();
    if (previous == null) {
      await flowAudioHandler.seek(Duration.zero);
      return;
    }
    await _playQueueTrack(previous);
  }

  void handleAppLifecycleState(AppLifecycleState state) {
    ref.read(userPresenceTrackerProvider.notifier).handleLifecycleState(state);
    ref.read(userLocationTrackerProvider.notifier).handleLifecycleState(state);
    switch (state) {
      case AppLifecycleState.detached:
        ref.read(mainController).setAudioStateDetached();
        unawaited(clearAudioCache());
      case AppLifecycleState.resumed:
        ref.read(mainController).setAudioStateResumed();
        unawaited(_promptTrackingLocationAccessIfNeeded());
        unawaited(_promptGuestSignUpIfNeeded());
        break;
      case AppLifecycleState.inactive:
        ref.read(mainController).setAudioStateInactive();
        break;
      case AppLifecycleState.paused:
        ref.read(mainController).setAudioStatePaused();
        break;
      case AppLifecycleState.hidden:
        ref.read(mainController).setAudioStateHidden();
        break;
    }
  }

  void handleCacheStatusChanged(CacheStatus? previous, CacheStatus next) {
    if (!next.shouldShowDialog) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showDiskFullDialog();
    });
  }

  Future<void> _playQueueTrack(NextTrack? next) async {
    if (next == null) return;
    final controller = ref.read(songController);
    final resolved = next.resolved;
    if (resolved != null) {
      await controller.playPrefetched(resolved);
      return;
    }
    await controller.playAudio(id: next.suggestion.videoId);
  }

  void _showDiskFullDialog() {
    final status = ref.read(cacheStatusControllerProvider);
    if (!status.shouldShowDialog) return;

    final navigatorContext = _navigatorDialogContext;
    if (navigatorContext == null) return;

    ref.read(cacheStatusControllerProvider.notifier).acknowledge();
    showDialog<void>(
      context: navigatorContext,
      builder: (dialogContext) {
        return AlertDialog(
          icon: const Icon(Icons.sd_card_alert_rounded),
          title: Text(LocaleKeys.storage_full_title.tr()),
          content: Text(LocaleKeys.storage_full_message.tr()),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: Text(LocaleKeys.understood.tr()),
            ),
          ],
        );
      },
    );
  }

  Future<void> _promptTrackingLocationAccessIfNeeded() async {
    final user = ref.read(authProvider).asData?.value;
    if (user == null || user.isAnonymous) return;

    final lastPromptAt = _lastLocationPromptAt;
    if (lastPromptAt != null &&
        DateTime.now().difference(lastPromptAt) < const Duration(minutes: 10)) {
      return;
    }

    final locationService = ref.read(locationServiceProvider);
    final status = await locationService.locationAccessStatus(
      requireAlwaysPermission: true,
    );
    if (status == LocationAccessStatus.available ||
        status == LocationAccessStatus.webUnsupported) {
      return;
    }

    final messenger = ref.read(mainController).scaffoldMessage.currentState;
    if (messenger == null) return;
    _lastLocationPromptAt = DateTime.now();

    final message = switch (status) {
      LocationAccessStatus.serviceDisabled =>
        'Activa la ubicacion para actualizar tu posicion.',
      LocationAccessStatus.permissionDenied =>
        'Permite la ubicacion para actualizar tu posicion.',
      LocationAccessStatus.permissionDeniedForever =>
        'Habilita la ubicacion desde ajustes para actualizar tu posicion.',
      LocationAccessStatus.alwaysPermissionRequired =>
        'Activa el permiso siempre para actualizar tu posicion en segundo plano.',
      LocationAccessStatus.available ||
      LocationAccessStatus.webUnsupported => '',
    };

    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          action: SnackBarAction(
            label: 'Ajustes',
            onPressed: () {
              switch (status) {
                case LocationAccessStatus.serviceDisabled:
                  unawaited(locationService.openDeviceLocationSettings());
                case LocationAccessStatus.permissionDenied:
                  unawaited(
                    locationService.requestLocationAccess(
                      requestAlwaysPermission: true,
                      requireAlwaysPermission: true,
                    ),
                  );
                case LocationAccessStatus.permissionDeniedForever:
                  unawaited(locationService.openAppLocationSettings());
                case LocationAccessStatus.alwaysPermissionRequired:
                  unawaited(locationService.openAppLocationSettings());
                case LocationAccessStatus.available:
                case LocationAccessStatus.webUnsupported:
                  break;
              }
            },
          ),
        ),
      );
  }

  /// Invita periodicamente a los invitados (sin sesion o con sesion anonima) a
  /// crear una cuenta o iniciar sesion para no perder favoritos, playlists y
  /// preferencias. Respeta un periodo de espera persistido para no ser invasivo.
  Future<void> _promptGuestSignUpIfNeeded() async {
    if (_guestSignUpPromptVisible) return;

    final user = ref.read(authProvider).asData?.value;
    final isGuest = user == null || user.isAnonymous;
    if (!isGuest) return;

    final box = Hive.box(settingsBoxName);
    final lastShownMs = box.get(_guestSignUpPromptKey) as int?;
    if (lastShownMs != null) {
      final lastShownAt = DateTime.fromMillisecondsSinceEpoch(lastShownMs);
      if (DateTime.now().difference(lastShownAt) < _guestSignUpCooldown) {
        return;
      }
    }

    await box.put(_guestSignUpPromptKey, DateTime.now().millisecondsSinceEpoch);

    _showGuestSignUpDialog();
  }

  void _showGuestSignUpDialog() {
    final dialogContext = _navigatorDialogContext;
    if (dialogContext == null) return;

    _guestSignUpPromptVisible = true;
    final result = showDialog<void>(
      context: dialogContext,
      builder: (dialogContext) {
        return AlertDialog(
          icon: const Icon(Icons.account_circle_outlined),
          title: Text(LocaleKeys.guest_signup_prompt_title.tr()),
          content: Text(LocaleKeys.guest_signup_prompt_message.tr()),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: Text(LocaleKeys.guest_signup_prompt_later.tr()),
            ),
            FilledButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                ref.read(routeProvider).go('/login');
              },
              child: Text(LocaleKeys.guest_signup_prompt_action.tr()),
            ),
          ],
        );
      },
    );
    unawaited(result.whenComplete(() => _guestSignUpPromptVisible = false));
  }

  BuildContext? get _navigatorDialogContext {
    final navigatorKey = ref.read(appNavigatorKeyProvider);
    return navigatorKey.currentContext ?? navigatorKey.currentState?.context;
  }
}

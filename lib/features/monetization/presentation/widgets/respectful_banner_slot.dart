import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:flow_music/core/audio/background_audio_handler.dart';
import 'package:flow_music/core/config/app_environment.dart';
import 'package:flow_music/features/monetization/domain/services/ad_visibility_policy.dart';
import 'package:flow_music/features/monetization/presentation/providers/ad_providers.dart';
import 'package:flow_music/features/monetization/presentation/providers/monetization_providers.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Un unico banner compacto. Nunca cubre contenido y desaparece en cuanto se
/// inicia una sesion de audio o se confirma la suscripcion sin anuncios.
class RespectfulBannerSlot extends ConsumerWidget {
  const RespectfulBannerSlot({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final access = ref.watch(subscriptionAccessProvider).value;
    if (access == null) return const SizedBox.shrink();

    return StreamBuilder<MediaItem?>(
      stream: flowAudioHandler.mediaItem,
      initialData: flowAudioHandler.mediaItem.value,
      builder: (context, snapshot) {
        final item = snapshot.data;
        final audioSessionActive =
            item != null &&
            item.title.trim().isNotEmpty &&
            item.title != 'StreamBeat';
        final shouldShow = AdVisibilityPolicy.shouldShow(
          access: access,
          audioSessionActive: audioSessionActive,
          adsSupported: AppEnvironment.supportsNativeMonetization,
        );
        return shouldShow ? const _AdaptiveBanner() : const SizedBox.shrink();
      },
    );
  }
}

class _AdaptiveBanner extends ConsumerStatefulWidget {
  const _AdaptiveBanner();

  @override
  ConsumerState<_AdaptiveBanner> createState() => _AdaptiveBannerState();
}

class _AdaptiveBannerState extends ConsumerState<_AdaptiveBanner> {
  BannerAd? _banner;
  int? _requestedWidth;
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    final consent = ref.watch(canRequestAdsProvider);
    if (consent.value != true) return const SizedBox.shrink();

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth.floor();
        if (width > 0 && width != _requestedWidth && !_loading) {
          _requestedWidth = width;
          scheduleMicrotask(() => _load(width));
        }
        final banner = _banner;
        if (banner == null) return const SizedBox.shrink();
        return ColoredBox(
          color: Theme.of(context).colorScheme.surface,
          child: Center(
            child: SafeArea(
              top: false,
              bottom: false,
              child: SizedBox(
                width: banner.size.width.toDouble(),
                height: banner.size.height.toDouble(),
                child: AdWidget(ad: banner),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _load(int _) async {
    if (!mounted || _loading) return;
    _loading = true;
    final previous = _banner;
    _banner = null;
    await previous?.dispose();
    const size = AdSize.banner;
    if (!mounted) {
      _loading = false;
      return;
    }

    final banner = BannerAd(
      adUnitId: AppEnvironment.admobBannerId,
      request: const AdRequest(),
      size: size,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          if (!mounted) {
            unawaited(ad.dispose());
            return;
          }
          setState(() {
            _banner = ad as BannerAd;
            _loading = false;
          });
        },
        onAdFailedToLoad: (ad, _) {
          unawaited(ad.dispose());
          if (mounted) setState(() => _loading = false);
        },
      ),
    );
    await banner.load();
  }

  @override
  void dispose() {
    unawaited(_banner?.dispose());
    super.dispose();
  }
}

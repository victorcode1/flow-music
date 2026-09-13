import 'dart:async';

import 'package:flow_music/core/config/app_environment.dart';
import 'package:flow_music/features/monetization/domain/services/ad_visibility_policy.dart';
import 'package:flow_music/features/monetization/presentation/providers/ad_providers.dart';
import 'package:flow_music/features/monetization/presentation/providers/monetization_providers.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Un banner compacto separado de los controles. Escuchar no lo oculta;
/// pasar a segundo plano libera el anuncio sin tocar la sesion de audio.
class RespectfulBannerSlot extends ConsumerStatefulWidget {
  const RespectfulBannerSlot({super.key});

  @override
  ConsumerState<RespectfulBannerSlot> createState() =>
      _RespectfulBannerSlotState();
}

class _RespectfulBannerSlotState extends ConsumerState<RespectfulBannerSlot>
    with WidgetsBindingObserver {
  late bool _foreground;

  @override
  void initState() {
    super.initState();
    _foreground =
        WidgetsBinding.instance.lifecycleState == AppLifecycleState.resumed;
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final foreground = state == AppLifecycleState.resumed;
    if (_foreground != foreground) setState(() => _foreground = foreground);
  }

  @override
  Widget build(BuildContext context) {
    final access = ref.watch(subscriptionAccessProvider).value;
    if (access == null ||
        !AdVisibilityPolicy.shouldShow(
          access: access,
          adsSupported: AppEnvironment.supportsNativeMonetization,
        )) {
      return const SizedBox.shrink();
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < AdSize.banner.width) {
          return const SizedBox.shrink();
        }
        // Reservar altura antes de cargar evita desplazar los botones al llegar
        // el anuncio. El espacio se conserva al abrir/cerrar otra aplicacion.
        return SizedBox(
          height: AdSize.banner.height + 24,
          child: _foreground ? const _CompactBanner() : null,
        );
      },
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}

class _CompactBanner extends ConsumerStatefulWidget {
  const _CompactBanner();

  @override
  ConsumerState<_CompactBanner> createState() => _CompactBannerState();
}

class _CompactBannerState extends ConsumerState<_CompactBanner>
    with WidgetsBindingObserver {
  BannerAd? _banner;
  bool _loaded = false;
  Timer? _retry;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      setState(() {});
      return;
    }
    // En paused Flutter puede no dibujar otro frame: liberar el recurso nativo
    // aqui, sin esperar a que el padre retire este widget.
    _retry?.cancel();
    _retry = null;
    final banner = _banner;
    _banner = null;
    _loaded = false;
    unawaited(banner?.dispose());
  }

  @override
  Widget build(BuildContext context) {
    final consent = ref.watch(canRequestAdsProvider);
    if (consent.value != true ||
        WidgetsBinding.instance.lifecycleState != AppLifecycleState.resumed) {
      return const SizedBox.shrink();
    }
    if (_banner == null && _retry == null) {
      // La referencia se asigna inmediatamente para no duplicar solicitudes.
      _load();
    }
    final banner = _banner;
    if (!_loaded || banner == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Center(
        child: SizedBox(
          width: AdSize.banner.width.toDouble(),
          height: AdSize.banner.height.toDouble(),
          child: AdWidget(ad: banner),
        ),
      ),
    );
  }

  void _load() {
    final banner = BannerAd(
      adUnitId: AppEnvironment.admobBannerId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          if (!mounted || !identical(_banner, ad)) return;
          setState(() => _loaded = true);
        },
        onAdFailedToLoad: (ad, error) => _failed(ad),
      ),
    );
    _banner = banner;
    unawaited(banner.load().catchError((Object error) => _failed(banner)));
  }

  void _failed(Ad ad) {
    if (!mounted || !identical(_banner, ad)) return;
    unawaited(ad.dispose());
    _banner = null;
    _retry = Timer(const Duration(minutes: 1), () {
      _retry = null;
      if (mounted) setState(() {});
    });
    setState(() => _loaded = false);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _retry?.cancel();
    unawaited(_banner?.dispose());
    super.dispose();
  }
}

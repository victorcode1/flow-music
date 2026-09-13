import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/analytics/product_analytics.dart';
import 'package:flow_music/core/engagement/subscription_promo_coordinator.dart';
import 'package:flow_music/core/routes/app_navigator_key.dart';
import 'package:flow_music/core/routes/routes.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flow_music/features/monetization/domain/entities/subscription_access.dart';
import 'package:flow_music/features/monetization/presentation/providers/monetization_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SubscriptionPromoListener extends ConsumerStatefulWidget {
  const SubscriptionPromoListener({super.key, required this.child});

  final Widget child;

  @override
  ConsumerState<SubscriptionPromoListener> createState() =>
      _SubscriptionPromoListenerState();
}

class _SubscriptionPromoListenerState
    extends ConsumerState<SubscriptionPromoListener> {
  bool _ready = false;
  bool _scheduled = false;
  bool _shownThisSession = false;

  @override
  void initState() {
    super.initState();
    unawaited(_initialize());
  }

  Future<void> _initialize() async {
    await ref.read(subscriptionPromoCoordinatorProvider).recordLaunch();
    await Future<void>.delayed(const Duration(seconds: 3));
    if (mounted) setState(() => _ready = true);
  }

  @override
  Widget build(BuildContext context) {
    final access = ref.watch(subscriptionAccessProvider).value;
    if (_canSchedule(access)) {
      _scheduled = true;
      WidgetsBinding.instance.addPostFrameCallback((_) => _showPromo());
    }
    return widget.child;
  }

  bool _canSchedule(SubscriptionAccess? access) {
    if (!_ready || _scheduled || _shownThisSession) {
      return false;
    }
    return _isEligible(access);
  }

  bool _isEligible(SubscriptionAccess? access) {
    if (access == null ||
        !access.isResolved ||
        !access.serviceAvailable ||
        access.isActive) {
      return false;
    }
    return ref.read(subscriptionPromoCoordinatorProvider).shouldShow();
  }

  Future<void> _showPromo() async {
    if (!mounted || _shownThisSession) return;
    // Access may have changed since the post-frame callback was scheduled.
    if (!_isEligible(ref.read(subscriptionAccessProvider).value)) {
      _scheduled = false;
      return;
    }

    // This listener lives in MaterialApp.router.builder, ABOVE the Navigator.
    // Its mounted context cannot be used by showDialog. The root overlay is a
    // descendant of the actual Navigator and can safely host the dialog.
    final navigator = ref.read(appNavigatorKeyProvider).currentState;
    final navigatorContext = navigator?.overlay?.context;
    if (navigator == null ||
        !navigator.mounted ||
        navigatorContext == null ||
        !navigatorContext.mounted) {
      _scheduled = false;
      return;
    }
    final coordinator = ref.read(subscriptionPromoCoordinatorProvider);
    final analytics = ref.read(productAnalyticsProvider);

    // No async gap between checking the Navigator and pushing the route.
    final dialogResult = showDialog<bool>(
      context: navigatorContext,
      builder: (dialogContext) => AlertDialog(
        icon: const Icon(Icons.workspace_premium_rounded, size: 36),
        title: Text(LocaleKeys.subscription_promo_title.tr()),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(LocaleKeys.subscription_promo_message.tr()),
            const SizedBox(height: 16),
            _PromoBenefit(
              icon: Icons.hide_source_rounded,
              text: LocaleKeys.subscription_promo_no_ads.tr(),
            ),
            const SizedBox(height: 10),
            _PromoBenefit(
              icon: Icons.devices_rounded,
              text: LocaleKeys.subscription_promo_portable.tr(),
            ),
            const SizedBox(height: 10),
            _PromoBenefit(
              icon: Icons.favorite_outline_rounded,
              text: LocaleKeys.subscription_promo_support.tr(),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: Text(LocaleKeys.subscription_promo_later.tr()),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: Text(LocaleKeys.subscription_promo_action.tr()),
          ),
        ],
      ),
    );

    // Count a display only after a real dialog route has been opened. Capture
    // dependencies before awaiting persistence, since the listener can unmount.
    _shownThisSession = true;
    unawaited(analytics.track('subscription_promo_shown'));
    await coordinator.markShown();
    final openSettings = await dialogResult;

    if (openSettings == true && mounted) {
      unawaited(
        ref.read(productAnalyticsProvider).track('subscription_promo_opened'),
      );
      ref.read(routeProvider).go('/settings');
    }
  }
}

class _PromoBenefit extends StatelessWidget {
  const _PromoBenefit({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: colors.primary),
        const SizedBox(width: 10),
        Expanded(child: Text(text)),
      ],
    );
  }
}

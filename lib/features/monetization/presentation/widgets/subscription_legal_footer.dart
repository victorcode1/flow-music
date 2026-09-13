import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flow_music/features/monetization/domain/services/subscription_links.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SubscriptionLegalFooter extends StatelessWidget {
  const SubscriptionLegalFooter({super.key, required this.onOpenLink});

  final ValueChanged<Uri> onOpenLink;

  @override
  Widget build(BuildContext context) {
    final isIos = !kIsWeb && defaultTargetPlatform == TargetPlatform.iOS;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isIos) ...[
          const SizedBox(height: 12),
          Text(
            LocaleKeys.subscription_apple_disclosure.tr(),
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
        Wrap(
          spacing: 8,
          children: [
            TextButton(
              key: const Key('subscription-privacy'),
              onPressed: () => onOpenLink(SubscriptionLinks.privacy),
              child: Text(LocaleKeys.subscription_privacy_policy.tr()),
            ),
            if (isIos)
              TextButton(
                key: const Key('subscription-terms'),
                onPressed: () => onOpenLink(SubscriptionLinks.appleTerms),
                child: Text(LocaleKeys.subscription_terms_of_use.tr()),
              ),
          ],
        ),
      ],
    );
  }
}

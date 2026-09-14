import 'package:flow_music/features/monetization/domain/services/subscription_links.dart';
import 'package:flow_music/features/monetization/presentation/widgets/subscription_legal_footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('iOS includes working privacy and Apple EULA actions', (
    tester,
  ) async {
    final opened = <Uri>[];
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: SubscriptionLegalFooter(onOpenLink: opened.add)),
      ),
    );
    await tester.tap(find.byKey(const Key('subscription-privacy')));
    await tester.tap(find.byKey(const Key('subscription-terms')));
    expect(opened, [SubscriptionLinks.privacy, SubscriptionLinks.appleTerms]);
    expect(find.text('subscription_apple_disclosure'), findsOneWidget);
  }, variant: TargetPlatformVariant.only(TargetPlatform.iOS));

  testWidgets('Android does not display Apple payment terms', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: SubscriptionLegalFooter(onOpenLink: (_) {})),
      ),
    );
    expect(find.byKey(const Key('subscription-privacy')), findsOneWidget);
    expect(find.byKey(const Key('subscription-terms')), findsNothing);
    expect(find.text('subscription_apple_disclosure'), findsNothing);
  }, variant: TargetPlatformVariant.only(TargetPlatform.android));
}

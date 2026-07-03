import 'package:flow_music/features/home/presentation/widgets/app_bar.dart';
import 'package:flow_music/features/home/presentation/widgets/home_mobile_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomeMobileAppBar', () {
    test('preferredSize matches compact app bar height', () {
      const widget = HomeMobileAppBar(
        showNowPlayingDetails: false,
        showMiniPlayer: false,
      );

      expect(widget.preferredSize.height, kToolbarHeight + 20);
    });

    test('preferredSize matches now playing details height', () {
      const widget = HomeMobileAppBar(
        showNowPlayingDetails: true,
        showMiniPlayer: false,
      );

      expect(widget.preferredSize.height, kToolbarHeight + 40);
    });

    testWidgets('builds AppAbarMain and forwards wrapper configuration', (
      tester,
    ) async {
      late AppAbarMain builtChild;

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              const widget = HomeMobileAppBar(
                showNowPlayingDetails: true,
                showMiniPlayer: true,
              );
              builtChild = widget.build(context) as AppAbarMain;
              return const SizedBox.shrink();
            },
          ),
        ),
      );

      expect(builtChild.showNowPlayingDetails, isTrue);
      expect(builtChild.showNowPlayingTitle, isFalse);
    });

    testWidgets(
      'forwards query callback and enables title when mini player is hidden',
      (tester) async {
        void onQuery(String value) {}

        late AppAbarMain builtChild;

        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (context) {
                final widget = HomeMobileAppBar(
                  query: onQuery,
                  showNowPlayingDetails: false,
                  showMiniPlayer: false,
                );
                builtChild = widget.build(context) as AppAbarMain;
                return const SizedBox.shrink();
              },
            ),
          ),
        );

        expect(builtChild.query, same(onQuery));
        expect(builtChild.showNowPlayingDetails, isFalse);
        expect(builtChild.showNowPlayingTitle, isTrue);
      },
    );
  });
}

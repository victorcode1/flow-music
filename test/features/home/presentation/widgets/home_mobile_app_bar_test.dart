import 'package:flow_music/features/home/presentation/widgets/home_mobile_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('uses the compact StreamBeat header height', () {
    const widget = HomeMobileAppBar(onSearch: _noop);

    expect(widget.preferredSize.height, kToolbarHeight + 20);
  });

  testWidgets('opens the radio search action', (tester) async {
    var tapped = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(appBar: HomeMobileAppBar(onSearch: () => tapped = true)),
      ),
    );

    await tester.tap(find.byIcon(Icons.search_rounded));

    expect(tapped, isTrue);
  });
}

void _noop() {}

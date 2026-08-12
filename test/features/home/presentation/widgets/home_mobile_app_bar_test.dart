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

  testWidgets('shows an editable station field without navigating', (
    tester,
  ) async {
    final controller = TextEditingController();
    addTearDown(controller.dispose);
    var closed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: HomeMobileAppBar(
            onSearch: _noop,
            isSearching: true,
            searchController: controller,
            onCloseSearch: () => closed = true,
          ),
        ),
      ),
    );

    await tester.enterText(
      find.byKey(const Key('station-search-field')),
      'Radio Panamá',
    );
    expect(controller.text, 'Radio Panamá');

    await tester.tap(find.byIcon(Icons.close_rounded));
    expect(closed, isTrue);
  });
}

void _noop() {}

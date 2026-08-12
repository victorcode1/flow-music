import 'package:cached_network_image/cached_network_image.dart';
import 'package:flow_music/shared/widgets/optimized_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('uses a shared thumbnail disk tier and exact memory size', (
    tester,
  ) async {
    await _pumpArtwork(tester, logicalSize: 58, devicePixelRatio: 3);

    final image = tester.widget<CachedNetworkImage>(
      find.byType(CachedNetworkImage),
    );
    expect(image.memCacheWidth, 174);
    expect(image.maxWidthDiskCache, 256);
    expect(image.maxHeightDiskCache, 256);
  });

  testWidgets('keeps a high-resolution disk variant for large covers', (
    tester,
  ) async {
    await _pumpArtwork(tester, logicalSize: 390, devicePixelRatio: 3);

    final image = tester.widget<CachedNetworkImage>(
      find.byType(CachedNetworkImage),
    );
    expect(image.memCacheWidth, 1170);
    expect(image.maxWidthDiskCache, 1200);
    expect(image.maxHeightDiskCache, 1200);
  });
}

Future<void> _pumpArtwork(
  WidgetTester tester, {
  required double logicalSize,
  required double devicePixelRatio,
}) {
  return tester.pumpWidget(
    MaterialApp(
      home: MediaQuery(
        data: MediaQueryData(devicePixelRatio: devicePixelRatio),
        child: Center(
          child: SizedBox.square(
            dimension: logicalSize,
            child: OptimizedNetworkImage(
              url: 'https://example.invalid/artwork.png',
              displaySize: logicalSize,
              errorBuilder: (_, _, _) => const SizedBox.expand(),
            ),
          ),
        ),
      ),
    ),
  );
}

import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// Keeps remote artwork on disk and decodes it close to its on-screen size.
///
/// The three disk-size tiers let thumbnails share one cached file while large
/// covers keep enough source detail. `CachedNetworkImage` also retains the
/// original download, so opening a large cover after its thumbnail does not
/// trigger another network request or upscale the small cached variant.
class OptimizedNetworkImage extends StatelessWidget {
  const OptimizedNetworkImage({
    super.key,
    required this.url,
    required this.errorBuilder,
    this.displaySize,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
  });

  final String url;
  final ImageErrorWidgetBuilder errorBuilder;
  final double? displaySize;
  final BoxFit fit;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final constrainedSize = math.max(
          constraints.maxWidth.isFinite ? constraints.maxWidth : 0,
          constraints.maxHeight.isFinite ? constraints.maxHeight : 0,
        );
        final logicalSize = displaySize ?? constrainedSize;
        final devicePixelRatio = MediaQuery.devicePixelRatioOf(context);
        final memoryCacheWidth = logicalSize > 0
            ? (logicalSize * devicePixelRatio).ceil().clamp(1, 1200)
            : null;
        final diskCacheWidth = switch (memoryCacheWidth) {
          null => null,
          <= 256 => 256,
          <= 640 => 640,
          _ => 1200,
        };

        return CachedNetworkImage(
          imageUrl: url,
          fit: fit,
          alignment: alignment.resolve(Directionality.of(context)),
          memCacheWidth: memoryCacheWidth,
          maxWidthDiskCache: diskCacheWidth,
          maxHeightDiskCache: diskCacheWidth,
          filterQuality: FilterQuality.high,
          useOldImageOnUrlChange: true,
          fadeInDuration: const Duration(milliseconds: 120),
          fadeOutDuration: Duration.zero,
          placeholder: (_, _) => const SizedBox.expand(),
          errorWidget: (context, _, error) =>
              errorBuilder(context, error, null),
        );
      },
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const double flowWideLayoutBreakpoint = 900;
const double flowContentMaxWidth = 1320;

bool useFlowWideLayout(BuildContext context) {
  final size = MediaQuery.sizeOf(context);
  return size.width >= flowWideLayoutBreakpoint;
}

bool get supportsFlowDesktopShell {
  if (kIsWeb) return true;
  return switch (defaultTargetPlatform) {
    TargetPlatform.macOS ||
    TargetPlatform.windows ||
    TargetPlatform.linux => true,
    TargetPlatform.android ||
    TargetPlatform.iOS ||
    TargetPlatform.fuchsia => false,
  };
}

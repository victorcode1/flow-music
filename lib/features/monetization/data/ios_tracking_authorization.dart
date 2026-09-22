import 'dart:async';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

/// Completes the system privacy decision before the advertising SDK starts.
Future<bool> prepareIosTrackingAuthorization() async {
  if (kIsWeb || defaultTargetPlatform != TargetPlatform.iOS) return true;

  await _waitUntilResumed();
  await WidgetsBinding.instance.endOfFrame;
  var status = await AppTrackingTransparency.trackingAuthorizationStatus;
  if (status == TrackingStatus.notDetermined) {
    status = await AppTrackingTransparency.requestTrackingAuthorization();
  }
  // An interrupted prompt is not a decision. Keep ads disabled in that case.
  // Denial/restriction still permits ads without IDFA through the Google SDK.
  return status != TrackingStatus.notDetermined;
}

Future<void> _waitUntilResumed() async {
  if (WidgetsBinding.instance.lifecycleState == AppLifecycleState.resumed) {
    return;
  }
  final resumed = Completer<void>();
  final listener = AppLifecycleListener(
    onResume: () {
      if (!resumed.isCompleted) resumed.complete();
    },
  );
  try {
    await resumed.future;
  } finally {
    listener.dispose();
  }
}

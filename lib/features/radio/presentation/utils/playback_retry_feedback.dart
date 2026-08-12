import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason>?
showAutomaticPlaybackRetryNotice(ScaffoldMessengerState? messenger) {
  if (messenger == null) return null;
  messenger.hideCurrentSnackBar();
  return messenger.showSnackBar(
    SnackBar(content: Text(LocaleKeys.radio_play_retrying.tr())),
  );
}

void showFinalPlaybackFailureNotice(
  ScaffoldMessengerState? messenger, {
  required VoidCallback onRetry,
}) {
  if (messenger == null) return;
  messenger.hideCurrentSnackBar();
  messenger.showSnackBar(
    SnackBar(
      content: Text(LocaleKeys.radio_play_retry_failed.tr()),
      duration: const Duration(seconds: 8),
      action: SnackBarAction(label: LocaleKeys.retry.tr(), onPressed: onRetry),
    ),
  );
}

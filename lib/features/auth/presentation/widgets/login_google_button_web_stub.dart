import 'package:flutter/widgets.dart';

const bool supportsGoogleWebButton = false;

Widget buildGoogleWebButton({
  required bool isRegister,
  required bool isSubmitting,
  required Future<void> Function() initializeGoogleSignIn,
  required Stream<String> googleIdTokenEvents,
  required ValueChanged<String> onIdToken,
  required ValueChanged<Object> onError,
}) {
  return const SizedBox.shrink();
}

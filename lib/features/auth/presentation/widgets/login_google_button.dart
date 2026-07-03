import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flutter/material.dart';

import 'login_google_button_web_stub.dart'
    if (dart.library.js_interop) 'login_google_button_web.dart'
    as web_button;

class LoginGoogleButton extends StatelessWidget {
  const LoginGoogleButton({
    super.key,
    required this.isRegister,
    required this.isSubmitting,
    required this.initializeGoogleSignIn,
    required this.googleIdTokenEvents,
    required this.onPressed,
    required this.onIdToken,
    required this.onError,
  });

  final bool isRegister;
  final bool isSubmitting;
  final Future<void> Function() initializeGoogleSignIn;
  final Stream<String> googleIdTokenEvents;
  final VoidCallback onPressed;
  final ValueChanged<String> onIdToken;
  final ValueChanged<Object> onError;

  @override
  Widget build(BuildContext context) {
    if (web_button.supportsGoogleWebButton) {
      return web_button.buildGoogleWebButton(
        isRegister: isRegister,
        isSubmitting: isSubmitting,
        initializeGoogleSignIn: initializeGoogleSignIn,
        googleIdTokenEvents: googleIdTokenEvents,
        onIdToken: onIdToken,
        onError: onError,
      );
    }

    return SizedBox(
      width: double.infinity,
      height: 52,
      child: OutlinedButton.icon(
        onPressed: isSubmitting ? null : onPressed,
        icon: const Text(
          'G',
          style: TextStyle(
            color: Color(0xFF4285F4),
            fontWeight: FontWeight.w800,
            fontSize: 18,
          ),
        ),
        label: Text(
          isRegister
              ? LocaleKeys.auth_register_with_google.tr()
              : LocaleKeys.auth_sign_in_with_google.tr(),
        ),
      ),
    );
  }
}

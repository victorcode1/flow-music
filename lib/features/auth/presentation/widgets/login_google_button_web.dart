import 'dart:async';
import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in_web/web_only.dart' as google_web;

const bool supportsGoogleWebButton = true;

Widget buildGoogleWebButton({
  required bool isRegister,
  required bool isSubmitting,
  required Future<void> Function() initializeGoogleSignIn,
  required Stream<String> googleIdTokenEvents,
  required ValueChanged<String> onIdToken,
  required ValueChanged<Object> onError,
}) {
  return _GoogleWebButton(
    isRegister: isRegister,
    isSubmitting: isSubmitting,
    initializeGoogleSignIn: initializeGoogleSignIn,
    googleIdTokenEvents: googleIdTokenEvents,
    onIdToken: onIdToken,
    onError: onError,
  );
}

class _GoogleWebButton extends StatefulWidget {
  const _GoogleWebButton({
    required this.isRegister,
    required this.isSubmitting,
    required this.initializeGoogleSignIn,
    required this.googleIdTokenEvents,
    required this.onIdToken,
    required this.onError,
  });

  final bool isRegister;
  final bool isSubmitting;
  final Future<void> Function() initializeGoogleSignIn;
  final Stream<String> googleIdTokenEvents;
  final ValueChanged<String> onIdToken;
  final ValueChanged<Object> onError;

  @override
  State<_GoogleWebButton> createState() => _GoogleWebButtonState();
}

class _GoogleWebButtonState extends State<_GoogleWebButton> {
  StreamSubscription<String>? _tokenSubscription;
  Object? _initializationError;

  @override
  void initState() {
    super.initState();
    _listenForGoogleTokens();
    unawaited(_initialize());
  }

  @override
  void dispose() {
    unawaited(_tokenSubscription?.cancel());
    super.dispose();
  }

  Future<void> _initialize() async {
    try {
      await widget.initializeGoogleSignIn();
    } catch (error) {
      if (!mounted) return;
      setState(() => _initializationError = error);
      widget.onError(error);
    }
  }

  void _listenForGoogleTokens() {
    _tokenSubscription = widget.googleIdTokenEvents.listen(
      (idToken) {
        if (!mounted) return;
        widget.onIdToken(idToken);
      },
      onError: (Object error) {
        if (!mounted) return;
        widget.onError(error);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final error = _initializationError;
    if (error != null) {
      return _GoogleWebUnavailableButton(
        isRegister: widget.isRegister,
        onPressed: () {
          widget.onError(error);
          unawaited(_initialize());
        },
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final buttonWidth = min(max(constraints.maxWidth, 120), 400).toDouble();
        return SizedBox(
          width: double.infinity,
          height: 52,
          child: AbsorbPointer(
            absorbing: widget.isSubmitting,
            child: Opacity(
              opacity: widget.isSubmitting ? 0.56 : 1,
              child: google_web.renderButton(
                configuration: google_web.GSIButtonConfiguration(
                  type: google_web.GSIButtonType.standard,
                  theme: google_web.GSIButtonTheme.filledBlack,
                  size: google_web.GSIButtonSize.large,
                  text: widget.isRegister
                      ? google_web.GSIButtonText.signupWith
                      : google_web.GSIButtonText.continueWith,
                  shape: google_web.GSIButtonShape.pill,
                  logoAlignment: google_web.GSIButtonLogoAlignment.left,
                  minimumWidth: buttonWidth,
                  locale: 'es',
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _GoogleWebUnavailableButton extends StatelessWidget {
  const _GoogleWebUnavailableButton({
    required this.isRegister,
    required this.onPressed,
  });

  final bool isRegister;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: OutlinedButton.icon(
        onPressed: onPressed,
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

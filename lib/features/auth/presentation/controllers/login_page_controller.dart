import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flow_music/features/auth/domain/entities/auth_user.dart';
import 'package:flow_music/features/auth/domain/repositories/auth_repository.dart';
import 'package:flow_music/features/auth/data/providers/auth_providers.dart';
import 'package:flow_music/features/auth/presentation/notifiers/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum AuthMode { signIn, register }

class LoginPageController extends ChangeNotifier {
  LoginPageController(this.ref);

  final WidgetRef ref;
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  AuthMode _mode = AuthMode.signIn;
  bool _passwordVisible = false;
  bool _confirmVisible = false;
  bool _submitting = false;

  AuthMode get mode => _mode;
  bool get isRegister => _mode == AuthMode.register;
  bool get passwordVisible => _passwordVisible;
  bool get confirmVisible => _confirmVisible;
  bool get isSubmitting => _submitting;
  Stream<String> get googleIdTokenEvents =>
      ref.read(googleIdentityClientProvider).idTokenEvents;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  void setMode(AuthMode mode) {
    _mode = mode;
    confirmController.clear();
    formKey.currentState?.reset();
    notifyListeners();
  }

  void togglePasswordVisibility() {
    _passwordVisible = !_passwordVisible;
    notifyListeners();
  }

  void toggleConfirmVisibility() {
    _confirmVisible = !_confirmVisible;
    notifyListeners();
  }

  void handleAuthStateChanged(
    BuildContext context,
    AsyncValue<AuthUser?> next,
  ) {
    final user = next.asData?.value;
    if (user == null || user.isAnonymous) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (context.mounted) _closeAfterSuccessfulAuth(context);
    });
  }

  void redirectIfAuthenticated(BuildContext context, AuthUser? currentUser) {
    if (currentUser == null || currentUser.isAnonymous) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (context.mounted) _closeAfterSuccessfulAuth(context);
    });
  }

  Future<void> submit(BuildContext context) async {
    if (!(formKey.currentState?.validate() ?? false)) return;
    TextInput.finishAutofillContext();
    final email = emailController.text.trim();
    final password = passwordController.text;
    final notifier = ref.read(authProvider.notifier);

    await _runAuth(context, () async {
      if (isRegister) {
        await notifier.registerWithEmail(
          email: email,
          password: password,
          displayName: nameController.text.trim(),
        );
        return;
      }
      await notifier.signInWithEmail(email: email, password: password);
    });
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    await _runAuth(context, ref.read(authProvider.notifier).signInWithGoogle);
  }

  Future<void> signInWithGoogleIdToken(
    BuildContext context,
    String googleIdToken,
  ) async {
    await _runAuth(
      context,
      () => ref
          .read(authProvider.notifier)
          .signInWithGoogleIdToken(googleIdToken),
    );
  }

  Future<void> initializeGoogleSignIn() {
    return ref.read(googleIdentityClientProvider).initialize();
  }

  Future<void> sendPasswordReset(BuildContext context) async {
    final email = emailController.text.trim();
    if (email.isEmpty || emailValidator(email) != null) {
      _showSnack(context, LocaleKeys.auth_invalid_email.tr());
      return;
    }

    try {
      await ref.read(authProvider.notifier).sendPasswordResetEmail(email);
      if (!context.mounted) return;
      _showSnack(context, LocaleKeys.auth_password_reset_sent.tr());
    } catch (error) {
      if (!context.mounted) return;
      _showSnack(context, _failureMessage(error));
    }
  }

  void showAuthError(BuildContext context, Object error) {
    if (!context.mounted) return;
    _showSnack(context, _failureMessage(error));
  }

  void closeLogin(BuildContext context) {
    FocusScope.of(context).unfocus();
    context.go('/home');
  }

  String? requiredValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return LocaleKeys.auth_required_field.tr();
    }
    return null;
  }

  String? emailValidator(String? value) {
    final text = value?.trim() ?? '';
    if (text.isEmpty) return LocaleKeys.auth_required_field.tr();
    if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(text)) {
      return LocaleKeys.auth_invalid_email.tr();
    }
    return null;
  }

  String? passwordValidator(String? value) {
    final text = value ?? '';
    if (text.isEmpty) return LocaleKeys.auth_required_field.tr();
    if (text.length < 6) return LocaleKeys.auth_password_too_short.tr();
    return null;
  }

  String? confirmValidator(String? value) {
    final error = passwordValidator(value);
    if (error != null) return error;
    if (value != passwordController.text) {
      return LocaleKeys.auth_passwords_do_not_match.tr();
    }
    return null;
  }

  Future<void> _runAuth(
    BuildContext context,
    Future<void> Function() action,
  ) async {
    FocusScope.of(context).unfocus();
    _submitting = true;
    notifyListeners();
    try {
      await action();
      if (!context.mounted) return;
      _closeAfterSuccessfulAuth(context);
    } catch (error) {
      if (!context.mounted) return;
      _showSnack(context, _failureMessage(error));
    } finally {
      _submitting = false;
      notifyListeners();
    }
  }

  String _failureMessage(Object error) {
    if (error is AuthException) return error.message;
    return LocaleKeys.auth_action_failed.tr();
  }

  void _showSnack(BuildContext context, String message) {
    ScaffoldMessenger.maybeOf(context)
      ?..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  void _closeAfterSuccessfulAuth(BuildContext context) {
    FocusScope.of(context).unfocus();
    context.go('/home');
  }
}

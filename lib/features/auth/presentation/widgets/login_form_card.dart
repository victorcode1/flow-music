import 'package:flow_music/features/auth/presentation/controllers/login_page_controller.dart';
import 'package:flow_music/features/auth/presentation/widgets/login_alternative_divider.dart';
import 'package:flow_music/features/auth/presentation/widgets/login_confirm_password_field.dart';
import 'package:flow_music/features/auth/presentation/widgets/login_email_field.dart';
import 'package:flow_music/features/auth/presentation/widgets/login_forgot_password_button.dart';
import 'package:flow_music/features/auth/presentation/widgets/login_form_subtitle.dart';
import 'package:flow_music/features/auth/presentation/widgets/login_form_title.dart';
import 'package:flow_music/features/auth/presentation/widgets/login_google_button.dart';
import 'package:flow_music/features/auth/presentation/widgets/login_mode_selector.dart';
import 'package:flow_music/features/auth/presentation/widgets/login_name_field.dart';
import 'package:flow_music/features/auth/presentation/widgets/login_password_field.dart';
import 'package:flow_music/features/auth/presentation/widgets/login_submit_button.dart';
import 'package:flutter/material.dart';

class LoginFormCard extends StatelessWidget {
  const LoginFormCard({super.key, required this.controller});

  final LoginPageController controller;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colors.surface.withValues(alpha: 0.92),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colors.outlineVariant),
        boxShadow: [
          BoxShadow(
            color: colors.scrim.withValues(alpha: 0.1),
            blurRadius: 32,
            offset: const Offset(0, 18),
          ),
        ],
      ),
      child: Form(
        key: controller.formKey,
        child: AutofillGroup(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              LoginModeSelector(
                mode: controller.mode,
                onModeChanged: controller.setMode,
              ),
              const SizedBox(height: 18),
              LoginFormTitle(isRegister: controller.isRegister),
              const SizedBox(height: 4),
              LoginFormSubtitle(isRegister: controller.isRegister),
              const SizedBox(height: 16),
              if (controller.isRegister) ...[
                LoginNameField(
                  controller: controller.nameController,
                  validator: controller.requiredValidator,
                ),
                const SizedBox(height: 12),
              ],
              LoginEmailField(
                controller: controller.emailController,
                validator: controller.emailValidator,
              ),
              const SizedBox(height: 12),
              LoginPasswordField(
                controller: controller.passwordController,
                isRegister: controller.isRegister,
                isVisible: controller.passwordVisible,
                validator: controller.passwordValidator,
                onToggleVisibility: controller.togglePasswordVisibility,
              ),
              if (controller.isRegister) ...[
                const SizedBox(height: 12),
                LoginConfirmPasswordField(
                  controller: controller.confirmController,
                  isVisible: controller.confirmVisible,
                  validator: controller.confirmValidator,
                  onToggleVisibility: controller.toggleConfirmVisibility,
                ),
              ],
              if (!controller.isRegister) ...[
                const SizedBox(height: 6),
                LoginForgotPasswordButton(
                  enabled: !controller.isSubmitting,
                  onPressed: () => controller.sendPasswordReset(context),
                ),
              ],
              const SizedBox(height: 16),
              LoginSubmitButton(
                isRegister: controller.isRegister,
                isSubmitting: controller.isSubmitting,
                onPressed: () => controller.submit(context),
              ),
              const SizedBox(height: 14),
              const LoginAlternativeDivider(),
              const SizedBox(height: 14),
              LoginGoogleButton(
                isRegister: controller.isRegister,
                isSubmitting: controller.isSubmitting,
                initializeGoogleSignIn: controller.initializeGoogleSignIn,
                googleIdTokenEvents: controller.googleIdTokenEvents,
                onPressed: () => controller.signInWithGoogle(context),
                onIdToken: (idToken) =>
                    controller.signInWithGoogleIdToken(context, idToken),
                onError: (error) => controller.showAuthError(context, error),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

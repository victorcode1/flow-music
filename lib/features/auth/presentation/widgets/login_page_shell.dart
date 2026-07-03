import 'package:flow_music/core/theme/custom_theme.dart';
import 'package:flow_music/features/auth/presentation/widgets/login_close_button.dart';
import 'package:flow_music/features/auth/presentation/widgets/login_header.dart';
import 'package:flutter/material.dart';

class LoginPageShell extends StatelessWidget {
  const LoginPageShell({
    super.key,
    required this.isSubmitting,
    required this.onClose,
    required this.formCard,
  });

  final bool isSubmitting;
  final VoidCallback onClose;
  final Widget formCard;

  @override
  Widget build(BuildContext context) {
    final extras = Theme.of(context).extension<FlowThemeExtras>();

    return DecoratedBox(
      decoration: BoxDecoration(gradient: extras?.secondaryGradient),
      child: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 20,
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight - 40,
                    ),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 440),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const LoginHeader(),
                            const SizedBox(height: 24),
                            formCard,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                LoginCloseButton(
                  isSubmitting: isSubmitting,
                  onPressed: onClose,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

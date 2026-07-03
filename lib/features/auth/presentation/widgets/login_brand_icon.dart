import 'package:flow_music/core/theme/custom_theme.dart';
import 'package:flutter/material.dart';

class LoginBrandIcon extends StatelessWidget {
  const LoginBrandIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final extras = theme.extension<FlowThemeExtras>();
    return Container(
      width: 74,
      height: 74,
      decoration: BoxDecoration(
        gradient: extras?.primaryGradient,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: colors.primary.withValues(alpha: 0.22),
            blurRadius: 22,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Icon(Icons.graphic_eq_rounded, color: colors.onPrimary, size: 40),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flutter/material.dart';

class LoginFormSubtitle extends StatelessWidget {
  const LoginFormSubtitle({super.key, required this.isRegister});

  final bool isRegister;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    return Text(
      isRegister
          ? LocaleKeys.auth_register_hint.tr()
          : LocaleKeys.auth_sign_in_hint.tr(),
      textAlign: TextAlign.center,
      style: theme.textTheme.bodyMedium?.copyWith(
        color: colors.onSurfaceVariant,
      ),
    );
  }
}

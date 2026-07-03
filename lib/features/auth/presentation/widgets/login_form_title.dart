import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flutter/material.dart';

class LoginFormTitle extends StatelessWidget {
  const LoginFormTitle({super.key, required this.isRegister});

  final bool isRegister;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      isRegister
          ? LocaleKeys.auth_register_title.tr()
          : LocaleKeys.auth_sign_in_title.tr(),
      textAlign: TextAlign.center,
      style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
    );
  }
}

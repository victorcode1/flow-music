import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flutter/material.dart';

class LoginHeaderSubtitle extends StatelessWidget {
  const LoginHeaderSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    return Text(
      LocaleKeys.auth_subtitle.tr(),
      textAlign: TextAlign.center,
      style: theme.textTheme.bodyMedium?.copyWith(
        color: colors.onSurfaceVariant,
        height: 1.35,
      ),
    );
  }
}

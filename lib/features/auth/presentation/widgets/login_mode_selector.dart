import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flow_music/features/auth/presentation/controllers/login_page_controller.dart';
import 'package:flutter/material.dart';

class LoginModeSelector extends StatelessWidget {
  const LoginModeSelector({
    super.key,
    required this.mode,
    required this.onModeChanged,
  });

  final AuthMode mode;
  final ValueChanged<AuthMode> onModeChanged;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<AuthMode>(
      showSelectedIcon: false,
      segments: [
        ButtonSegment(
          value: AuthMode.signIn,
          label: Text(LocaleKeys.auth_sign_in_tab.tr()),
        ),
        ButtonSegment(
          value: AuthMode.register,
          label: Text(LocaleKeys.auth_register_tab.tr()),
        ),
      ],
      selected: {mode},
      onSelectionChanged: (selection) => onModeChanged(selection.first),
    );
  }
}

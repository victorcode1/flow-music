import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flutter/material.dart';

class LoginPasswordField extends StatelessWidget {
  const LoginPasswordField({
    super.key,
    required this.controller,
    required this.isRegister,
    required this.isVisible,
    required this.validator,
    required this.onToggleVisibility,
  });

  final TextEditingController controller;
  final bool isRegister;
  final bool isVisible;
  final FormFieldValidator<String> validator;
  final VoidCallback onToggleVisibility;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: !isVisible,
      textInputAction: isRegister ? TextInputAction.next : TextInputAction.done,
      autofillHints: [
        isRegister ? AutofillHints.newPassword : AutofillHints.password,
      ],
      validator: validator,
      decoration: InputDecoration(
        labelText: LocaleKeys.auth_password_label.tr(),
        prefixIcon: const Icon(Icons.lock_rounded),
        suffixIcon: IconButton(
          onPressed: onToggleVisibility,
          icon: Icon(
            isVisible ? Icons.visibility_off_rounded : Icons.visibility_rounded,
          ),
        ),
      ),
    );
  }
}

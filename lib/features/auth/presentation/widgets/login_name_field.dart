import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flutter/material.dart';

class LoginNameField extends StatelessWidget {
  const LoginNameField({
    super.key,
    required this.controller,
    required this.validator,
  });

  final TextEditingController controller;
  final FormFieldValidator<String> validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      autofillHints: const [AutofillHints.name],
      validator: validator,
      decoration: InputDecoration(
        labelText: LocaleKeys.auth_name_label.tr(),
        prefixIcon: const Icon(Icons.person_rounded),
      ),
    );
  }
}

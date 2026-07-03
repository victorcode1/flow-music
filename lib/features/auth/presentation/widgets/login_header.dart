import 'package:flow_music/features/auth/presentation/widgets/login_brand_icon.dart';
import 'package:flow_music/features/auth/presentation/widgets/login_header_subtitle.dart';
import 'package:flow_music/features/auth/presentation/widgets/login_header_title.dart';
import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const LoginBrandIcon(),
        const SizedBox(height: 18),
        const LoginHeaderTitle(),
        const SizedBox(height: 6),
        const LoginHeaderSubtitle(),
      ],
    );
  }
}

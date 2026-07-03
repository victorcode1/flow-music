import 'package:flow_music/features/auth/domain/entities/auth_user.dart';
import 'package:flow_music/features/auth/presentation/controllers/login_page_controller.dart';
import 'package:flow_music/features/auth/presentation/notifiers/auth_notifier.dart';
import 'package:flow_music/features/auth/presentation/widgets/login_form_card.dart';
import 'package:flow_music/features/auth/presentation/widgets/login_page_shell.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Pagina de autenticacion combinada: alterna entre inicio de sesion y
/// registro usando el backend HTTP de autenticacion.
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  late final LoginPageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = LoginPageController(ref);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<AuthUser?>>(authProvider, (previous, next) {
      _controller.handleAuthStateChanged(context, next);
    });
    final currentUser = ref.watch(authProvider).asData?.value;
    _controller.redirectIfAuthenticated(context, currentUser);

    return ListenableBuilder(
      listenable: _controller,
      builder: (context, _) {
        return Scaffold(
          body: LoginPageShell(
            isSubmitting: _controller.isSubmitting,
            onClose: () => _controller.closeLogin(context),
            formCard: LoginFormCard(controller: _controller),
          ),
        );
      },
    );
  }
}

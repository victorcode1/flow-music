import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/backend/backend_providers.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flow_music/features/account/domain/repositories/auth_repository.dart';
import 'package:flow_music/features/account/presentation/providers/account_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Completa el flujo de recuperacion cuando Supabase devuelve al usuario a la
/// app mediante el enlace enviado por correo.
class AccountRecoveryListener extends ConsumerStatefulWidget {
  const AccountRecoveryListener({required this.child, super.key});

  final Widget child;

  @override
  ConsumerState<AccountRecoveryListener> createState() =>
      _AccountRecoveryListenerState();
}

class _AccountRecoveryListenerState
    extends ConsumerState<AccountRecoveryListener> {
  StreamSubscription<AuthState>? _subscription;
  bool _dialogOpen = false;

  @override
  void initState() {
    super.initState();
    final client = ref.read(supabaseClientProvider);
    _subscription = client?.auth.onAuthStateChange.listen((state) {
      if (state.event == AuthChangeEvent.passwordRecovery && !_dialogOpen) {
        WidgetsBinding.instance.addPostFrameCallback((_) => _showDialog());
      }
    });
  }

  Future<void> _showDialog() async {
    if (!mounted || _dialogOpen) return;
    _dialogOpen = true;
    final controller = TextEditingController();
    try {
      await showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (dialogContext) => AlertDialog(
          title: Text(LocaleKeys.auth_new_password_title.tr()),
          content: TextField(
            controller: controller,
            obscureText: true,
            autofocus: true,
            decoration: InputDecoration(
              labelText: LocaleKeys.auth_password_label.tr(),
            ),
          ),
          actions: [
            FilledButton(
              onPressed: () async {
                if (controller.text.length < 6) return;
                try {
                  await ref
                      .read(authRepositoryProvider)
                      .updatePassword(controller.text);
                  if (dialogContext.mounted) Navigator.pop(dialogContext);
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(LocaleKeys.auth_password_updated.tr()),
                      ),
                    );
                  }
                } on AuthFailure catch (error) {
                  if (dialogContext.mounted) {
                    ScaffoldMessenger.of(
                      dialogContext,
                    ).showSnackBar(SnackBar(content: Text(error.message)));
                  }
                }
              },
              child: Text(LocaleKeys.auth_update_password.tr()),
            ),
          ],
        ),
      );
    } finally {
      controller.dispose();
      _dialogOpen = false;
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}

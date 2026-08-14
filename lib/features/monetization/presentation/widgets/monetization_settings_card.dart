import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flow_music/features/account/domain/repositories/auth_repository.dart';
import 'package:flow_music/features/account/presentation/providers/account_providers.dart';
import 'package:flow_music/features/monetization/domain/repositories/subscription_repository.dart';
import 'package:flow_music/features/monetization/presentation/providers/ad_providers.dart';
import 'package:flow_music/features/monetization/presentation/providers/monetization_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MonetizationSettingsCard extends ConsumerStatefulWidget {
  const MonetizationSettingsCard({super.key});

  @override
  ConsumerState<MonetizationSettingsCard> createState() =>
      _MonetizationSettingsCardState();
}

class _MonetizationSettingsCardState
    extends ConsumerState<MonetizationSettingsCard> {
  bool _busy = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final user = ref.watch(authUserProvider).value;
    final access = ref.watch(subscriptionAccessProvider).value;
    final offer = ref.watch(monthlySubscriptionOfferProvider).value;
    final authAvailable = ref.watch(authRepositoryProvider).isAvailable;
    final active = access?.isActive ?? false;
    final serviceAvailable =
        authAvailable && (access?.serviceAvailable ?? false);
    final price = offer?.priceLabel ?? r'$1';

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colors.primary.withValues(alpha: 0.2),
            colors.surfaceContainer,
          ],
        ),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: active ? colors.primary : colors.outlineVariant,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: colors.primary.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  active ? Icons.verified_rounded : Icons.hide_source_rounded,
                  color: colors.primary,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      active
                          ? LocaleKeys.premium_active_title.tr()
                          : LocaleKeys.remove_ads_title.tr(),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      active
                          ? LocaleKeys.premium_active_subtitle.tr()
                          : LocaleKeys.remove_ads_subtitle.tr(
                              namedArgs: {'price': price},
                            ),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              if (active)
                Chip(
                  avatar: const Icon(Icons.check_rounded, size: 17),
                  label: Text(LocaleKeys.premium_badge.tr()),
                ),
            ],
          ),
          if (user != null) ...[
            const SizedBox(height: 14),
            Text(
              user.email,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: colors.onSurfaceVariant),
            ),
          ],
          const SizedBox(height: 16),
          if (!serviceAvailable)
            Text(
              LocaleKeys.monetization_unavailable.tr(),
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: colors.onSurfaceVariant),
            )
          else
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                if (!active)
                  FilledButton.icon(
                    onPressed: _busy
                        ? null
                        : user == null
                        ? _showAccountSheet
                        : _purchase,
                    icon: _busy
                        ? const SizedBox.square(
                            dimension: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Icon(Icons.workspace_premium_rounded),
                    label: Text(
                      user == null
                          ? LocaleKeys.remove_ads_action.tr()
                          : LocaleKeys.subscribe_monthly_action.tr(
                              namedArgs: {'price': price},
                            ),
                    ),
                  ),
                if (user != null)
                  OutlinedButton(
                    onPressed: _busy ? null : _restore,
                    child: Text(LocaleKeys.restore_purchase.tr()),
                  ),
                if (user != null)
                  TextButton(
                    onPressed: _busy ? null : _signOut,
                    child: Text(LocaleKeys.auth_sign_out.tr()),
                  ),
                if (user != null)
                  TextButton(
                    onPressed: _busy ? null : _deleteAccount,
                    style: TextButton.styleFrom(foregroundColor: colors.error),
                    child: Text(LocaleKeys.auth_delete_account.tr()),
                  ),
              ],
            ),
          const _PrivacyOptionsButton(),
        ],
      ),
    );
  }

  Future<void> _showAccountSheet() {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) => const _AccountSheet(),
    );
  }

  Future<void> _purchase() async {
    setState(() => _busy = true);
    try {
      await ref.read(subscriptionActionsProvider).purchaseMonthly();
      if (mounted) _showMessage(LocaleKeys.subscription_success.tr());
    } on SubscriptionFailure catch (error) {
      if (mounted && !error.cancelled) _showMessage(error.message);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _restore() async {
    setState(() => _busy = true);
    try {
      final access = await ref.read(subscriptionActionsProvider).restore();
      if (mounted) {
        _showMessage(
          access.isActive
              ? LocaleKeys.restore_success.tr()
              : LocaleKeys.restore_empty.tr(),
        );
      }
    } on SubscriptionFailure catch (error) {
      if (mounted && !error.cancelled) _showMessage(error.message);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _signOut() async {
    setState(() => _busy = true);
    try {
      await ref.read(authRepositoryProvider).signOut();
    } on AuthFailure catch (error) {
      if (mounted) _showMessage(error.message);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _deleteAccount() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(LocaleKeys.auth_delete_account_title.tr()),
        content: Text(LocaleKeys.auth_delete_account_message.tr()),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: Text(LocaleKeys.cancel.tr()),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(dialogContext).colorScheme.error,
            ),
            onPressed: () => Navigator.pop(dialogContext, true),
            child: Text(LocaleKeys.delete.tr()),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) return;

    setState(() => _busy = true);
    try {
      await ref.read(authRepositoryProvider).deleteAccount();
      if (mounted) _showMessage(LocaleKeys.auth_account_deleted.tr());
    } on AuthFailure catch (error) {
      if (mounted) _showMessage(error.message);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }
}

class _PrivacyOptionsButton extends ConsumerWidget {
  const _PrivacyOptionsButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final required = ref.watch(privacyOptionsRequiredProvider).value;
    if (required != true) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: TextButton.icon(
        onPressed: () =>
            ref.read(adConsentRepositoryProvider).showPrivacyOptions(),
        icon: const Icon(Icons.privacy_tip_outlined),
        label: Text(LocaleKeys.ad_privacy_options.tr()),
      ),
    );
  }
}

class _AccountSheet extends ConsumerStatefulWidget {
  const _AccountSheet();

  @override
  ConsumerState<_AccountSheet> createState() => _AccountSheetState();
}

class _AccountSheetState extends ConsumerState<_AccountSheet> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _register = false;
  bool _busy = false;
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 4, 20, 20 + bottomInset),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                _register
                    ? LocaleKeys.auth_register_title.tr()
                    : LocaleKeys.auth_sign_in_title.tr(),
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                LocaleKeys.account_subscription_reason.tr(),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 18),
              SegmentedButton<bool>(
                segments: [
                  ButtonSegment(
                    value: false,
                    label: Text(LocaleKeys.auth_sign_in_tab.tr()),
                  ),
                  ButtonSegment(
                    value: true,
                    label: Text(LocaleKeys.auth_register_tab.tr()),
                  ),
                ],
                selected: {_register},
                onSelectionChanged: _busy
                    ? null
                    : (selection) =>
                          setState(() => _register = selection.single),
              ),
              const SizedBox(height: 16),
              if (_register) ...[
                TextFormField(
                  controller: _nameController,
                  textInputAction: TextInputAction.next,
                  autofillHints: const [AutofillHints.name],
                  decoration: InputDecoration(
                    labelText: LocaleKeys.auth_name_label.tr(),
                    prefixIcon: const Icon(Icons.person_outline_rounded),
                  ),
                ),
                const SizedBox(height: 12),
              ],
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                autofillHints: const [AutofillHints.email],
                decoration: InputDecoration(
                  labelText: LocaleKeys.auth_email_label.tr(),
                  prefixIcon: const Icon(Icons.email_outlined),
                ),
                validator: _validateEmail,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                textInputAction: TextInputAction.done,
                autofillHints: [
                  _register
                      ? AutofillHints.newPassword
                      : AutofillHints.password,
                ],
                decoration: InputDecoration(
                  labelText: LocaleKeys.auth_password_label.tr(),
                  prefixIcon: const Icon(Icons.lock_outline_rounded),
                  suffixIcon: IconButton(
                    onPressed: () =>
                        setState(() => _obscurePassword = !_obscurePassword),
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                  ),
                ),
                validator: _validatePassword,
                onFieldSubmitted: (_) => _submit(),
              ),
              if (!_register)
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: _busy ? null : _resetPassword,
                    child: Text(LocaleKeys.auth_forgot_password.tr()),
                  ),
                )
              else
                const SizedBox(height: 16),
              FilledButton(
                onPressed: _busy ? null : _submit,
                child: _busy
                    ? const SizedBox.square(
                        dimension: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Text(
                        _register
                            ? LocaleKeys.auth_create_account.tr()
                            : LocaleKeys.auth_sign_in_button.tr(),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? _validateEmail(String? value) {
    final email = value?.trim() ?? '';
    if (email.isEmpty || !email.contains('@') || !email.contains('.')) {
      return LocaleKeys.auth_invalid_email.tr();
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if ((value ?? '').length < 6) {
      return LocaleKeys.auth_password_too_short.tr();
    }
    return null;
  }

  Future<void> _submit() async {
    if (_busy || !(_formKey.currentState?.validate() ?? false)) return;
    setState(() => _busy = true);
    final repository = ref.read(authRepositoryProvider);
    try {
      if (_register) {
        final result = await repository.signUp(
          email: _emailController.text,
          password: _passwordController.text,
          displayName: _nameController.text,
        );
        if (!mounted) return;
        Navigator.of(context).pop();
        _showMessage(
          result.requiresConfirmation
              ? LocaleKeys.auth_confirmation_sent.tr()
              : LocaleKeys.auth_account_created.tr(),
        );
      } else {
        await repository.signIn(
          email: _emailController.text,
          password: _passwordController.text,
        );
        if (mounted) Navigator.of(context).pop();
      }
    } on AuthFailure catch (error) {
      if (mounted) _showMessage(error.message);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _resetPassword() async {
    final emailError = _validateEmail(_emailController.text);
    if (emailError != null) {
      _showMessage(emailError);
      return;
    }
    setState(() => _busy = true);
    try {
      await ref
          .read(authRepositoryProvider)
          .sendPasswordReset(_emailController.text);
      if (mounted) {
        _showMessage(LocaleKeys.auth_password_reset_sent.tr());
      }
    } on AuthFailure catch (error) {
      if (mounted) _showMessage(error.message);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

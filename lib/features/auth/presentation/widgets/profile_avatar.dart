import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flow_music/features/auth/presentation/notifiers/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Avatar circular del usuario para la app bar. Se comporta como atajo de
/// sesion:
///
/// - Sin sesion (anonimo) -> muestra las siglas `AN` y al tocar navega a
///   `/login`.
/// - Sesion con foto -> renderiza la foto remota.
/// - Sesion sin foto -> dos iniciales (primer letra de nombre + primer
///   letra del apellido, o las dos primeras letras del nombre).
///
/// Si hay sesion, al tocar abre un menu compacto con la opcion de cerrar
/// sesion. La configuracion vive en el drawer, asi que el avatar deja de
/// duplicar ese atajo.
class ProfileAvatar extends ConsumerWidget {
  const ProfileAvatar({super.key, this.size = 40});

  final double size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final user = ref.watch(authProvider).asData?.value;

    final isAnonymous = user == null || user.isAnonymous;
    final photoUrl = user?.photoUrl;
    final hasPhoto = !isAnonymous && photoUrl != null && photoUrl.isNotEmpty;
    final initials = _initialsFor(user?.displayName, user?.email);
    final canOpenAdminDashboard = user?.canAccessLocationDashboard == true;

    // Marca StreamBeat: el avatar es un circulo verde solido con iniciales
    // blancas (igual al diseno, incluido el estado anonimo "AN"). Las fotos
    // llevan un anillo verde sobre una superficie interna.
    final Widget inner;
    if (hasPhoto) {
      inner = ClipOval(
        child: Image.network(
          photoUrl,
          width: size,
          height: size,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) =>
              _InitialsLabel(text: initials, color: Colors.white),
        ),
      );
    } else {
      inner = _InitialsLabel(
        text: isAnonymous ? 'AN' : initials,
        color: Colors.white,
      );
    }

    final decoration = BoxDecoration(
      shape: BoxShape.circle,
      color: colors.primary,
      boxShadow: [
        BoxShadow(
          color: colors.primary.withValues(alpha: 0.4),
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ],
    );

    final padding = hasPhoto ? const EdgeInsets.all(2) : EdgeInsets.zero;

    return Tooltip(
      message: isAnonymous ? 'AN' : user.displayName ?? user.email ?? 'AN',
      child: Material(
        color: Colors.transparent,
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => _handleTap(context, ref, isAnonymous: isAnonymous),
          onLongPress: canOpenAdminDashboard
              ? () => _openAdminDashboard(context, ref)
              : null,
          child: Container(
            width: size,
            height: size,
            padding: padding,
            decoration: decoration,
            alignment: Alignment.center,
            child: hasPhoto
                ? DecoratedBox(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colors.surface,
                    ),
                    child: inner,
                  )
                : inner,
          ),
        ),
      ),
    );
  }

  Future<void> _handleTap(
    BuildContext context,
    WidgetRef ref, {
    required bool isAnonymous,
  }) async {
    if (isAnonymous) {
      context.go('/login');
      return;
    }
    await _showSignOutSheet(context, ref);
  }

  Future<void> _showSignOutSheet(BuildContext context, WidgetRef ref) async {
    await showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (ctx) {
        final theme = Theme.of(ctx);
        final colors = theme.colorScheme;
        final user = ref.read(authProvider).asData?.value;
        final displayName = user?.displayName?.trim();
        final email = user?.email?.trim();
        final hasDisplayName = displayName != null && displayName.isNotEmpty;
        final hasEmail = email != null && email.isNotEmpty;
        final accountLabel = hasDisplayName ? displayName : email;

        return SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.auth_sign_out_title.tr(),
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  LocaleKeys.auth_sign_out_message.tr(),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colors.onSurfaceVariant,
                    height: 1.35,
                  ),
                ),
                if (hasDisplayName || hasEmail) ...[
                  const SizedBox(height: 18),
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: colors.surfaceContainerHighest.withValues(
                        alpha: 0.55,
                      ),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: colors.outlineVariant),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: colors.primary.withValues(
                            alpha: 0.16,
                          ),
                          child: Text(
                            _initialsFor(displayName, email),
                            style: theme.textTheme.labelLarge?.copyWith(
                              color: colors.primary,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                LocaleKeys.auth_account_title.tr(),
                                style: theme.textTheme.labelMedium?.copyWith(
                                  color: colors.onSurfaceVariant,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                accountLabel!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              if (hasDisplayName && hasEmail) ...[
                                const SizedBox(height: 2),
                                Text(
                                  email,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: colors.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                const SizedBox(height: 18),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.logout_rounded),
                  title: Text(LocaleKeys.auth_sign_out.tr()),
                  subtitle: Text(LocaleKeys.auth_sign_out_action_hint.tr()),
                  onTap: () async {
                    Navigator.of(ctx).pop();
                    await ref.read(authProvider.notifier).signOut();
                    if (context.mounted) {
                      context.go('/home');
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _openAdminDashboard(BuildContext context, WidgetRef ref) async {
    final user = await ref.read(authProvider.notifier).refreshCurrentUser();
    if (!context.mounted) return;
    if (user?.canAccessLocationDashboard == true) {
      context.go('/admin/locations');
    }
  }

  String _initialsFor(String? displayName, String? email) {
    final name = displayName?.trim() ?? '';
    if (name.isNotEmpty) {
      final parts = name.split(RegExp(r'\s+'));
      if (parts.length >= 2 && parts[1].isNotEmpty) {
        return '${parts.first[0]}${parts[1][0]}'.toUpperCase();
      }
      final solo = parts.first;
      return solo.length >= 2
          ? solo.substring(0, 2).toUpperCase()
          : solo[0].toUpperCase();
    }

    final mail = email?.trim() ?? '';
    if (mail.isEmpty) return 'AN';
    final local = mail.split('@').first;
    if (local.length >= 2) return local.substring(0, 2).toUpperCase();
    if (local.isNotEmpty) return local[0].toUpperCase();
    return 'AN';
  }
}

class _InitialsLabel extends StatelessWidget {
  const _InitialsLabel({required this.text, required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleSmall?.copyWith(
        color: color,
        fontWeight: FontWeight.w800,
        letterSpacing: 0.4,
      ),
    );
  }
}

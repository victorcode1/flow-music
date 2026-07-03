import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flow_music/shared/custom_info_version/provider/info_version.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Muestra version y numero de build leidos desde `infoVersionProvider`.
///
/// Hereda colores del tema para conservar contraste en light y dark.
class CustomInfoVersion extends ConsumerWidget {
  const CustomInfoVersion({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final info = ref.watch(infoVersionProvider);
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.bodySmall?.copyWith(
      fontWeight: FontWeight.w300,
      color: theme.colorScheme.onSurfaceVariant,
    );

    return Center(
      child: Column(
        children: [
          Text(LocaleKeys.info_version.tr(), style: textStyle),
          Text(info.version, style: textStyle),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(LocaleKeys.build_number.tr(), style: textStyle),
              const SizedBox(width: 5),
              Text(info.buildNumber.toString(), style: textStyle),
            ],
          ),
        ],
      ),
    );
  }
}

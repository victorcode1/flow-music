import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flow_music/pages/shared/custom_info_version/provider/info_version.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomInfoVersion extends ConsumerWidget {
  const CustomInfoVersion({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final info = ref.read(infoVersionProvider);
    return Center(
      child: Column(
        children: [
          Text(
            LocaleKeys.info_version.tr(),
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300,
              color: Colors.black54,
            ),
          ),
          Text(
            info.version,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300,
              color: Colors.black54,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                LocaleKeys.build_number.tr(),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                info.buildNumber.toString(),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

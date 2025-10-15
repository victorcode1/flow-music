import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/core/utils/locale_keys.g.dart';
import 'package:flutter/material.dart';

class Primer extends StatefulWidget {
  const Primer({super.key});

  @override
  State<Primer> createState() => _PrimerState();
}

class _PrimerState extends State<Primer> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(LocaleKeys.first.tr()));
  }
}

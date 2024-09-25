import 'package:flow_music/controller/main_controller.dart';
import 'package:flow_music/core/sources.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RadioContent extends ConsumerStatefulWidget {
  const RadioContent({super.key});

  @override
  ConsumerState<RadioContent> createState() => _RadioContentState();
}

class _RadioContentState extends ConsumerState<RadioContent> {
  @override
  void initState() {
    super.initState();
    ref
        .read(mainController)
        .playRadio(source: UrlSource('https://ic.streann.com/wao'));
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Radio content'),
    );
  }
}

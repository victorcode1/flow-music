import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LateralList extends ConsumerWidget {
  const LateralList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
            child: TextButton(
                onPressed: () {
                  if (context.canPop()) context.pop();
                  context.go('/radio');
                },
                child: const RotatedBox(quarterTurns: 3, child: Text('Radio'))),
          ),
          const SizedBox(
            height: 100,
            child: TextButton(
              onPressed: null,
              child: RotatedBox(
                  quarterTurns: 3,
                  child: SizedBox(height: 100, child: Text('Home Page'))),
            ),
          ),
          const SizedBox(
            height: 100,
            child: TextButton(
              onPressed: null,
              child: RotatedBox(quarterTurns: 3, child: Text('Home Page')),
            ),
          ),
        ],
      ),
    );
  }
}

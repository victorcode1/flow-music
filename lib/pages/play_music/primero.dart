import 'package:flutter/material.dart';

class Primer extends StatefulWidget {
  const Primer({super.key});

  @override
  State<Primer> createState() => _PrimerState();
}

class _PrimerState extends State<Primer> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Primer'));
  }
}

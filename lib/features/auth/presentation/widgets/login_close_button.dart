import 'package:flutter/material.dart';

class LoginCloseButton extends StatelessWidget {
  const LoginCloseButton({
    super.key,
    required this.isSubmitting,
    required this.onPressed,
  });

  final bool isSubmitting;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 4,
      left: 4,
      child: IconButton.filledTonal(
        onPressed: isSubmitting ? null : onPressed,
        icon: const Icon(Icons.close_rounded),
        tooltip: MaterialLocalizations.of(context).closeButtonTooltip,
      ),
    );
  }
}

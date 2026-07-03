import 'package:flow_music/features/settings/presentation/controllers/accent_color_controller.dart';
import 'package:flutter/material.dart';

/// Cuadricula responsive de muestras de color de acento.
class AccentColorPalette extends StatelessWidget {
  const AccentColorPalette({
    super.key,
    required this.current,
    required this.onSelected,
    this.minSwatchSize = 52,
    this.maxSwatchSize = 64,
    this.spacing = 12,
  });

  final FlowAccent current;
  final ValueChanged<FlowAccent> onSelected;
  final double minSwatchSize;
  final double maxSwatchSize;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth.isFinite
            ? constraints.maxWidth
            : 360.0;
        final columnCount = ((width + spacing) / (minSwatchSize + spacing))
            .floor()
            .clamp(3, FlowAccent.values.length);
        final swatchSize = ((width - spacing * (columnCount - 1)) / columnCount)
            .clamp(minSwatchSize, maxSwatchSize)
            .toDouble();

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: [
            for (final accent in FlowAccent.values)
              SizedBox.square(
                dimension: swatchSize,
                child: _AccentSwatch(
                  accent: accent,
                  selected: current == accent,
                  onTap: () => onSelected(accent),
                ),
              ),
          ],
        );
      },
    );
  }
}

class _AccentSwatch extends StatelessWidget {
  const _AccentSwatch({
    required this.accent,
    required this.selected,
    required this.onTap,
  });

  final FlowAccent accent;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: accent.color,
          borderRadius: BorderRadius.circular(16),
          border: selected
              ? Border.all(color: colors.onSurface, width: 2.5)
              : null,
          boxShadow: [
            BoxShadow(
              color: accent.color.withValues(alpha: 0.36),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: selected
            ? const Icon(Icons.check_rounded, color: Colors.white, size: 22)
            : null,
      ),
    );
  }
}

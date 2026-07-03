import 'dart:math';

import 'package:flutter/material.dart';

class ParticlesFly extends StatefulWidget {
  const ParticlesFly({
    super.key,
    required this.child,
    this.numberOfParticles = 90,
    this.speedOfParticles = 0.35,
    this.maxParticleSize = 2.2,
    this.connectDots = true,
    this.paused = false,
    this.intensity = 1,
  });

  final Widget child;
  final int numberOfParticles;
  final double speedOfParticles;
  final double maxParticleSize;
  final bool connectDots;
  final bool paused;
  final double intensity;

  @override
  State<ParticlesFly> createState() => _ParticlesFlyState();
}

class _ParticlesFlyState extends State<ParticlesFly>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final _random = Random(42);
  final List<Offset> _offsets = [];
  final List<Offset> _directions = [];
  final List<double> _sizes = [];
  Size _lastSize = Size.zero;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 16),
    )..addListener(_tick);

    if (!widget.paused) _controller.repeat();
  }

  @override
  void didUpdateWidget(covariant ParticlesFly oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.numberOfParticles != widget.numberOfParticles) {
      _resetParticles(_lastSize);
    }

    if (oldWidget.paused != widget.paused) {
      if (widget.paused) {
        _controller.stop();
      } else if (!_controller.isAnimating) {
        _controller.repeat();
      }
    }
  }

  @override
  void dispose() {
    _controller
      ..removeListener(_tick)
      ..dispose();
    super.dispose();
  }

  void _resetParticles(Size size) {
    _offsets.clear();
    _directions.clear();
    _sizes.clear();

    if (size.isEmpty) return;

    for (var i = 0; i < widget.numberOfParticles; i++) {
      _offsets.add(
        Offset(
          _random.nextDouble() * size.width,
          _random.nextDouble() * size.height,
        ),
      );
      final angle = _random.nextDouble() * pi * 2;
      final speed = 0.25 + _random.nextDouble() * 0.75;
      _directions.add(Offset(cos(angle) * speed, sin(angle) * speed));
      _sizes.add(0.35 + _random.nextDouble());
    }
  }

  void _tick() {
    if (_lastSize.isEmpty || _offsets.isEmpty) return;

    for (var i = 0; i < _offsets.length; i++) {
      final direction = _directions[i] * widget.speedOfParticles;
      var next = _offsets[i] + direction;
      var nextDirection = _directions[i];

      if (next.dx < 0 || next.dx > _lastSize.width) {
        nextDirection = Offset(-nextDirection.dx, nextDirection.dy);
        next = Offset(next.dx.clamp(0, _lastSize.width), next.dy);
      }

      if (next.dy < 0 || next.dy > _lastSize.height) {
        nextDirection = Offset(nextDirection.dx, -nextDirection.dy);
        next = Offset(next.dx, next.dy.clamp(0, _lastSize.height));
      }

      _offsets[i] = next;
      _directions[i] = nextDirection;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final intensity = widget.intensity.clamp(0.4, 2.2);

    return LayoutBuilder(
      builder: (context, constraints) {
        final size = Size(constraints.maxWidth, constraints.maxHeight);
        if (size != _lastSize || _offsets.length != widget.numberOfParticles) {
          _lastSize = size;
          _resetParticles(size);
        }

        return Stack(
          fit: StackFit.expand,
          children: [
            CustomPaint(
              painter: _ParticlesPainter(
                offsets: _offsets,
                sizes: _sizes,
                maxParticleSize: widget.maxParticleSize,
                connectDots: widget.connectDots,
                particleColor: isDark
                    ? colors.primary.withValues(alpha: 0.62 * intensity)
                    : colors.primary.withValues(alpha: 0.54 * intensity),
                accentColor: isDark
                    ? colors.tertiary.withValues(alpha: 0.36 * intensity)
                    : colors.secondary.withValues(alpha: 0.28 * intensity),
                lineColor: colors.primary.withValues(
                  alpha: (isDark ? 0.16 : 0.12) * intensity,
                ),
                starColor: isDark
                    ? colors.onSurface.withValues(alpha: 0.16 * intensity)
                    : colors.primary.withValues(alpha: 0.14 * intensity),
              ),
            ),
            widget.child,
          ],
        );
      },
    );
  }
}

class _ParticlesPainter extends CustomPainter {
  const _ParticlesPainter({
    required this.offsets,
    required this.sizes,
    required this.maxParticleSize,
    required this.connectDots,
    required this.particleColor,
    required this.accentColor,
    required this.lineColor,
    required this.starColor,
  });

  final List<Offset> offsets;
  final List<double> sizes;
  final double maxParticleSize;
  final bool connectDots;
  final Color particleColor;
  final Color accentColor;
  final Color lineColor;
  final Color starColor;

  @override
  void paint(Canvas canvas, Size size) {
    final starPaint = Paint()
      ..color = starColor
      ..isAntiAlias = true;
    final random = Random(7);
    final starCount = (size.width * size.height * 0.00005)
        .clamp(22, 80)
        .toInt();

    for (var i = 0; i < starCount; i++) {
      canvas.drawCircle(
        Offset(
          random.nextDouble() * size.width,
          random.nextDouble() * size.height,
        ),
        0.35 + random.nextDouble() * 0.85,
        starPaint,
      );
    }

    if (connectDots) {
      _drawLines(canvas);
    }

    for (var i = 0; i < offsets.length; i++) {
      final radius = maxParticleSize * sizes[i];
      final color = i.isEven ? particleColor : accentColor;
      final glowPaint = Paint()
        ..color = color.withValues(alpha: 0.18)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 7)
        ..isAntiAlias = true;
      final particlePaint = Paint()
        ..shader =
            RadialGradient(
              center: const Alignment(-0.45, -0.45),
              colors: [
                Colors.white.withValues(alpha: 0.72),
                color,
                color.withValues(alpha: 0.08),
              ],
              stops: const [0.0, 0.34, 1.0],
            ).createShader(
              Rect.fromCircle(center: offsets[i], radius: radius * 2.2),
            )
        ..isAntiAlias = true;

      canvas.drawCircle(offsets[i], radius * 2.3, glowPaint);
      canvas.drawCircle(offsets[i], radius, particlePaint);
    }
  }

  void _drawLines(Canvas canvas) {
    const maxDistance = 74.0;

    for (var i = 0; i < offsets.length; i++) {
      for (var j = i + 1; j < offsets.length; j++) {
        final distance = (offsets[i] - offsets[j]).distance;
        if (distance > maxDistance) continue;

        final opacity = ((maxDistance - distance) / maxDistance).clamp(
          0.0,
          1.0,
        );
        final paint = Paint()
          ..color = lineColor.withValues(alpha: lineColor.a * opacity)
          ..strokeWidth = 0.55
          ..strokeCap = StrokeCap.round
          ..isAntiAlias = true;

        canvas.drawLine(offsets[i], offsets[j], paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _ParticlesPainter oldDelegate) {
    return oldDelegate.offsets != offsets ||
        oldDelegate.sizes != sizes ||
        oldDelegate.particleColor != particleColor ||
        oldDelegate.accentColor != accentColor ||
        oldDelegate.lineColor != lineColor ||
        oldDelegate.starColor != starColor;
  }
}

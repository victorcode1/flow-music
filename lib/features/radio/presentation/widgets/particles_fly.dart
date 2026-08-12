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
  Duration? _lastElapsed;
  int _particleGeneration = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 16),
    )..addListener(_advanceParticles);

    if (!widget.paused) _controller.repeat();
  }

  @override
  void didUpdateWidget(covariant ParticlesFly oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.numberOfParticles != widget.numberOfParticles) {
      _resetParticles(_lastSize);
    }

    if (oldWidget.paused != widget.paused) {
      _lastElapsed = null;
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
      ..removeListener(_advanceParticles)
      ..dispose();
    super.dispose();
  }

  void _resetParticles(Size size) {
    _offsets.clear();
    _directions.clear();
    _sizes.clear();
    _lastElapsed = null;
    _particleGeneration++;

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

  void _advanceParticles() {
    if (_lastSize.isEmpty || _offsets.isEmpty) return;

    final elapsed = _controller.lastElapsedDuration;
    final previousElapsed = _lastElapsed;
    _lastElapsed = elapsed;
    if (elapsed == null || previousElapsed == null) return;

    // Match the original speed at 60 fps while keeping movement consistent on
    // 90/120 Hz displays. Clamping avoids a large jump after the app resumes.
    final frameScale = ((elapsed - previousElapsed).inMicroseconds / 16666.67)
        .clamp(0.0, 2.0);

    for (var i = 0; i < _offsets.length; i++) {
      final direction = _directions[i] * widget.speedOfParticles * frameScale;
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
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final intensity = widget.intensity.clamp(0.4, 2.2);
    double alpha(double value) => (value * intensity).clamp(0.0, 1.0);

    final particleColor = isDark
        ? colors.primary.withValues(alpha: alpha(0.62))
        : colors.primary.withValues(alpha: alpha(0.54));
    final accentColor = isDark
        ? colors.tertiary.withValues(alpha: alpha(0.36))
        : colors.secondary.withValues(alpha: alpha(0.28));
    final lineColor = colors.primary.withValues(
      alpha: alpha(isDark ? 0.16 : 0.12),
    );
    final starColor = isDark
        ? colors.onSurface.withValues(alpha: alpha(0.16))
        : colors.primary.withValues(alpha: alpha(0.14));

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
            RepaintBoundary(
              child: CustomPaint(
                isComplex: true,
                painter: _StarsPainter(color: starColor),
              ),
            ),
            RepaintBoundary(
              child: CustomPaint(
                isComplex: true,
                willChange: !widget.paused,
                painter: _ParticlesPainter(
                  repaint: _controller,
                  offsets: _offsets,
                  sizes: _sizes,
                  particleGeneration: _particleGeneration,
                  maxParticleSize: widget.maxParticleSize,
                  connectDots: widget.connectDots,
                  particleColor: particleColor,
                  accentColor: accentColor,
                  lineColor: lineColor,
                ),
              ),
            ),
            RepaintBoundary(child: widget.child),
          ],
        );
      },
    );
  }
}

class _StarsPainter extends CustomPainter {
  const _StarsPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
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
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _StarsPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

class _ParticlesPainter extends CustomPainter {
  _ParticlesPainter({
    required Listenable repaint,
    required this.offsets,
    required this.sizes,
    required this.particleGeneration,
    required this.maxParticleSize,
    required this.connectDots,
    required this.particleColor,
    required this.accentColor,
    required this.lineColor,
  }) : _primaryPaints = _GlowPaints(particleColor),
       _accentPaints = _GlowPaints(accentColor),
       _linePaint = (Paint()
         ..strokeWidth = 0.55
         ..strokeCap = StrokeCap.round
         ..isAntiAlias = true),
       super(repaint: repaint);

  final List<Offset> offsets;
  final List<double> sizes;
  final int particleGeneration;
  final double maxParticleSize;
  final bool connectDots;
  final Color particleColor;
  final Color accentColor;
  final Color lineColor;
  final _GlowPaints _primaryPaints;
  final _GlowPaints _accentPaints;
  final Paint _linePaint;

  @override
  void paint(Canvas canvas, Size size) {
    if (connectDots) _drawLines(canvas);

    for (var i = 0; i < offsets.length; i++) {
      final radius = maxParticleSize * sizes[i];
      final paints = i.isEven ? _primaryPaints : _accentPaints;
      final center = offsets[i];

      // Several inexpensive translucent circles retain the soft luminous
      // appearance without allocating a blur and radial shader per particle.
      canvas.drawCircle(center, radius * 2.3, paints.outerGlow);
      canvas.drawCircle(center, radius * 1.45, paints.innerGlow);
      canvas.drawCircle(center, radius, paints.core);
      canvas.drawCircle(
        center.translate(-radius * 0.26, -radius * 0.26),
        max(0.28, radius * 0.3),
        paints.highlight,
      );
    }
  }

  void _drawLines(Canvas canvas) {
    const maxDistance = 74.0;
    const maxDistanceSquared = maxDistance * maxDistance;

    for (var i = 0; i < offsets.length; i++) {
      for (var j = i + 1; j < offsets.length; j++) {
        final delta = offsets[i] - offsets[j];
        final distanceSquared = delta.dx * delta.dx + delta.dy * delta.dy;
        if (distanceSquared > maxDistanceSquared) continue;

        final distance = sqrt(distanceSquared);
        final opacity = ((maxDistance - distance) / maxDistance).clamp(
          0.0,
          1.0,
        );
        _linePaint.color = lineColor.withValues(alpha: lineColor.a * opacity);
        canvas.drawLine(offsets[i], offsets[j], _linePaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _ParticlesPainter oldDelegate) {
    return oldDelegate.offsets != offsets ||
        oldDelegate.sizes != sizes ||
        oldDelegate.particleGeneration != particleGeneration ||
        oldDelegate.maxParticleSize != maxParticleSize ||
        oldDelegate.connectDots != connectDots ||
        oldDelegate.particleColor != particleColor ||
        oldDelegate.accentColor != accentColor ||
        oldDelegate.lineColor != lineColor;
  }
}

class _GlowPaints {
  _GlowPaints(Color color)
    : outerGlow = Paint()
        ..color = color.withValues(alpha: color.a * 0.14)
        ..isAntiAlias = true,
      innerGlow = Paint()
        ..color = color.withValues(alpha: color.a * 0.34)
        ..isAntiAlias = true,
      core = Paint()
        ..color = color
        ..isAntiAlias = true,
      highlight = Paint()
        ..color = Colors.white.withValues(
          alpha: (0.38 + color.a * 0.34).clamp(0.0, 0.72),
        )
        ..isAntiAlias = true;

  final Paint outerGlow;
  final Paint innerGlow;
  final Paint core;
  final Paint highlight;
}

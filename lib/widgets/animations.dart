import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// Entry animation widget with fade and slide
/// Wrapped in RepaintBoundary for better performance
class FadeSlideIn extends StatelessWidget {
  final Widget child;
  final Duration delay;
  final Duration duration;
  final Offset beginOffset;

  const FadeSlideIn({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 400),
    this.beginOffset = const Offset(0, 0.2),
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: child
          .animate(delay: delay)
          .fadeIn(duration: duration)
          .slideY(begin: beginOffset.dy, end: 0, duration: duration),
    );
  }
}

/// Bounce animation for correct answers
/// Wrapped in RepaintBoundary for better performance
class BounceIn extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final Curve curve;

  const BounceIn({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.elasticOut,
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: child
          .animate()
          .scale(
            begin: const Offset(0.8, 0.8),
            end: const Offset(1, 1),
            duration: duration,
            curve: curve,
          )
          .fadeIn(duration: const Duration(milliseconds: 200)),
    );
  }
}

/// Shake animation for wrong answers
class ShakeWidget extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double shakeOffset;
  final bool animate;

  const ShakeWidget({
    super.key,
    required this.child,
    required this.animate,
    this.duration = const Duration(milliseconds: 500),
    this.shakeOffset = 10,
  });

  @override
  State<ShakeWidget> createState() => _ShakeWidgetState();
}

class _ShakeWidgetState extends State<ShakeWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticIn),
    );
  }

  @override
  void didUpdateWidget(ShakeWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.animate && !oldWidget.animate) {
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double _shake(double progress) {
    return (progress < 0.5
            ? progress * 2
            : (1 - progress) * 2) *
        widget.shakeOffset *
        (progress < 0.5 ? 1 : -1);
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(_shake(_animation.value), 0),
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }
}

/// Animated counter text
class CountUpText extends StatefulWidget {
  final int value;
  final TextStyle? style;
  final Duration duration;

  const CountUpText({
    super.key,
    required this.value,
    this.style,
    this.duration = const Duration(milliseconds: 800),
  });

  @override
  State<CountUpText> createState() => _CountUpTextState();
}

class _CountUpTextState extends State<CountUpText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;
  int _previousValue = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _setupAnimation(_previousValue, widget.value);
    _controller.forward();
  }

  void _setupAnimation(int from, int to) {
    _animation = IntTween(begin: from, end: to).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );
  }

  @override
  void didUpdateWidget(CountUpText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _previousValue = oldWidget.value;
      _setupAnimation(oldWidget.value, widget.value);
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Text(
          '${_animation.value}',
          style: widget.style,
        );
      },
    );
  }
}

/// Pulse animation widget for active states
/// Wrapped in RepaintBoundary for better performance
class PulseWidget extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final double minScale;
  final double maxScale;

  const PulseWidget({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 1500),
    this.minScale = 0.95,
    this.maxScale = 1.05,
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: child
          .animate(onPlay: (controller) => controller.repeat())
          .scale(
            begin: Offset(minScale, minScale),
            end: Offset(maxScale, maxScale),
            duration: duration,
            curve: Curves.easeInOut,
          )
          .then()
          .scale(
            begin: Offset(maxScale, maxScale),
            end: Offset(minScale, minScale),
            duration: duration,
            curve: Curves.easeInOut,
          ),
    );
  }
}

/// Staggered list animation builder
/// Uses RepaintBoundary to isolate repaints
class StaggeredListItem extends StatelessWidget {
  final int index;
  final Widget child;
  final Duration baseDelay;
  final Duration staggerDelay;

  const StaggeredListItem({
    super.key,
    required this.index,
    required this.child,
    this.baseDelay = const Duration(milliseconds: 100),
    this.staggerDelay = const Duration(milliseconds: 50),
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: child
          .animate(delay: baseDelay + (staggerDelay * index))
          .fadeIn(duration: const Duration(milliseconds: 300))
          .slideY(begin: 0.2, end: 0, duration: const Duration(milliseconds: 300)),
    );
  }
}

/// Animated gradient progress bar
/// Uses RepaintBoundary for better performance
class AnimatedProgressBar extends StatelessWidget {
  final double progress;
  final Color? backgroundColor;
  final List<Color>? gradientColors;
  final double height;
  final Duration animationDuration;

  const AnimatedProgressBar({
    super.key,
    required this.progress,
    this.backgroundColor,
    this.gradientColors,
    this.height = 8,
    this.animationDuration = const Duration(milliseconds: 600),
  });

  @override
  Widget build(BuildContext context) {
    const defaultColors = [Color(0xFF6C63FF), Color(0xFF00C853)];
    final colors = gradientColors ?? defaultColors;

    return RepaintBoundary(
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.grey.shade200,
          borderRadius: BorderRadius.circular(height / 2),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                AnimatedContainer(
                  duration: animationDuration,
                  curve: Curves.easeOutCubic,
                  width: constraints.maxWidth * progress.clamp(0, 1),
                  height: height,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: colors),
                    borderRadius: BorderRadius.circular(height / 2),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

/// Scale on tap feedback
class TapScale extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double pressedScale;

  const TapScale({
    super.key,
    required this.child,
    this.onTap,
    this.pressedScale = 0.95,
  });

  @override
  State<TapScale> createState() => _TapScaleState();
}

class _TapScaleState extends State<TapScale> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onTap?.call();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: RepaintBoundary(
        child: AnimatedScale(
          scale: _isPressed ? widget.pressedScale : 1,
          duration: const Duration(milliseconds: 100),
          child: widget.child,
        ),
      ),
    );
  }
}

/// Glow effect wrapper
class GlowBox extends StatelessWidget {
  final Widget child;
  final Color glowColor;
  final double blurRadius;
  final double borderRadius;

  const GlowBox({
    super.key,
    required this.child,
    this.glowColor = const Color(0xFF6C63FF),
    this.blurRadius = 20,
    this.borderRadius = 16,
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            BoxShadow(
              color: glowColor.withValues(alpha: 0.3),
              blurRadius: blurRadius,
              spreadRadius: 2,
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
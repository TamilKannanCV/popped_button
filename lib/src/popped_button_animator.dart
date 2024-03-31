import 'package:flutter/material.dart';
import 'package:popped_button/src/popped_button_painter.dart';

class PoppedButtonAnimator extends StatefulWidget {
  const PoppedButtonAnimator({
    super.key,
    required this.child,
    required this.depth,
    required this.color,
    this.onPressed,
  });
  final Widget child;
  final double depth;
  final Color color;
  final VoidCallback? onPressed;

  @override
  State<PoppedButtonAnimator> createState() => _PoppedButtonAnimatorState();
}

class _PoppedButtonAnimatorState extends State<PoppedButtonAnimator> with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      lowerBound: 0,
      upperBound: 1,
      duration: const Duration(milliseconds: 100),
      reverseDuration: const Duration(milliseconds: 100),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        controller.forward();
      },
      onTapUp: (details) {
        if (controller.isCompleted) {
          controller.reverse().whenComplete(() => widget.onPressed?.call());
        } else {
          controller.forward().whenComplete(() {
            controller.reverse().whenComplete(() => widget.onPressed?.call());
          });
        }
      },
      onTapCancel: controller.reverse,
      onLongPressCancel: controller.reverse,
      onLongPress: () {
        controller.forward();
      },
      onLongPressEnd: (details) {
        if (controller.isCompleted) {
          controller.reverse().whenComplete(() => widget.onPressed?.call());
        } else {
          controller.forward().whenComplete(() => controller.reverse().whenComplete(() => widget.onPressed?.call()));
        }
      },
      child: AnimatedBuilder(
        builder: (context, value) {
          final depth = widget.depth * controller.value;
          return Transform.translate(
            offset: Offset(depth, depth),
            child: CustomPaint(
              isComplex: true,
              painter: PoppedButtonPainter(
                backgroundColor: widget.color,
                depth: widget.depth,
              ),
              child: widget.child,
            ),
          );
        },
        animation: controller,
      ),
    );
  }
}

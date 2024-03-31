import 'package:flutter/material.dart';
import 'package:popped_button/src/popped_button_animator.dart';
import 'package:popped_button/src/popped_button_clipper.dart';

class PoppedButton extends StatelessWidget {
  const PoppedButton({
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
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: ClipPath(
        clipper: PoppedButtonClipper(depth: depth),
        child: PoppedButtonAnimator(
          depth: depth,
          color: color,
          onPressed: onPressed,
          child: child,
        ),
      ),
    );
  }
}

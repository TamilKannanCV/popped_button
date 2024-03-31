import 'package:flutter/material.dart';

class PoppedButtonPainter extends CustomPainter {
  final Color backgroundColor;
  final double depth;
  PoppedButtonPainter({
    super.repaint,
    required this.backgroundColor,
    required this.depth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final h = size.height;
    final w = size.width;

    final faceBrush = Paint()..color = backgroundColor;
    canvas.drawPath(
      Path()
        ..moveTo(0, 0)
        ..addPolygon([
          const Offset(0, 0),
          Offset(w, 0),
          Offset(w, h),
          Offset(0, h),
        ], true),
      faceBrush,
    );
    final rightHslColor = HSLColor.fromColor(backgroundColor);
    final righSideBrush = Paint()..color = rightHslColor.withLightness((rightHslColor.lightness + 0.15).clamp(0.0, 1.0)).toColor();
    canvas.drawPath(
      Path()
        ..moveTo(w, 0)
        ..addPolygon([
          Offset(w, 0),
          Offset(w + depth, depth),
          Offset(w + depth, h + depth),
          Offset(w, h),
        ], true),
      righSideBrush,
    );
    final hslColor = HSLColor.fromColor(backgroundColor);

    final bottomSideBrush = Paint()..color = hslColor.withLightness((hslColor.lightness - 0.3).clamp(0.0, 1.0)).toColor();
    canvas.drawPath(
      Path()
        ..moveTo(w, h)
        ..addPolygon([
          Offset(w, h),
          Offset(0, h),
          Offset(depth, h + depth),
          Offset(w + depth, h + depth),
        ], true),
      bottomSideBrush,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

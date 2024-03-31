import 'package:flutter/material.dart';

class PoppedButtonClipper extends CustomClipper<Path> {
  final double depth;
  PoppedButtonClipper({super.reclip, required this.depth});

  @override
  Path getClip(Size size) {
    final w = size.width;
    final h = size.height;

    return Path()
      ..moveTo(0, 0)
      ..addPolygon(
        [
          const Offset(0, 0),
          Offset(w, 0),
          Offset(w + depth, depth),
          Offset(w + depth, h + depth),
          Offset(depth, h + depth),
          Offset(0, h),
        ],
        true,
      );
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

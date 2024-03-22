import 'package:flutter/material.dart';

class TcustomCurvedEdges extends CustomClipper<path> {
  @override
  path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size, height);

    final firstCurve = Offset(0, size.height - 20);
    final lastCurve = Offset(30, size.height - 20);
    path.quadraticBezierTo(
        firstCurve.dx, firstCurve.dy, lastCurve.dx, lastCurve.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<path> oldClipper) {
    return true;
  }
}

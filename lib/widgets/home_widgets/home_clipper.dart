import 'package:flutter/material.dart';

class HomePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0xFFF0F4FD);
    final path = Path();
    final h = size.height, w = size.width;
    path.moveTo(w, h * .1);
    path.cubicTo(w * .9, h * .1, w * 1.07, h * .28, w * .85, h * .28);

    path.lineTo(w * .2, h * .28);
    path.quadraticBezierTo(-10, h * .28, 0, h * .38);
    path.lineTo(0, h);
    path.lineTo(w, h);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

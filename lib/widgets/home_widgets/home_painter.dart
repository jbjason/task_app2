import 'package:flutter/material.dart';
import 'package:task_app2/constants/constant.dart';

class HomePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final h = size.height, w = size.width;

    //behind part
    final paint2 = Paint()..color = homeBodyColor;
    final path2 = Path();
    path2.moveTo(w, h * .09);
    path2.cubicTo(w * .9, h * .09, w * 1.02, h * .27, w * .89, h * .273);
    path2.lineTo(w * .2, h * .273);
    path2.quadraticBezierTo(-10, h * .273, 0, h * .373);
    path2.lineTo(0, h);
    path2.lineTo(w, h);
    path2.close();
    canvas.drawPath(path2, paint2);

    // Upper part
    final paint = Paint()..color = homeBodySecondaryColor;
    final path = Path();
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

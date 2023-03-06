import 'package:flutter/material.dart';
import 'package:task_app2/constants/constant.dart';

class AddTaskPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = homeBodyColor;
    final path = Path();
    final h = size.height, w = size.width;

    path.moveTo(0, h * .1);
    path.cubicTo(0, h * .2, w * .1, h * .2, w * .25, h * .2);
    path.lineTo(w * .85, h * .2);
    path.cubicTo(w * .98, h * .2, w * .98, h * .25, w * .98, h * .3);
    path.lineTo(w * .98, h * .8);
    path.cubicTo(w * .98, h * .9, w * .98, h * .9, w * .85, h * .9);
    path.lineTo(w * .1, h * .9);
    path.cubicTo(0, h * .9, 0, h * .85, 0, h * .8);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

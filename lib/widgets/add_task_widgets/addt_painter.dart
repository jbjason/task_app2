import 'package:flutter/material.dart';
import 'package:task_app2/constants/constant.dart';

class AddTaskPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final h = size.height, w = size.width;

    // behind part
    final paint2 = Paint()..color = homeBodyColor;
    final path2 = Path();
    path2.moveTo(0, h * .09);
    path2.cubicTo(0, h * .165, w * .1, h * .165, w * .25, h * .165);
    path2.lineTo(w * .85, h * .165);
    path2.cubicTo(w * .97, h * .165, w * .97, h * .215, w * .97, h * .265);
    path2.lineTo(w * .97, h * .28);
    path2.lineTo(0, h * .28);
    path2.close();
    canvas.drawPath(path2, paint2);

    // front part
    final paint = Paint()..color = logBackColor;
    final path = Path();
    path.moveTo(0, h * .1);
    path.cubicTo(0, h * .17, w * .1, h * .17, w * .25, h * .17);
    path.lineTo(w * .85, h * .17);
    path.cubicTo(w * .97, h * .17, w * .97, h * .22, w * .97, h * .27);
    path.lineTo(w * .97, h * .8);
    path.cubicTo(w * .97, h * .9, w * .97, h * .9, w * .84, h * .9);
    path.lineTo(w * .1, h * .9);
    path.cubicTo(0, h * .9, 0, h * .85, 0, h * .8);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

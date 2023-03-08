import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_app2/constants/constant.dart';

class CommonWidget {
  Widget getImageIcon(String img) => Container(
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: homeBodyColor),
        child: const CircleAvatar(
          radius: 22,
          backgroundColor: Colors.transparent,
          child: CircleAvatar(
            radius: 20,
            backgroundImage:
                NetworkImage('https://picsum.photos/200/300?random=10'),
          ),
        ),
      );

  Widget getTitleText(String title) => Text(
        title,
        style: GoogleFonts.fjallaOne(
          textStyle: const TextStyle(
            color: logBackColor,
            fontSize: 27,
            letterSpacing: 1.5,
          ),
        ),
      );

  void getSnackBar(BuildContext ctx, String title, Color color) {
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        behavior: SnackBarBehavior.floating,
        shape: const StadiumBorder(),
        content: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: LinearGradient(colors: [
              color.withOpacity(.5),
              color.withOpacity(.3),
              color.withOpacity(.4),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontSize: 10, color: Colors.white, letterSpacing: 1.3),
          ),
        ),
      ),
    );
  }
}

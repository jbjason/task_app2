import 'package:flutter/material.dart';
import 'package:task_app2/constants/constant.dart';

class AddtTextField2 extends StatelessWidget {
  const AddtTextField2(
      {required this.onPress,
      required this.icon,
      required this.label,
      required this.title,
      super.key});
  final String label;
  final String title;
  final IconData icon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    final borderColor = logBackColor.withOpacity(.05);
    final textColor = logBackColor.withOpacity(.3);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // lable
        Text(label, style: TextStyle(color: textColor, fontSize: 13)),
        Row(
          children: [
            // color line
            Container(
              width: 1,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: logBackColor,
              ),
            ),
            const SizedBox(width: 12),
            // title
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                color: logBackColor,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () => onPress(),
              icon: Icon(icon, color: logBackColor),
            ),
          ],
        ),
        // bottom border
        Container(
          margin: const EdgeInsets.only(right: 10),
          width: double.infinity,
          height: 1.2,
          color: borderColor,
        ),
        const SizedBox(height: 25),
      ],
    );
  }
}

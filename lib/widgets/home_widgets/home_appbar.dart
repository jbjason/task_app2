import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_app2/constants/constant.dart';
import 'package:task_app2/widgets/common_widgets/common_widgets.dart';
import 'package:task_app2/widgets/home_widgets/home_calender.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({required this.selectedDate, super.key});
  final ValueNotifier<DateTime> selectedDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //appBar
        _appBar(context),
        // calender
        Expanded(
          child: Center(child: HomeCalender(selectedDate: selectedDate)),
        ),
      ],
    );
  }

  Widget _appBar(BuildContext ctx) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // logout button
          GestureDetector(
            onTap: () => FirebaseAuth.instance.signOut(),
            child: const CircleAvatar(
              radius: 22,
              backgroundColor: homeBodyColor,
              child: Icon(Icons.power_settings_new, color: logBackColor),
            ),
          ),
          // image circleAvatar
          getImageIcon(''),
        ],
      );
}

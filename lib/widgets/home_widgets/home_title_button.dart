import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_app2/widgets/common_widgets/common_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_app2/constants/constant.dart';
import 'package:task_app2/screens/add_task_screen.dart';

class HomeTitleButton extends StatelessWidget {
  const HomeTitleButton({required this.selectedDate, super.key});
  final ValueNotifier<DateTime> selectedDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // title
          getTitleText('TODO'),
          const SizedBox(width: 8),
          // todays date
          ValueListenableBuilder(
            valueListenable: selectedDate,
            builder: (context, val, __) {
              final date = DateFormat('MMM d').format(val);
              return Text(
                date,
                style: GoogleFonts.fjallaOne(
                  textStyle: const TextStyle(color: Colors.grey),
                ),
              );
            },
          ),
          const Spacer(),
          // addTask Button
          ElevatedButton(
            onPressed: () =>
                Navigator.pushNamed(context, AddTaskScreen.routeName),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrangeAccent,
              padding: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Row(
              children: const [
                Icon(Icons.add),
                SizedBox(width: 5),
                Text('Add Task', style: TextStyle(color: homeText1Color)),
                SizedBox(width: 7),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

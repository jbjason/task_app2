import 'package:flutter/material.dart';
import 'package:task_app2/blocs/helpers.dart';
import 'package:task_app2/constants/constant.dart';
import 'package:task_app2/models/category.dart';
import 'package:task_app2/models/task.dart';
import 'package:task_app2/widgets/common_widgets/common_widgets.dart';

class HomeDeleteIcon extends StatelessWidget {
  const HomeDeleteIcon({required this.task, super.key});
  final Task task;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text(
              "Alert !!",
              style: TextStyle(
                  color: Colors.redAccent, fontWeight: FontWeight.bold),
            ),
            content: Text(
              "Do You Really Want to Delete ?",
              style: TextStyle(
                fontSize: 12,
                color: logBackColor.withOpacity(0.5),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  try {
                    Helpers().onDeleteUserTask(task.id);
                    Navigator.of(ctx).pop();
                  } catch (e) {
                    getSnackBar(ctx, 'Something went wrong!', Colors.red);
                  }
                },
                child: const Text("Yes"),
              ),
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: const Text("No"),
              ),
            ],
          ),
        );
      },
      child: SizedBox(
        height: 14,
        width: 30,
        child: Center(
          child: Container(
            height: 2,
            width: 14,
            decoration: BoxDecoration(
              color: categories[task.category].color,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:task_app2/constants/constant.dart';
import 'package:task_app2/models/task.dart';
import 'package:task_app2/widgets/home_widgets/home_listitem.dart';

class HomeListView extends StatelessWidget {
  const HomeListView({required this.tasks, super.key});
  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: tasks.length,
      clipBehavior: Clip.none,
      separatorBuilder: (_, __) => const SizedBox(height: 20),
      itemBuilder: (context, i) {
        final task = tasks[i];
        return DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: logGradient1Color.withOpacity(.5),
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(-2, -2),
              ),
              const BoxShadow(
                color: logBackColor,
                spreadRadius: 3,
                blurRadius: 20,
                offset: Offset(5, 5),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(
                height: 150,
                padding: const EdgeInsets.only(
                    left: 30, right: 20, top: 20, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      logGradient1Color.withOpacity(.2),
                      logGradient2Color.withOpacity(.2)
                    ],
                  ),
                  // border: Border.all(width: 1.2, color: Colors.black),
                ),
                child: HomeListItem(task: task),
              ),
            ),
          ),
        );
      },
    );
  }
}

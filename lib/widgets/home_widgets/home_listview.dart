import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app2/blocs/task_cubit/task_cubit.dart';
import 'package:task_app2/models/task.dart';
import 'package:task_app2/widgets/home_widgets/home_listitem.dart';

class HomeListView extends StatelessWidget {
  const HomeListView(
      {required this.list, required this.selectedDate, super.key});
  final List<Task> list;
  final ValueNotifier<DateTime> selectedDate;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedDate,
      builder: (ctx, selected, _) {
        // sortling the list based on give date by valueListener
        final bloc = BlocProvider.of<TaskCubit>(ctx);
        final tasks = bloc.getSortedlist(list, selected);
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
                    color: Colors.grey[300]!,
                    spreadRadius: 3,
                    blurRadius: 10,
                    offset: const Offset(2, 2),
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    spreadRadius: 3,
                    blurRadius: 10,
                    offset: Offset(-2, -2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                  child: Container(
                    height: 150,
                    padding: const EdgeInsets.only(
                        left: 30, right: 20, top: 20, bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.white, Colors.white.withOpacity(.6)],
                      ),
                      border: Border.all(width: 1.2, color: Colors.white),
                    ),
                    child: HomeListItem(task: task),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

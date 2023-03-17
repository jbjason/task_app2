import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app2/blocs/helpers.dart';
import 'package:task_app2/blocs/task_cubit/task_cubit.dart';
import 'package:task_app2/models/task.dart' as task;
import 'package:task_app2/widgets/add_task_widgets/addt_body.dart';
import 'package:task_app2/widgets/add_task_widgets/addt_painter.dart';
import 'package:task_app2/widgets/common_widgets/common_widgets.dart';

class AddTaskScreen extends StatelessWidget {
  static const routeName = '/add-task-screen';
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: CustomPaint(
            painter: AddTaskPainter(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child:
                  SingleChildScrollView(child: AddtBody(onSubmit: _onSubmit)),
            ),
          ),
        ),
      ),
    );
  }

  void _onSubmit(task.Task task, BuildContext context) {
    BlocProvider.of<TaskCubit>(context).changeLoadingStatus();
    try {
      Helpers().onAddUserTask(task);
      Navigator.pop(context);
    } catch (e) {
      BlocProvider.of<TaskCubit>(context).changeInitialStatus();
      CommonWidget().getSnackBar(context, 'Something went wrong!', Colors.red);
    }
  }
}

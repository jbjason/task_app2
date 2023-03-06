import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app2/blocs/task_cubit/task_cubit.dart';
import 'package:task_app2/constants/constant.dart';

class AddtButton extends StatelessWidget {
  const AddtButton({required this.onSubmit, super.key});
  final Function onSubmit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSubmit(),
      child: Container(
        height: 45,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: loginGradient,
        ),
        child: BlocBuilder<TaskCubit, TaskState>(
          builder: (context, state) {
            if (state is TaskLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            return const Center(
              child: Text(
                'Create New Task',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.white70,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

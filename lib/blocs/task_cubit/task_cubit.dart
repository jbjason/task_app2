import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app2/models/task.dart';
import 'package:equatable/equatable.dart';
part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitialState());

  void changeLoadingStatus() => emit(TaskLoadingState());

  void changeInitialStatus() => emit(TaskInitialState());

  void fetchTasks(List<QueryDocumentSnapshot<Object?>> userTaskList) {
    List<Task> taskList = [];
    try {
      emit(TaskLoadingState());
      for (int i = 0; i < userTaskList.length; i++) {
        final id = userTaskList[i].id;
        taskList.add(
          Task(
            id: id,
            title: userTaskList[i]['title'],
            details: userTaskList[i]['details'],
            startTime: userTaskList[i]['startTime'],
            endTime: userTaskList[i]['endTime'],
            taskDate: DateTime.parse(userTaskList[i]['taskDate']),
            date: DateTime.parse(userTaskList[i]['date']),
            category: userTaskList[i]['category'],
          ),
        );
      }

      emit(TaskLoadedState([...taskList]));
    } catch (e) {
      emit(TaskErrorState(error: e.toString()));
    }
  }
}

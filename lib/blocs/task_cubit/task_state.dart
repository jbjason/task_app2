part of 'task_cubit.dart';

class TaskState extends Equatable {
  @override
  List<Object> get props => [];
}

class TaskInitialState extends TaskState {
  @override
  List<Object> get props => [];
}

class TaskLoadingState extends TaskState {
  @override
  List<Object> get props => [];
}

class TaskLoadedState extends TaskState {
  final List<Task> allTasks;
  TaskLoadedState(this.allTasks);
  @override
  List<Object> get props => [allTasks];
}

class TaskErrorState extends TaskState {
  final String error;
  TaskErrorState({required this.error});
  @override
  List<Object> get props => [error];
}

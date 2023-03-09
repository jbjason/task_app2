import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app2/blocs/helpers.dart';
import 'package:task_app2/blocs/task_cubit/task_cubit.dart';
import 'package:task_app2/widgets/home_widgets/home_listview.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({required this.selectedDate, super.key});
  final ValueNotifier<DateTime> selectedDate;
  @override
  Widget build(BuildContext context) {
    final id = FirebaseAuth.instance.currentUser!.uid;
    return ValueListenableBuilder(
      valueListenable: selectedDate,
      builder: (ctx, date, _) {
        return StreamBuilder(
          stream: Helpers.getUserTasks(id, date),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapShot) {
            if (snapShot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapShot.hasError) {
              return const Center(child: Text('Error Occured While Fetching!'));
            } else {
              final userDocs = snapShot.data!.docs;
              // fetching tasks
              BlocProvider.of<TaskCubit>(context).fetchTasks(userDocs);
              return BlocBuilder<TaskCubit, TaskState>(
                builder: (context, state) {
                  if (state is TaskErrorState) {
                    return Center(child: Text(state.error));
                  } else if (state is TaskLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is TaskLoadedState) {
                    return HomeListView(tasks: state.allTasks);
                  } else {
                    return Container();
                  }
                },
              );
            }
          },
        );
      },
    );
  }
}

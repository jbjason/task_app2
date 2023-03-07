import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app2/blocs/helpers.dart';
import 'package:task_app2/blocs/task_cubit/task_cubit.dart';
import 'package:task_app2/widgets/home_widgets/home_body.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUserId = FirebaseAuth.instance.currentUser!.uid;
    return StreamBuilder(
      stream: Helpers.getUserTasks(currentUserId),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapShot) {
        if (snapShot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapShot.hasError) {
          return const Center(child: Text('Error Occured!'));
        } else {
          final userDocs = snapShot.data!.docs;
          // fetching tasks
          BlocProvider.of<TaskCubit>(context).fetchTasks(userDocs);
          return const HomeBody();
        }
      },
    );
  }
}

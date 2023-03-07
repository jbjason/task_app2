import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_app2/models/task.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Helpers {
  final currentUserId = FirebaseAuth.instance.currentUser!.uid;

  static Stream<QuerySnapshot<Map<String, dynamic>>> getUserTasks(String id) =>
      FirebaseFirestore.instance
          .collection('tasks')
          .doc(id)
          .collection('task')
          .orderBy('date', descending: true)
          .snapshots();

  void onAddUserTask(Task task) async {
    await FirebaseFirestore.instance
        .collection('tasks')
        .doc(currentUserId)
        .collection('task')
        .add(task.taskToMap());
  }

  void onDeleteUserTask(String id) async {
    await FirebaseFirestore.instance
        .collection('tasks')
        .doc(currentUserId)
        .collection('task')
        .doc(id)
        .delete();
  }
}

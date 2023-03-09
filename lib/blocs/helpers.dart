import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_app2/models/task.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Helpers {
  final currentUserId = FirebaseAuth.instance.currentUser!.uid;

  static Stream<QuerySnapshot<Map<String, dynamic>>> getUserTasks(
      String id, DateTime d) {
    // usually date saved as (0:0:0  hour:min:sec) so day-1<...>day+1
    final dayStart = DateTime(d.year, d.month, d.day - 1, 23, 50, 0, 0, 0);
    final dayEnd = DateTime(d.year, d.month, d.day, 23, 59, 0, 0, 0);
    return FirebaseFirestore.instance
        .collection('tasks')
        .doc(id)
        .collection('task')
        .where('taskDate', isGreaterThanOrEqualTo: dayStart.toIso8601String())
        .where('taskDate', isLessThanOrEqualTo: dayEnd.toIso8601String())
        .orderBy('taskDate', descending: true)
        .snapshots();
  }

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

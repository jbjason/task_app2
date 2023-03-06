import 'package:cloud_firestore/cloud_firestore.dart';

abstract class Helpers {
  static Stream<QuerySnapshot<Map<String, dynamic>>> getUserTasks(String id) =>
      FirebaseFirestore.instance
          .collection('tasks')
          .doc(id)
          .collection('task')
          .orderBy('date', descending: false)
          .snapshots();
}

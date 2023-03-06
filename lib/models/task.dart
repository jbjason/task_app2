// ignore_for_file: public_member_api_docs, sort_constructors_first
class Task {
  final String id;
  final String title;
  final String details;
  final int startTime;
  final int endTime;
  final DateTime date;
  final DateTime taskDate;
  final int category;
  Task({
    required this.id,
    required this.title,
    required this.details,
    required this.startTime,
    required this.endTime,
    required this.taskDate,
    required this.date,
    required this.category,
  });

  Task copyWith({
    String? id,
    String? title,
    String? details,
    int? startTime,
    int? endTime,
    DateTime? taskDate,
    DateTime? date,
    int? category,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      details: details ?? this.details,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      taskDate: taskDate ?? this.taskDate,
      date: date ?? this.date,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> taskToMap() {
    return <String, dynamic>{
      'title': title,
      'details': details,
      'startTime': startTime,
      'endTime': endTime,
      'taskDate': taskDate.toIso8601String(),
      'date': date.toIso8601String(),
      'category': category,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map, String id) {
    return Task(
      id: id,
      title: map['title'].toString(),
      details: map['details'].toString(),
      startTime: map['startTime'] as int,
      endTime: map['endTime'] as int,
      taskDate: DateTime.parse(map['taskDate']),
      date: DateTime.parse(map['date']),
      category: map['category'] as int,
    );
  }
}

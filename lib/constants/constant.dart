import 'package:flutter/material.dart';
import 'package:task_app2/models/task.dart';

const logBackColor = Color(0xFF060C22);
const logGradient1Color = Color(0xFF6502FE);
const logGradient2Color = Color(0xFFE71B6A);

const homeText1Color = Color(0xFFF0F4FD);
const homeText2Color = Color(0xFFFFFFFF);
const homeBodyColor = Color(0xFFF0F4FD);

const loginGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [logGradient1Color, logGradient2Color],
);

final simpleTask = Task(
  id: 'id1',
  title: 'New Web UI Design',
  details: 'Its gotta be done before 7pm sharp or gonna lost the client',
  startTime: 150,
  endTime: 330,
  date: DateTime.now(),
  taskDate: DateTime.now().add(const Duration(days: 2)),
  category: 2,
);

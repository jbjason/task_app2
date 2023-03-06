import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:task_app2/constants/constant.dart';

class HomeCalender extends StatefulWidget {
  const HomeCalender({super.key});
  @override
  State<HomeCalender> createState() => _HomeCalenderState();
}

class _HomeCalenderState extends State<HomeCalender> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return CalendarTimeline(
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 20)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      onDateSelected: (date) => setState(() => _selectedDate = date),
      leftMargin: 20,
      monthColor: Colors.grey,
      dayColor: Colors.grey,
      activeDayColor: homeBodyColor,
      dayNameColor: homeBodyColor,
      activeBackgroundDayColor: logBackColor,
      dotsColor: homeBodyColor,
      selectableDayPredicate: (date) => _selectedDate.day != 23,
      locale: 'en',
    );
  }
}

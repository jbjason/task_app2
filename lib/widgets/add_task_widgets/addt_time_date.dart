import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_app2/widgets/add_task_widgets/addt_textfield2.dart';

class AddtTimeDate extends StatelessWidget {
  const AddtTimeDate({
    required this.endTime,
    required this.selectedDate,
    required this.startTime,
    required this.onStartTimeChange,
    required this.onDateChange,
    required this.onEndTimeChange,
    super.key,
  });
  final DateTime selectedDate;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final Function onStartTimeChange;
  final Function onEndTimeChange;
  final Function onDateChange;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        children: [
          // date
          AddtTextField2(
            label: 'DATE',
            icon: Icons.calendar_today_outlined,
            title: DateFormat.yMMMd().format(selectedDate),
            onPress: onDateChange,
          ),
          // time textField
          Row(
            children: [
              // startTime
              Expanded(
                child: AddtTextField2(
                  label: 'START TIME',
                  title: startTime.format(context).toString(),
                  icon: Icons.expand_more_outlined,
                  onPress: onStartTimeChange,
                ),
              ),
              const SizedBox(width: 25),
              // endTime
              Expanded(
                child: AddtTextField2(
                  label: 'END TIME',
                  title: endTime.format(context).toString(),
                  icon: Icons.expand_more_outlined,
                  onPress: onEndTimeChange,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

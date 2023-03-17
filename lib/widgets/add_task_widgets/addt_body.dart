import 'package:flutter/material.dart';
import 'package:task_app2/models/task.dart';
import 'package:task_app2/widgets/add_task_widgets/addt_button.dart';
import 'package:task_app2/widgets/add_task_widgets/addt_textfield.dart';
import 'package:task_app2/widgets/add_task_widgets/addt_appbar.dart';
import 'package:task_app2/widgets/add_task_widgets/addt_category_list.dart';
import 'package:task_app2/widgets/add_task_widgets/addt_time_date.dart';

class AddtBody extends StatefulWidget {
  const AddtBody({required this.onSubmit, super.key});
  final Function onSubmit;
  @override
  State<AddtBody> createState() => _AddtBodyState();
}

class _AddtBodyState extends State<AddtBody> {
  final titleController = TextEditingController();
  final detailsController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();
  DateTime _selectedDate = DateTime.now();
  int _selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // appBar
          SizedBox(height: size.height * .2, child: const AddtAppbar()),
          // taskName textFiled
          AddtTextFile(hint: 'Your Task Name', controller: titleController),
          const SizedBox(height: 20),
          // details textfield
          AddtTextFile(hint: 'Description', controller: detailsController),
          const SizedBox(height: 35),
          // category List
          AddtCategoryList(
            onChange: _onCategoryChange,
            selectedCategory: _selectedCategory,
          ),
          const SizedBox(height: 35),
          // date, start & end time textFields
          AddtTimeDate(
            endTime: endTime,
            selectedDate: _selectedDate,
            startTime: startTime,
            onStartTimeChange: _onStartTimeChange,
            onDateChange: _onDateChange,
            onEndTimeChange: _onEndTimeChange,
          ),
          const SizedBox(height: 40),
          // create task Button
          AddtButton(onSubmit: _onSubmit),
        ],
      ),
    );
  }

  void _onStartTimeChange() => _onTimeChange('start');
  void _onEndTimeChange() => _onTimeChange('end');
  void _onCategoryChange(int i) => setState(() => _selectedCategory = i);

  void _onTimeChange(String tag) async {
    TimeOfDay? time =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (time == null) return;
    tag == 'start' ? startTime = time : endTime = time;
    setState(() {});
  }

  void _onDateChange() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: _selectedDate.subtract(const Duration(days: 2)),
      lastDate: _selectedDate.add(const Duration(days: 27)),
    );
    if (date == null) return;
    setState(() => _selectedDate = date);
  }

  void _onSubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (!isValid) return;
    widget.onSubmit(
      Task(
        id: '',
        title: titleController.text.trim(),
        details: detailsController.text.trim(),
        startTime: (startTime.hour * 60 + startTime.minute),
        endTime: (endTime.hour * 60 + endTime.minute),
        taskDate: _selectedDate,
        date: DateTime.now(),
        category: _selectedCategory,
      ),
      context,
    );
  }
}

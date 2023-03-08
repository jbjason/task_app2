import 'package:flutter/material.dart';
import 'package:task_app2/widgets/home_widgets/home_appbar.dart';
import 'package:task_app2/widgets/home_widgets/home_body.dart';
import 'package:task_app2/widgets/home_widgets/home_title_button.dart';
import 'package:task_app2/widgets/home_widgets/home_painter.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final selectedDate = ValueNotifier<DateTime>(DateTime.now());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // painter
            Positioned.fill(child: CustomPaint(painter: HomePainter())),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // appBar
                  SizedBox(
                    height: height * .26,
                    child: HomeAppBar(selectedDate: selectedDate),
                  ),
                  const SizedBox(height: 20),
                  // To-do title, date & addTask Button
                  HomeTitleButton(selectedDate: selectedDate),
                  const SizedBox(height: 20),
                  // To-do List
                  Expanded(child: HomeBody(selectedDate: selectedDate)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:task_app2/widgets/home_widgets/home_appbar.dart';
import 'package:task_app2/widgets/home_widgets/home_clipper.dart';
import 'package:task_app2/widgets/home_widgets/home_listview.dart';
import 'package:task_app2/widgets/home_widgets/home_title_button.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                      height: size.height * .26, child: const HomeAppBar()),
                  const SizedBox(height: 20),
                  // To-do title, date & addTask Button
                  const HomeTitleButton(),
                  const SizedBox(height: 20),
                  // To-do List
                  const Expanded(child: HomeListView()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

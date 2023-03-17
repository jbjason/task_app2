import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_app2/models/category.dart';
import 'package:task_app2/models/task.dart';
import 'package:task_app2/widgets/home_widgets/home_delete_icon.dart';

class HomeListItem extends StatelessWidget {
  const HomeListItem({required this.task, super.key});
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // category type & delete Icon
        _topContainer(context),
        Divider(color: Colors.grey[300]),
        const SizedBox(height: 5),
        // title & details
        Expanded(child: _body()),
        const SizedBox(height: 20),
        // starting, ending time & share icon
        _bottomContainer(),
      ],
    );
  }

  Widget _topContainer(BuildContext ctx) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // category title
          Text(
            categories[task.category].title,
            style: GoogleFonts.fjallaOne(
              textStyle: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: categories[task.category].color,
              ),
            ),
          ),
          // delete icon
          HomeDeleteIcon(task: task),
        ],
      );

  Widget _body() => Row(
        children: [
          // left linear line color
          Container(
            width: 2.5,
            decoration: BoxDecoration(
              color: categories[task.category].color,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // title
                Text(
                  task.title,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 8),
                // details
                Text(
                  task.details,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.fjallaOne(
                    textStyle: const TextStyle(
                      fontSize: 8,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );

  Widget _bottomContainer() {
    final startTime = _getTime(task.startTime);
    final endTime = _getTime(task.endTime);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Due-date
        _iconText(CupertinoIcons.clock, startTime),
        _iconText(Icons.alarm_off_outlined, endTime),
        _iconText(Icons.share_outlined, 'Share'),
      ],
    );
  }

  String _getTime(int time) {
    final startHour = time ~/ 60;
    final amPm = startHour > 12 ? 'pm' : 'am';
    return '$startHour:${time % 60} $amPm';
  }

  Widget _iconText(IconData icon, String title) => Row(
        children: [
          Icon(icon, color: Colors.grey[400]),
          const SizedBox(width: 5),
          Text(
            title,
            style: const TextStyle(fontSize: 10, color: Colors.white38),
          ),
        ],
      );
}

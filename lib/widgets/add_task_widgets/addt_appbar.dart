import 'package:flutter/material.dart';
import 'package:task_app2/widgets/common_widgets/common_widgets.dart';

class AddtAppbar extends StatelessWidget {
  const AddtAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // back button
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back_ios_new),
            ),
            // userImage icon
            CommonWidget().getImageIcon(''),
          ],
        ),
        // addTask text
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: CommonWidget().getTitleText('Add Task'),
          ),
        ),
      ],
    );
  }
}

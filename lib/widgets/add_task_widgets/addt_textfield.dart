import 'package:flutter/material.dart';

class AddtTextFile extends StatelessWidget {
  const AddtTextFile({required this.hint, required this.controller, super.key});
  final TextEditingController controller;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Linear Color Line
        Container(
          width: 1,
          height: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white60,
          ),
        ),
        const SizedBox(width: 10),
        // textField
        Expanded(
          child: TextFormField(
            controller: controller,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.white30.withOpacity(.3)),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white30.withOpacity(.1)),
              ),
              contentPadding: const EdgeInsets.only(left: 10),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white70),
              ),
            ),
            validator: (value) {
              if (value!.trim().isEmpty) {
                return 'Please Fill Up The Form';
              } else {
                return null;
              }
            },
          ),
        ),
      ],
    );
  }
}

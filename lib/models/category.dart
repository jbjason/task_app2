import 'package:flutter/material.dart';

final categories = [
  const Category(title: "URGENT", color: Color(0xFFFF3D00)),
  const Category(title: "RUNNING", color: Color(0xFF69F0AE)),
  const Category(title: "ONGOING", color: Color.fromARGB(255, 174, 161, 196)),
];

class Category {
  final String title;
  final Color color;
  const Category({required this.title, required this.color});
}

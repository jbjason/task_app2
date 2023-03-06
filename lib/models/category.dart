import 'package:flutter/material.dart';

final categories = [
  const Category(title: "URGENT", color: Color(0xFFFF3D00)),
  const Category(title: "RUNNING", color: Color(0xFF69F0AE)),
  const Category(title: "ONGOING", color: Color(0xFF673AB7)),
];

class Category {
  final String title;
  final Color color;
  const Category({required this.title, required this.color});
}

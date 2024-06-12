import 'package:flutter/material.dart';

class Exercise {
  final String name;
  final String category;
  final String description;
  final String imagePath;
  final String videoPath;
  final DateTime date;
  final IconData icon;
  bool completed;

  Exercise({
    required this.name,
    required this.category,
    required this.description,
    required this.imagePath,
    required this.videoPath,
    required this.date,
    required this.icon,
    this.completed = false,
  });
}

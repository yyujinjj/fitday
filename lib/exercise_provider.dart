import 'package:flutter/material.dart';
import 'exercise.dart';

class ExerciseProvider with ChangeNotifier {
  List<Exercise> _history = [];

  List<Exercise> get history => _history;

  void addExercise(Exercise exercise) {
    _history.add(exercise);
    notifyListeners();
  }

  List<Exercise> getExercisesForDay(DateTime day) {
    return _history.where((exercise) => isSameDay(exercise.date, day)).toList();
  }

  bool isSameDay(DateTime? a, DateTime? b) {
    if (a == null || b == null) {
      return false;
    }
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}

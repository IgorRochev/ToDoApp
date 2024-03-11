import 'package:flutter/material.dart';

Color showTaskOverdue(dynamic task, int listIndex) {
  Color color;
  (listIndex == 0)
      ? ((DateTime(
                  int.parse(task.date.split(".")[2]),
                  int.parse(task.date.split(".")[1]),
                  int.parse(task.date.split(".")[0]))
              .isBefore(DateTime(DateTime.now().year, DateTime.now().month,
                  DateTime.now().day)))
          ? color = const Color.fromARGB(255, 251, 1, 1)
          : color = const Color(0xFF000000))
      : color = const Color(0xFF000000);
  return color;
}

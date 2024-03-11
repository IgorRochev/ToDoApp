import 'package:flutter/material.dart';

class EditTaskFieldsModel {
  DateTime currentDate = DateTime.now();
  TimeOfDay currentTime = TimeOfDay.now();
  bool dateGiveVerse = false;
  bool datePickerOpened = false;
  bool timeGiveVerse = false;
  bool timePickerOpened = false;
  final titleController = TextEditingController();
  final subtitleController = TextEditingController();

  EditTaskFieldsModel();
}

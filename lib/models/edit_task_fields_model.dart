import 'package:flutter/material.dart';

class EditTaskFieldsModel {
  DateTime taskDate = DateTime.now();
  TimeOfDay taskTime = TimeOfDay.now();
  bool dateGiveVerse = false;
  bool datePickerOpened = false;
  bool timeGiveVerse = false;
  bool timePickerOpened = false;
  final titleController = TextEditingController();
  final subtitleController = TextEditingController();

  EditTaskFieldsModel();
}

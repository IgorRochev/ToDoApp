import 'package:flutter/material.dart';

abstract class ButtonsStyles {
  static const EditTaskButtonsTextStyle = MaterialStatePropertyAll(TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    fontFamily: "Jost",
  ));
  static const AddTaskButtonTextStyle = MaterialStatePropertyAll(TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    fontFamily: "Jost",
  ));
}

import 'package:flutter/material.dart';

abstract class ButtonsStyles {
  static const editTaskButtonsTextStyle = MaterialStatePropertyAll(TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    fontFamily: "Jost",
  ));
  static const addTaskButtonTextStyle = MaterialStatePropertyAll(TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    fontFamily: "Jost",
  ));
  static const clearWindowButtonsTextStyle = MaterialStatePropertyAll(TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w600,
    fontFamily: "Jost",
  ));
}

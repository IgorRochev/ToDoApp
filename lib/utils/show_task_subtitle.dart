import 'package:flutter/material.dart';
import 'package:todo_list_app/views/components/task_subtitle.dart';

List<Widget> showTaskSubTitle(String? subtitle) {
  if (subtitle != null) {
    return [TaskSubtitleWidget(subtitle: subtitle)];
  }
  return [];
}

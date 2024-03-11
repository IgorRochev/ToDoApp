import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/styles/theme/decorations.dart';
import 'package:todo_list_app/utils/show_task_datetime.dart';
import 'package:todo_list_app/utils/show_task_subtitle.dart';
import 'package:todo_list_app/view_models/tasks_lists_change_view_model.dart';
import 'package:todo_list_app/views/components/task_title.dart';

class FinishedToDoList extends StatelessWidget {
  const FinishedToDoList({super.key, required this.listIndex});
  final int listIndex;

  @override
  Widget build(BuildContext context) {
    final finishedTasks =
        context.watch<TasksListsChangeViewModel>().finishedTasks.values;
    return Container(
      color: const Color(0xFFD6D7EF),
      child: ListView.builder(
        itemCount: finishedTasks.length,
        padding: const EdgeInsets.only(top: 21),
        itemBuilder: (BuildContext context, int index) {
          final finishedTask = finishedTasks.elementAt(index);
          return Padding(
            padding: const EdgeInsets.only(right: 4, left: 4, bottom: 21),
            child: Container(
              decoration: Decorations.taskDecoration,
              constraints: const BoxConstraints(minHeight: 85),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 18, right: 25, top: 15, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TaskTitleWidget(
                            title: finishedTask.title,
                          ),
                          ...showTaskSubTitle(finishedTask.subtitle),
                          Row(
                            children: [
                              ...showTaskDateTime(
                                  finishedTask, listIndex, null),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

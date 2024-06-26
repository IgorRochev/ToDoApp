import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/models/task_model.dart';
import 'package:todo_list_app/styles/theme/decorations.dart';
import 'package:todo_list_app/utils/show_task_datetime.dart';
import 'package:todo_list_app/utils/show_task_edit_and_close_buttons.dart';
import 'package:todo_list_app/utils/show_task_subtitle.dart';
import 'package:todo_list_app/view_models/tasks_lists_change_view_model.dart';
import 'package:todo_list_app/views/components/task_title.dart';

class Task extends StatelessWidget {
  const Task({
    super.key,
    required this.task,
    this.pickedDateTime,
    required this.listIndex,
    required this.taskIndex,
  });
  final int taskIndex;
  final int listIndex;
  final TaskModel task;
  final DateTime? pickedDateTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4, left: 4, bottom: 21),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: Decorations.taskDecoration,
        constraints: const BoxConstraints(minHeight: 85),
        child: Slidable(
          endActionPane: ActionPane(
              motion: const BehindMotion(),
              extentRatio: 0.24,
              children: [
                SlidableAction(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15)),
                  backgroundColor: Colors.red.shade400,
                  label: "Удалить",
                  onPressed: (context) => {
                    context
                        .read<TasksListsChangeViewModel>()
                        .deleteTask(taskIndex, listIndex)
                  },
                ),
              ]),
          child: Container(
            constraints: const BoxConstraints(minHeight: 85),
            padding:
                const EdgeInsets.only(left: 18, right: 25, top: 15, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TaskTitle(
                        title: task.title,
                      ),
                      ...showTaskSubTitle(task.subtitle),
                      Row(
                        children: [
                          ...showTaskDateTime(task, listIndex, pickedDateTime),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Row(
                  children: [
                    ...showTaskEditAndCloseButtons(listIndex, taskIndex),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

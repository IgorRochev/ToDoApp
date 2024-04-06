import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/view_models/tasks_lists_change_view_model.dart';
import 'package:todo_list_app/views/components/clear_completed_tasks_button.dart';
import 'package:todo_list_app/views/components/task.dart';

class FinishedToDoList extends StatelessWidget {
  const FinishedToDoList({super.key, required this.listIndex});
  final int listIndex;

  @override
  Widget build(BuildContext context) {
    final finishedTasks =
        context.watch<TasksListsChangeViewModel>().finishedTasks;
    return Container(
      color: const Color(0xFFD6D7EF),
      child: ListView.builder(
        itemCount: finishedTasks.length,
        itemBuilder: (BuildContext context, int index) {
          final finishedTask = finishedTasks.values.elementAt(index);
          if (index == 0) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ClearCompletedTasksButton(),
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Task(
                    task: finishedTask,
                    listIndex: listIndex,
                    taskIndex: index,
                  ),
                )
              ],
            );
          }
          return Task(
            task: finishedTask,
            listIndex: listIndex,
            taskIndex: index,
          );
        },
      ),
    );
  }
}

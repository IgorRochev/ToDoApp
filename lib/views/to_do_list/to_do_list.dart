import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/models/task_model.dart';
import 'package:todo_list_app/view_models/app_view_model.dart';
import 'package:todo_list_app/view_models/tasks_lists_change_view_model.dart';
import 'package:todo_list_app/views/components/task.dart';
import 'package:todo_list_app/views/components/to_do_title.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({super.key, required this.listIndex});
  final int listIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFD6D7EF),
      child: Stack(alignment: Alignment.bottomRight, children: [
        TasksList(
          listIndex: listIndex,
        ),
        const AddTaskButton(),
      ]),
    );
  }
}

class TasksList extends StatefulWidget {
  const TasksList({
    super.key,
    required this.listIndex,
  });
  final int listIndex;
  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    final pickedDateTime = context.watch<AppViewModel>().fetchToDoDate;
    final dateTimeNow = context.read<AppViewModel>().fetchDateTimeNow;
    Map<int, TaskModel> tasks = {};
    context
        .read<TasksListsChangeViewModel>()
        .sortTasks(context, pickedDateTime, tasks);

    return Stack(
      children: [
        ListView.builder(
          itemCount: tasks.length,
          padding: const EdgeInsets.only(top: 56),
          itemBuilder: (BuildContext context, int index) {
            final task = tasks.values.elementAt(index);
            final taskIndex = tasks.keys.elementAt(index);
            return Task(
              task: task,
              pickedDateTime: pickedDateTime,
              index: index,
              listIndex: widget.listIndex,
              taskIndex: taskIndex,
            );
          },
        ),
        ToDoTitle(dateTime: pickedDateTime, dateTimeNow: dateTimeNow)
      ],
    );
  }
}

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        iconSize: 70,
        onPressed: () {
          Navigator.pushNamed(context, '/add_task');
        },
        icon: Stack(alignment: Alignment.center, children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          const Icon(
            Icons.add_circle_outlined,
            color: Color(0xFF9395D3),
          ),
        ]));
  }
}

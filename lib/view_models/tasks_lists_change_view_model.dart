import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/models/task_model.dart';
import 'package:todo_list_app/utils/constants.dart';

class TasksListsChangeViewModel extends ChangeNotifier {
  final _activesTasks = Hive.box('ActivesTasks26');
  final _finishedTasks = Hive.box('FinishedTasks26');
  TaskModel _task = TaskModel('', null, null, null, null);

  get finishedTasks => _finishedTasks;
  get activesTasks => _activesTasks;
  TaskModel get task => _task;

  TasksListsChangeViewModel();

  void brightTaskFields() {
    _task = TaskModel('', null, null, null, null);
  }

  void sortTasks(BuildContext context, DateTime pickedDateTime,
      Map<int, TaskModel> tasks) {
    final unsortedTasks =
        context.watch<TasksListsChangeViewModel>()._activesTasks.values;
    Map<int, TaskModel> tasksWithoutDate = {};
    Map<int, TaskModel> tasksWithTodayDate = {};
    Map<int, TaskModel> overdueTasks = {};
    Map<int, TaskModel> tasksForNextDays = {};
    DateTime dateNow =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    DateTime pickedDate =
        DateTime(pickedDateTime.year, pickedDateTime.month, pickedDateTime.day);

    for (int i = 0; i < unsortedTasks.length; i++) {
      if (unsortedTasks.elementAt(i).date == null) {
        tasksWithoutDate.addAll({i: unsortedTasks.elementAt(i)});
        continue;
      }
      final date = DateTime(
          int.parse(unsortedTasks.elementAt(i).date.split(".")[2]),
          int.parse(unsortedTasks.elementAt(i).date.split(".")[1]),
          int.parse(unsortedTasks.elementAt(i).date.split(".")[0]));
      if (date.isAtSameMomentAs(dateNow)) {
        tasksWithTodayDate.addAll({i: unsortedTasks.elementAt(i)});
        continue;
      }
      if (date.isAtSameMomentAs(pickedDate)) {
        tasksForNextDays.addAll({i: unsortedTasks.elementAt(i)});
        continue;
      }
      if (date.isBefore(dateNow)) {
        overdueTasks.addAll({i: unsortedTasks.elementAt(i)});
        continue;
      }
    }
    if (pickedDate.isAtSameMomentAs(dateNow)) {
      tasks.addEntries(overdueTasks.entries);
      tasks.addEntries(tasksWithoutDate.entries);
      tasks.addEntries(tasksWithTodayDate.entries);
    } else {
      tasks.addEntries(tasksWithoutDate.entries);
      tasks.addEntries(tasksForNextDays.entries);
    }
  }

  void addTask(BuildContext context) async {
    await _activesTasks.add(_task);
    notifyListeners();
    if (context.mounted) {
      Navigator.of(context).pop();
    }
  }

  void updateTask(BuildContext context, int index) async {
    _activesTasks.putAt(index, _task);
    notifyListeners();
    if (context.mounted) {
      Navigator.of(context).pop();
    }
  }

  void closeTask(int index) {
    TaskModel task = _activesTasks.getAt(index);
    _finishedTasks.add(task);
    _activesTasks.deleteAt(index);
    notifyListeners();
  }

  void deleteTask(int index, int listIndex) {
    if (listIndex == toDoListIndex) {
      _activesTasks.deleteAt(index);
    } else {
      _finishedTasks.deleteAt(index);
    }

    notifyListeners();
  }

  void clearCompletedTasks(BuildContext context) async {
    await _finishedTasks.clear();
    notifyListeners();
    if (context.mounted) {
      Navigator.of(context).pop();
    }
  }
}

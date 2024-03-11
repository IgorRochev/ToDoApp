import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/models/edit_task_fields_model.dart';
import 'package:todo_list_app/view_models/tasks_lists_change_view_model.dart';

class EditTaskFieldsViewModel extends ChangeNotifier {
  EditTaskFieldsViewModel();
  EditTaskFieldsModel _addTaskModel = EditTaskFieldsModel();
  EditTaskFieldsModel get addTaskModel => _addTaskModel;

  void init(EditTaskFieldsModel addTaskModel) {
    _addTaskModel = addTaskModel;
  }

  void correctFieldsState(BuildContext context, String? date, String? time,
      String title, String? subtitle) {
    bool toCorrectDate = (date != null) ? true : false;
    addTaskModel.dateGiveVerse = toCorrectDate;
    addTaskModel.datePickerOpened = toCorrectDate;
    addTaskModel.currentDate = (toCorrectDate)
        ? DateTime(int.parse(date.split(".")[2]), int.parse(date.split(".")[1]),
            int.parse(date.split(".")[0]))
        : DateTime.now();
    bool toCorrectTime = (time != null) ? true : false;
    addTaskModel.timeGiveVerse = toCorrectTime;
    addTaskModel.timePickerOpened = toCorrectTime;
    addTaskModel.currentTime = (time != null)
        ? TimeOfDay(
            hour: int.parse(time.split(":")[0]),
            minute: int.parse(time.split(":")[1]))
        : TimeOfDay.now();
    addTaskModel.titleController.addListener(() => context
        .read<TasksListsChangeViewModel>()
        .title = addTaskModel.titleController.text);
    addTaskModel.subtitleController.addListener(() => context
        .read<TasksListsChangeViewModel>()
        .subtitle = addTaskModel.subtitleController.text);
    addTaskModel.titleController.text = title;
    addTaskModel.subtitleController.text = subtitle ?? '';
    // notifyListeners();
  }

  Future<void> selectDateToTask(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: addTaskModel.currentDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
      locale: const Locale('ru'),
    );
    addTaskModel.datePickerOpened = addTaskModel.dateGiveVerse;
    notifyListeners();
    if (pickedDate != null && pickedDate != addTaskModel.currentDate) {
      addTaskModel.currentDate = pickedDate;
      if (!context.mounted) return;
      context.read<TasksListsChangeViewModel>().date =
          DateFormat('d.M.y').format(addTaskModel.currentDate).toString();
      notifyListeners();
    }
  }

  void switchDate(BuildContext context, bool newValue) {
    addTaskModel.dateGiveVerse = newValue;
    notifyListeners();
    if (addTaskModel.dateGiveVerse) {
      context.read<TasksListsChangeViewModel>().date =
          DateFormat('d.M.y').format(addTaskModel.currentDate).toString(); //??
    } else {
      addTaskModel.currentDate = DateTime.now();
      context.read<TasksListsChangeViewModel>().date = null;
      if (addTaskModel.timeGiveVerse) {
        addTaskModel.timeGiveVerse = false;
        addTaskModel.timePickerOpened = false;
        addTaskModel.currentTime = TimeOfDay.now();
        context.read<TasksListsChangeViewModel>().time = null;
      }
    }
    notifyListeners();
    if (!addTaskModel.dateGiveVerse) {
      addTaskModel.datePickerOpened = addTaskModel.dateGiveVerse;
      context.read<TasksListsChangeViewModel>().date = null; //??
      notifyListeners();
      return;
    }
    Future.delayed(const Duration(milliseconds: 250), () {
      selectDateToTask(context);
    });
  }

  Future<void> selectTimeToTask(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child ?? Container(),
          );
        },
        context: context,
        initialTime: addTaskModel.currentTime,
        initialEntryMode: TimePickerEntryMode.inputOnly);
    if (pickedTime != null) {
      addTaskModel.currentTime = pickedTime;
      notifyListeners();
      if (!context.mounted) return;
      context.read<TasksListsChangeViewModel>().time =
          addTaskModel.currentTime.format(context);
      notifyListeners();
    }
  }

  void switchTime(BuildContext context, bool newValue) {
    addTaskModel.timeGiveVerse = newValue;
    notifyListeners();
    if (addTaskModel.timeGiveVerse) {
      context.read<TasksListsChangeViewModel>().time =
          addTaskModel.currentTime.format(context);
      if (!addTaskModel.dateGiveVerse) {
        addTaskModel.dateGiveVerse = true;
        addTaskModel.datePickerOpened = addTaskModel.dateGiveVerse;
        context.read<TasksListsChangeViewModel>().date =
            DateFormat('d.M.y').format(addTaskModel.currentDate).toString(); //?
      }
    } else {
      addTaskModel.currentTime = TimeOfDay.now();
      context.read<TasksListsChangeViewModel>().time = null;
    }
    notifyListeners();
    if (!addTaskModel.timeGiveVerse) {
      addTaskModel.timePickerOpened = addTaskModel.timeGiveVerse;
      context.read<TasksListsChangeViewModel>().time = null; //??
      notifyListeners();
      return;
    }
    Future.delayed(const Duration(milliseconds: 250), () {
      selectTimeToTask(context);
    });
    Future.delayed(const Duration(milliseconds: 400), () {
      addTaskModel.timePickerOpened = addTaskModel.timeGiveVerse;
      notifyListeners();
    });
  }
}

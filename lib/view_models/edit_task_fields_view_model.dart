import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/models/edit_task_fields_model.dart';
import 'package:todo_list_app/view_models/tasks_lists_change_view_model.dart';
import 'package:image_picker/image_picker.dart';

class EditTaskFieldsViewModel extends ChangeNotifier {
  EditTaskFieldsViewModel();
  EditTaskFieldsModel _editTaskFieldsModel = EditTaskFieldsModel();
  EditTaskFieldsModel get editTaskFieldsModel => _editTaskFieldsModel;

  void init(EditTaskFieldsModel editTaskFieldsModel) {
    _editTaskFieldsModel = editTaskFieldsModel;
  }

  void correctFieldsState(BuildContext context, String? date, String? time,
      String title, String? subtitle) {
    bool toCorrectDate = (date != null) ? true : false;
    editTaskFieldsModel.dateGiveVerse = toCorrectDate;
    editTaskFieldsModel.datePickerOpened = toCorrectDate;
    editTaskFieldsModel.taskDate = (toCorrectDate)
        ? DateTime(int.parse(date.split(".")[2]), int.parse(date.split(".")[1]),
            int.parse(date.split(".")[0]))
        : DateTime.now();
    bool toCorrectTime = (time != null) ? true : false;
    editTaskFieldsModel.timeGiveVerse = toCorrectTime;
    editTaskFieldsModel.timePickerOpened = toCorrectTime;
    editTaskFieldsModel.taskTime = (time != null)
        ? TimeOfDay(
            hour: int.parse(time.split(":")[0]),
            minute: int.parse(time.split(":")[1]))
        : TimeOfDay.now();
    editTaskFieldsModel.titleController.addListener(() => context
        .read<TasksListsChangeViewModel>()
        .task
        .title = editTaskFieldsModel.titleController.text);
    editTaskFieldsModel.subtitleController.addListener(() => context
        .read<TasksListsChangeViewModel>()
        .task
        .subtitle = editTaskFieldsModel.subtitleController.text);
    editTaskFieldsModel.titleController.text = title;
    editTaskFieldsModel.subtitleController.text = subtitle ?? '';
    context.read<TasksListsChangeViewModel>().task.date = date;
    context.read<TasksListsChangeViewModel>().task.time = time;
  }

  Future<void> selectDateToTask(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: editTaskFieldsModel.taskDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
      locale: const Locale('ru'),
    );
    editTaskFieldsModel.datePickerOpened = editTaskFieldsModel.dateGiveVerse;
    notifyListeners();
    if (pickedDate != null && pickedDate != editTaskFieldsModel.taskDate) {
      editTaskFieldsModel.taskDate = pickedDate;
      if (!context.mounted) return;
      context.read<TasksListsChangeViewModel>().task.date =
          DateFormat('d.M.y').format(editTaskFieldsModel.taskDate).toString();
      notifyListeners();
    }
  }

  void switchDate(BuildContext context, bool newValue) {
    editTaskFieldsModel.dateGiveVerse = newValue;
    notifyListeners();
    if (editTaskFieldsModel.dateGiveVerse) {
      context.read<TasksListsChangeViewModel>().task.date = DateFormat('d.M.y')
          .format(editTaskFieldsModel.taskDate)
          .toString(); //??
    } else {
      editTaskFieldsModel.taskDate = DateTime.now();
      context.read<TasksListsChangeViewModel>().task.date = null;
      if (editTaskFieldsModel.timeGiveVerse) {
        editTaskFieldsModel.timeGiveVerse = false;
        editTaskFieldsModel.timePickerOpened = false;
        editTaskFieldsModel.taskTime = TimeOfDay.now();
        context.read<TasksListsChangeViewModel>().task.time = null;
      }
    }
    notifyListeners();
    if (!editTaskFieldsModel.dateGiveVerse) {
      editTaskFieldsModel.datePickerOpened = editTaskFieldsModel.dateGiveVerse;
      context.read<TasksListsChangeViewModel>().task.date = null; //??
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
        initialTime: editTaskFieldsModel.taskTime,
        initialEntryMode: TimePickerEntryMode.inputOnly);
    if (pickedTime != null) {
      editTaskFieldsModel.taskTime = pickedTime;
      notifyListeners();
      if (!context.mounted) return;
      context.read<TasksListsChangeViewModel>().task.time =
          editTaskFieldsModel.taskTime.format(context);
      notifyListeners();
    }
  }

  void switchTime(BuildContext context, bool newValue) {
    editTaskFieldsModel.timeGiveVerse = newValue;
    notifyListeners();
    if (editTaskFieldsModel.timeGiveVerse) {
      context.read<TasksListsChangeViewModel>().task.time =
          editTaskFieldsModel.taskTime.format(context);
      if (!editTaskFieldsModel.dateGiveVerse) {
        editTaskFieldsModel.dateGiveVerse = true;
        editTaskFieldsModel.datePickerOpened =
            editTaskFieldsModel.dateGiveVerse;
        context.read<TasksListsChangeViewModel>().task.date =
            DateFormat('d.M.y')
                .format(editTaskFieldsModel.taskDate)
                .toString(); //?
      }
    } else {
      editTaskFieldsModel.taskTime = TimeOfDay.now();
      context.read<TasksListsChangeViewModel>().task.time = null;
    }
    notifyListeners();
    if (!editTaskFieldsModel.timeGiveVerse) {
      editTaskFieldsModel.timePickerOpened = editTaskFieldsModel.timeGiveVerse;
      context.read<TasksListsChangeViewModel>().task.time = null; //??
      notifyListeners();
      return;
    }
    Future.delayed(const Duration(milliseconds: 250), () {
      selectTimeToTask(context);
    });
    Future.delayed(const Duration(milliseconds: 400), () {
      editTaskFieldsModel.timePickerOpened = editTaskFieldsModel.timeGiveVerse;
      notifyListeners();
    });
  }

  Future<void> pickImageToTask(BuildContext context) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile == null) return;

    Uint8List imageBytes = await pickedFile.readAsBytes();
    
    if (!context.mounted) return;
    context.read<TasksListsChangeViewModel>().task.imageBytes = imageBytes;
    notifyListeners();
  }
}

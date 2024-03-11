import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/models/app_model.dart';

class AppViewModel extends ChangeNotifier {
  AppViewModel();
  final AppModel _appModel = AppModel();
  AppModel get appModel => _appModel;

  DateTime get fetchDateTimeNow {
    return appModel.dateTimeNow;
  }

  // методы смены даты списка задач
  DateTime get fetchToDoDate {
    return appModel.toDoListDate;
  }

  void updateToDoDate(DateTime taskDate) {
    appModel.toDoListDate = taskDate;
    notifyListeners();
  }

  Future<void> showDateForToDoList(
      BuildContext context, DateTime currentDate, DateTime taskDate) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: taskDate,
      firstDate: currentDate,
      lastDate: DateTime(2050),
      locale: const Locale('ru'),
    );
    if (pickedDate != null && pickedDate != currentDate) {
      if (!context.mounted) return;
      context.read<AppViewModel>().updateToDoDate(pickedDate);
      // notifyListeners();
    }
  }

  // методы смены вкладок на основной странице
  int get fetchCurrentScreenIndex {
    return appModel.screenIndex;
  }

  void updateScreenIndex(int newIndex) {
    appModel.screenIndex = newIndex;
    notifyListeners();
  }
}

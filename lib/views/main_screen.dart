import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/styles/theme/app_colors.dart';
import 'package:todo_list_app/utils/constants.dart';
import 'package:todo_list_app/view_models/app_view_model.dart';
import 'package:todo_list_app/view_models/tasks_lists_change_view_model.dart';
import 'package:todo_list_app/views/finished_to_do_list/finished_to_do_list.dart';
import 'package:todo_list_app/views/components/select_date_for_to_do_list.dart';
import 'package:todo_list_app/views/to_do_list/to_do_list.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  static final List<Widget> _widgetOptions = <Widget>[
    const ToDoListWidget(
      listIndex: toDoListIndex,
    ),
    const FinishedToDoList(
      listIndex: finishedToDoListIndex,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final _screenIndexProvider = context.watch<AppViewModel>();
    int _selectedIndex = _screenIndexProvider.fetchCurrentScreenIndex;
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 68,
        child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (value) => _screenIndexProvider.updateScreenIndex(value),
            selectedItemColor: AppColors.darkPurple,
            unselectedItemColor: const Color(0xff8B8787),
            items: const [
              BottomNavigationBarItem(
                  label: "Задачи",
                  icon: Icon(Icons.format_list_bulleted_outlined)),
              BottomNavigationBarItem(
                  label: "Завершенные", icon: Icon(Icons.done_outlined)),
            ]),
      ),
      appBar: AppBar(
        titleSpacing: 20,
        title: const Text("TODO APP"),
        actions: [
          SelectDateForToDoList(
            index: _selectedIndex,
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: MainScreen._widgetOptions,
      ),
    );
  }
}

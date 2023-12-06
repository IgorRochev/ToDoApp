import 'package:flutter/material.dart';
import 'package:todo_list_app/styles/theme/app_colors.dart';
import 'package:todo_list_app/widgets/finished_to_do_list/finished_to_do_list_widget.dart';
import 'package:todo_list_app/widgets/to_do_list/to_do_list_widget.dart';
import 'package:hive/hive.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({super.key});

  static List<Widget> _widgetOptions = <Widget>[
    ToDoListWidget(),
    FinishedToDoListWidget(),
  ];

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 68,
        child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            selectedItemColor: AppColors.DarkPurple,
            unselectedItemColor: const Color(0xff8B8787),
            items: const [
              BottomNavigationBarItem(
                  label: "All",
                  icon: Icon(Icons.format_list_bulleted_outlined)),
              BottomNavigationBarItem(
                  label: "Completed", icon: Icon(Icons.done_outlined)),
            ]),
      ),
      appBar: AppBar(
        titleSpacing: 20,
        title: const Text("TODO APP"),
      ),
      body: MainWidget._widgetOptions.elementAt(_selectedIndex),
    );
  }
}

class Model extends ChangeNotifier {
  var box = Hive.box('ActivesTasks3');
  String title;
  String? subtitle;

  Model({required this.title, this.subtitle});

  void addTask(BuildContext context) async {
    final task = Task(title, subtitle);
    await box.add(task);
    notifyListeners();
    if (context.mounted) {
      Navigator.of(context).pop();
    }
  }
}

@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String? subtitle;

  Task(this.title, this.subtitle);
}

class TaskAdapter extends TypeAdapter<Task> {
  @override
  final typeId = 0;

  @override
  Task read(BinaryReader reader) {
    final title = reader.read();
    final subtitle = reader.read();
    return Task(title, subtitle);
  }

  @override
  void write(BinaryWriter writer, Task obj) {
    writer.write(obj.title);
    writer.write(obj.subtitle);
  }
}

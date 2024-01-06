import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/styles/theme/app_colors.dart';
import 'package:todo_list_app/widgets/finished_to_do_list/finished_to_do_list_widget.dart';
import 'package:todo_list_app/widgets/to_do_list/to_do_list_widget.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

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

  DateTime currentDate = DateTime.now();
  late DateTime taskDate = currentDate;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: taskDate,
      firstDate: currentDate,
      lastDate: DateTime(2050),
      locale: Locale('ru'),
    );
    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        taskDate = pickedDate;

        context.read<Model>().updateTaskList(taskDate);
      });
    }
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
        actions: [
          Container(
            width: 60,
            height: 60,
            child: Stack(
              alignment: Alignment.center,
              children: [
                IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    iconSize: 35,
                    onPressed: () {
                      _selectDate(context);
                    },
                    icon: Icon(
                      Icons.calendar_today_outlined,
                      color: Color(0xFFFFFFFF),
                    )),
                Padding(
                  padding: EdgeInsets.only(top: 9),
                  child: Text(
                    DateFormat('d').format(taskDate).toString(),
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Jost"),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 7,
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: MainWidget._widgetOptions,
      ),
    );
  }
}

class Model extends ChangeNotifier {
  var ActivesTasks = Hive.box('ActivesTasks12');
  var FinishedTasks = Hive.box('FinishedTasks8');
  String title;
  String? subtitle;
  String? date;
  String? time;
  DateTime dateTime;

  Model({
    required this.title,
    this.subtitle,
    this.date,
    this.time,
    required this.dateTime,
  });

  void updateTaskList(DateTime taskDate) {
    dateTime = taskDate;
    notifyListeners();
  }

  void addTask(BuildContext context) async {
    final task = Task(title, subtitle, date, time);
    await ActivesTasks.add(task);
    notifyListeners();
    if (context.mounted) {
      Navigator.of(context).pop();
    }
  }

  void updateTask(BuildContext context, int index) async {
    ActivesTasks.putAt(index, Task(title, subtitle, date, time));
    notifyListeners();
    if (context.mounted) {
      Navigator.of(context).pop();
    }
  }

  void closeTask(int index) {
    Task task = ActivesTasks.getAt(index);
    FinishedTasks.add(task);
    ActivesTasks.deleteAt(index);
    print(ActivesTasks);
    notifyListeners();
  }

  void deleteTask(int index) {
    ActivesTasks.deleteAt(index);
    notifyListeners();
  }
}

@HiveType(typeId: 0)
class Task {
  @HiveField(0)
  String title;

  @HiveField(1)
  String? subtitle;

  @HiveField(2)
  String? date;

  @HiveField(3)
  String? time;

  Task(this.title, this.subtitle, this.date, this.time);
}

class TaskAdapter extends TypeAdapter<Task> {
  @override
  final typeId = 0;

  @override
  Task read(BinaryReader reader) {
    final title = reader.read();
    final subtitle = reader.read();
    final date = reader.read();
    final time = reader.read();
    return Task(title, subtitle, date, time);
  }

  @override
  void write(BinaryWriter writer, Task obj) {
    writer.write(obj.title);
    writer.write(obj.subtitle);
    writer.write(obj.date);
    writer.write(obj.time);
  }
}

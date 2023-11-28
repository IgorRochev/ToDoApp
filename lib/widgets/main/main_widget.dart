import 'package:flutter/material.dart';
import 'package:todo_list_app/widgets/finished_to_do_list/finished_to_do_list_widget.dart';
import 'package:todo_list_app/widgets/to_do_list/to_do_list_widget.dart';

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
            selectedItemColor: Color(0xFF9395D3),
            unselectedItemColor: Color(0xff8B8787),
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
        toolbarHeight: 74,
        title: Text("TODO APP"),
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontFamily: "Jost",
          fontWeight: FontWeight.w600,
        ),
        backgroundColor: Color(0xFF9395D3),
      ),
      body: MainWidget._widgetOptions.elementAt(_selectedIndex),
    );
  }
}

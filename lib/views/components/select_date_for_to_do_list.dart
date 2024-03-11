import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/view_models/app_view_model.dart';
import 'package:intl/intl.dart';

class SelectDateForToDoList extends StatefulWidget {
  final int index;

  const SelectDateForToDoList({
    super.key,
    required this.index,
  });

  @override
  State<SelectDateForToDoList> createState() => _SelectDateForToDoListState();
}

class _SelectDateForToDoListState extends State<SelectDateForToDoList> {
  DateTime currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    DateTime taskDate = context.watch<AppViewModel>().fetchToDoDate;
    return IndexedStack(
      alignment: Alignment.center,
      index: widget.index,
      children: [
        Row(
          children: [
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
                        context.read<AppViewModel>().showDateForToDoList(
                            context, currentDate, taskDate);
                      },
                      icon: const Icon(
                        Icons.calendar_today_outlined,
                        color: Color(0xFFFFFFFF),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 11),
                    child: Text(
                      DateFormat('d').format(taskDate).toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Jost",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox.shrink(),
      ],
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:todo_list_app/styles/theme/app_colors.dart';
import 'package:todo_list_app/styles/theme/button_styles.dart';
import 'package:todo_list_app/widgets/main_widget.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class AddTaskWidget extends StatefulWidget {
  const AddTaskWidget({super.key});

  @override
  State<AddTaskWidget> createState() => _AddTaskWidgetState();
}

class _AddTaskWidgetState extends State<AddTaskWidget> {
  final _formKey1 = GlobalKey<FormState>();

  DateTime currentDate = DateTime.now();
  bool _addDateGiveVerse = false;
  bool _addDatePickerOpened = false;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2015),
      lastDate: DateTime(2050),
      locale: Locale('ru'),
    );
    setState(() {
      _addDatePickerOpened = _addDateGiveVerse;
    });
    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        currentDate = pickedDate;
        context.read<Model>().date =
            DateFormat('d.M.y').format(currentDate).toString();
      });
    }
  }

  bool _addTimeGiveVerse = false;
  bool _addTimePickerOpened = false;
  TimeOfDay currentTime = TimeOfDay.now();
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: currentTime,
        initialEntryMode: TimePickerEntryMode.inputOnly);
    if (pickedTime != null)
      setState(() {
        currentTime = pickedTime;
        context.read<Model>().time = currentTime.format(context);
      });
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<Model>().subtitle = null;
    context.read<Model>().date = null;
    context.read<Model>().time = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Task"),
      ),
      backgroundColor: Color(0xFFFFFFFF),
      body: Container(
        alignment: Alignment.center,
        child: Form(
            key: _formKey1,
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: TextFormField(
                    onChanged: (value) => {context.read<Model>().title = value},
                    decoration: InputDecoration(
                      label: Text("Title"),
                      labelStyle: TextStyle(color: Color(0xFF8B8787)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFF8B8787), width: 1)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFF8B8787), width: 1)),
                    ),
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Text is empty';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: TextFormField(
                    onChanged: (value) =>
                        {context.read<Model>().subtitle = value},
                    decoration: InputDecoration(
                        label: Text("Detail"),
                        labelStyle: TextStyle(color: Color(0xFF8B8787)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xFF8B8787), width: 1)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF8B8787), width: 1))),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children: [
                      TextButton(
                          style: ButtonStyle(
                            minimumSize: MaterialStatePropertyAll(Size(0, 50)),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            padding: MaterialStatePropertyAll(EdgeInsets.only(
                                left: 8, right: 8, top: 4, bottom: 4)),
                            side: MaterialStatePropertyAll(
                                BorderSide(width: 0.7)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                          ),
                          onPressed: !_addDateGiveVerse
                              ? null
                              : () => _selectDate(context),
                          child: Row(
                            children: [
                              Icon(
                                Icons.calendar_month_outlined,
                                color: AppColors.DarkPurple,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Дата",
                                    style: TextStyle(color: Color(0xFF8B8787)),
                                  ),
                                  if (_addDateGiveVerse &
                                      _addDatePickerOpened) ...[
                                    Text(DateFormat('d.M.y')
                                        .format(currentDate)
                                        .toString())
                                  ],
                                ],
                              ),
                            ],
                          )),
                      Switch(
                        activeColor: AppColors.DarkPurple,
                        inactiveThumbColor:
                            AppColors.DarkPurple.withOpacity(0.6),
                        activeTrackColor: Color(0xFF8B8787).withOpacity(0.5),
                        inactiveTrackColor: Color(0xFF8B8787).withOpacity(0.4),
                        value: _addDateGiveVerse,
                        onChanged: (bool newValue) {
                          setState(() {
                            _addDateGiveVerse = newValue;
                            if (_addDateGiveVerse) {
                              context.read<Model>().date = DateFormat('d.M.y')
                                  .format(currentDate)
                                  .toString();
                            } else {
                              currentDate = DateTime.now();
                              context.read<Model>().date = null;
                              if (_addTimeGiveVerse) {
                                _addTimeGiveVerse = false;
                                _addTimePickerOpened = false;
                                currentTime = TimeOfDay.now();
                                context.read<Model>().time = null;
                              }
                            }
                          });
                          if (!_addDateGiveVerse) {
                            _addDatePickerOpened = _addDateGiveVerse;
                            return;
                          }
                          Future.delayed(Duration(milliseconds: 250), () {
                            _selectDate(context);
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children: [
                      TextButton(
                          style: ButtonStyle(
                            minimumSize: MaterialStatePropertyAll(Size(0, 50)),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            padding: MaterialStatePropertyAll(EdgeInsets.only(
                                left: 8, right: 8, top: 4, bottom: 4)),
                            side: MaterialStatePropertyAll(
                                BorderSide(width: 0.7)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                          ),
                          onPressed: !_addTimeGiveVerse
                              ? null
                              : () => _selectTime(context),
                          child: Row(
                            children: [
                              Icon(
                                Icons.timer,
                                color: AppColors.DarkPurple,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Время",
                                    style: TextStyle(color: Color(0xFF8B8787)),
                                  ),
                                  if (_addTimeGiveVerse &
                                      _addTimePickerOpened) ...[
                                    Text(currentTime.format(context))
                                  ],
                                ],
                              ),
                            ],
                          )),
                      Switch(
                        activeColor: AppColors.DarkPurple,
                        inactiveThumbColor:
                            AppColors.DarkPurple.withOpacity(0.6),
                        activeTrackColor: Color(0xFF8B8787).withOpacity(0.5),
                        inactiveTrackColor: Color(0xFF8B8787).withOpacity(0.4),
                        value: _addTimeGiveVerse,
                        onChanged: (bool newValue) {
                          setState(() {
                            _addTimeGiveVerse = newValue;
                            if (_addTimeGiveVerse) {
                              context.read<Model>().time =
                                  currentTime.format(context);
                              if (!_addDateGiveVerse) {
                                _addDateGiveVerse = true;
                                _addDatePickerOpened = _addDateGiveVerse;
                                context.read<Model>().date = DateFormat('d.M.y')
                                    .format(currentDate)
                                    .toString();
                              }
                            } else {
                              currentTime = TimeOfDay.now();
                              context.read<Model>().time = null;
                            }
                          });
                          if (!_addTimeGiveVerse) {
                            _addTimePickerOpened = _addTimeGiveVerse;
                            return;
                          }
                          Future.delayed(Duration(milliseconds: 250), () {
                            _selectTime(context);
                          });
                          Future.delayed(Duration(milliseconds: 400), () {
                            setState(() {
                              _addTimePickerOpened = _addTimeGiveVerse;
                            });
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Container(
                  width: double.infinity,
                  height: 65,
                  padding: EdgeInsets.only(left: 14, right: 14),
                  child: AddButtonWidget(
                    formkey: _formKey1,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class AddButtonWidget extends StatelessWidget {
  final formkey;
  const AddButtonWidget({
    super.key,
    this.formkey,
  });

  @override
  Widget build(BuildContext context) {
    // String currentDate = Text(DateFormat('d.M.y').format(date).toString());
    final onPressed = context.read<Model>();
    return TextButton(
        onPressed: () {
          if (formkey.currentState.validate()) {
            onPressed.addTask(context);
          }
        },
        child: Text(
          "add task",
          style: TextStyle(color: Color(0xFFFFFFFF)),
        ),
        style: ButtonStyle(
            textStyle: ButtonsStyles.AddTaskButtonTextStyle,
            backgroundColor: MaterialStatePropertyAll(AppColors.DarkPurple),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ))));
  }
}

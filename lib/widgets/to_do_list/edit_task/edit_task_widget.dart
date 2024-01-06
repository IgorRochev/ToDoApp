import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/styles/theme/app_colors.dart';
import 'package:todo_list_app/styles/theme/button_styles.dart';
import 'package:todo_list_app/widgets/main_widget.dart';
import 'package:intl/intl.dart';

class EditTaskWidget extends StatefulWidget {
  const EditTaskWidget({super.key});

  @override
  State<EditTaskWidget> createState() => _EditTaskWidgetState();
}

class _EditTaskWidgetState extends State<EditTaskWidget> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  late int index = ModalRoute.of(context)!.settings.arguments as int;
  late final box1 = context.read<Model>().ActivesTasks.values;
  late final ActiveTasks = box1.elementAt(index);

  late bool _dateGiveVerse = ActiveTasks.date != null ? true : false;
  late bool _datePickerOpened = _dateGiveVerse;
  DateTime currentDate = DateTime.now();
  late DateTime taskDate = (ActiveTasks.date != null)
      ? DateTime(
          int.parse(ActiveTasks.date.split(".")[2]),
          int.parse(ActiveTasks.date.split(".")[1]),
          int.parse(ActiveTasks.date.split(".")[0]))
      : currentDate;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: taskDate,
      firstDate: DateTime(2015),
      lastDate: DateTime(2050),
      locale: Locale('ru'),
    );
    setState(() {
      _datePickerOpened = _dateGiveVerse;
    });
    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        taskDate = pickedDate;
        context.read<Model>().date =
            DateFormat('d.M.y').format(taskDate).toString();
      });
    }
  }

  late bool _timeGiveVerse = ActiveTasks.time != null ? true : false;
  late bool _timePickerOpened = _timeGiveVerse;
  TimeOfDay currentTime = TimeOfDay.now();
  late TimeOfDay taskTime = (ActiveTasks.time != null)
      ? TimeOfDay(
          hour: int.parse(ActiveTasks.time.split(":")[0]),
          minute: int.parse(ActiveTasks.time.split(":")[1]))
      : currentTime;
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: taskTime,
        initialEntryMode: TimePickerEntryMode.inputOnly);

    if (pickedTime != null) {
      setState(() {
        taskTime = pickedTime;
        context.read<Model>().time = taskTime.format(context);
      });
    }
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    controller1
        .addListener(() => context.read<Model>().title = controller1.text);
    controller2
        .addListener(() => context.read<Model>().subtitle = controller2.text);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // context.read<Model>().date = ActiveTasks.date;
    // context.read<Model>().time = null;
    controller1.text = ActiveTasks.title;
    controller2.text =
        (ActiveTasks.subtitle == null) ? '' : ActiveTasks.subtitle;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Task"),
      ),
      backgroundColor: Color(0xFFFFFFFF),
      body: Container(
        alignment: Alignment.center,
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: TextFormField(
                    controller: controller1,
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
                    controller: controller2,
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
                          onPressed: !_dateGiveVerse
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
                                  if (_dateGiveVerse & _datePickerOpened) ...[
                                    Text(DateFormat('d.M.y')
                                        .format(taskDate)
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
                        value: _dateGiveVerse,
                        onChanged: (bool newValue) {
                          setState(() {
                            _dateGiveVerse = newValue;
                            // taskDate = currentDate;
                            if (_dateGiveVerse) {
                              context.read<Model>().date = DateFormat('d.M.y')
                                  .format(currentDate)
                                  .toString();
                            } else {
                              taskDate = DateTime.now();
                              context.read<Model>().date = null;
                              if (_timeGiveVerse) {
                                _timeGiveVerse = false;
                                _timePickerOpened = false;
                                taskTime = TimeOfDay.now();
                                context.read<Model>().time = null;
                              }
                            }
                          });
                          if (!_dateGiveVerse) {
                            _datePickerOpened = _dateGiveVerse;
                            context.read<Model>().date = null;
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
                          onPressed: !_timeGiveVerse
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
                                  if (_timeGiveVerse & _timePickerOpened) ...[
                                    Text(taskTime.format(context))
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
                        value: _timeGiveVerse,
                        onChanged: (bool newValue) {
                          setState(() {
                            _timeGiveVerse = newValue;
                            // taskTime = currentTime;
                            if (_timeGiveVerse) {
                              context.read<Model>().time =
                                  currentTime.format(context);
                              if (!_dateGiveVerse) {
                                _dateGiveVerse = true;
                                _datePickerOpened = _dateGiveVerse;
                                context.read<Model>().date = DateFormat('d.M.y')
                                    .format(currentDate)
                                    .toString();
                              }
                            } else {
                              taskTime = TimeOfDay.now();
                              context.read<Model>().time = null;
                            }
                          });
                          if (!_timeGiveVerse) {
                            _timePickerOpened = _timeGiveVerse;
                            context.read<Model>().time = null;
                            return;
                          }
                          Future.delayed(Duration(milliseconds: 250), () {
                            _selectTime(context);
                          });
                          Future.delayed(Duration(milliseconds: 400), () {
                            setState(() {
                              _timePickerOpened = _timeGiveVerse;
                            });
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 14, right: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          height: 65,
                          child: UpdateButtonWidget(
                            index: index,
                            formkey: _formKey,
                            date: _dateGiveVerse
                                ? DateFormat('d.M.y')
                                    .format(taskDate)
                                    .toString()
                                : null,
                            time: _timeGiveVerse
                                ? taskTime.format(context)
                                : null,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 46,
                      ),
                      Expanded(
                        child: Container(
                          height: 65,
                          child: CancelButtonWidget(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class CancelButtonWidget extends StatelessWidget {
  const CancelButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => {Navigator.of(context).pop()},
        child: Text(
          "Cancel",
          style: TextStyle(color: Color(0xFFFFFFFF)),
        ),
        style: ButtonStyle(
            textStyle: ButtonsStyles.EditTaskButtonsTextStyle,
            backgroundColor: MaterialStatePropertyAll(AppColors.DarkPurple),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ))));
  }
}

class UpdateButtonWidget extends StatelessWidget {
  final index;
  final formkey;
  final date;
  final time;
  const UpdateButtonWidget({
    super.key,
    this.index,
    this.formkey,
    this.date,
    this.time,
  });

  @override
  Widget build(BuildContext context) {
    final onPressed = context.read<Model>();
    return TextButton(
        onPressed: () {
          context.read<Model>().date = date;
          context.read<Model>().time = time;
          if (formkey.currentState.validate()) {
            onPressed.updateTask(context, index);
          }
        },
        style: ButtonStyle(
            textStyle: ButtonsStyles.EditTaskButtonsTextStyle,
            backgroundColor: MaterialStatePropertyAll(AppColors.DarkPurple),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ))),
        child: const Text(
          "Update",
          style: TextStyle(color: Color(0xFFFFFFFF)),
        ));
  }
}

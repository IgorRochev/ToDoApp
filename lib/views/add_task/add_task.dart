import 'package:flutter/material.dart';
import 'package:todo_list_app/models/edit_task_fields_model.dart';
import 'package:todo_list_app/view_models/edit_task_fields_view_model.dart';
import 'package:todo_list_app/view_models/tasks_lists_change_view_model.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/views/components/add_task_button.dart';
import 'package:todo_list_app/views/components/add_task_details_text_field.dart';
import 'package:todo_list_app/views/components/switch_date_button.dart';
import 'package:todo_list_app/views/components/switch_time_button.dart';
import 'package:todo_list_app/views/components/add_task_title_text_field.dart';

class AddTaskWidget extends StatefulWidget {
  const AddTaskWidget({super.key});

  @override
  State<AddTaskWidget> createState() => _AddTaskWidgetState();
}

class _AddTaskWidgetState extends State<AddTaskWidget> {
  final _formKey1 = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // context.read<TasksListsChangeViewModel>().subtitle = null;
    // context.read<TasksListsChangeViewModel>().date = null;
    // context.read<TasksListsChangeViewModel>().time = null;
    context.read<EditTaskFieldsViewModel>().init(EditTaskFieldsModel());
  }

  late TasksListsChangeViewModel task;
  @override
  Widget build(BuildContext context) {
    EditTaskFieldsViewModel addTask = context.watch<EditTaskFieldsViewModel>();
    task = context.read<TasksListsChangeViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Новая задача"),
      ),
      backgroundColor: const Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Form(
              key: _formKey1,
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const AddTaskTitleTextField(),
                  const SizedBox(
                    height: 40,
                  ),
                  const AddTaskDetailsTextField(),
                  const SizedBox(
                    height: 35,
                  ),
                  SwitchDateButton(addTask: addTask),
                  const SizedBox(
                    height: 35,
                  ),
                  SwitchTimeButton(addTask: addTask),
                  const SizedBox(
                    height: 35,
                  ),
                  Container(
                    width: double.infinity,
                    height: 65,
                    padding: const EdgeInsets.only(left: 14, right: 14),
                    child: AddTaskButton(
                      formkey: _formKey1,
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  @override
  void dispose() {
    task.brightTaskFields();
    // context.read<TasksListsChangeViewModel>().brightTaskFields();
    super.dispose();
  }
}

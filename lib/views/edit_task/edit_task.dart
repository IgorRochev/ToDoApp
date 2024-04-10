// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_list_app/models/edit_task_fields_model.dart';
import 'package:todo_list_app/view_models/tasks_lists_change_view_model.dart';
import 'package:todo_list_app/view_models/edit_task_fields_view_model.dart';
import 'package:todo_list_app/views/components/cancel_edit_task_button.dart';
import 'package:todo_list_app/views/components/edit_task_details_text_field.dart';
import 'package:todo_list_app/views/components/edit_task_title_text_field.dart';
import 'package:todo_list_app/views/components/switch_date_button.dart';
import 'package:todo_list_app/views/components/switch_time_button.dart';
import 'package:todo_list_app/views/components/update_task_button.dart';

class EditTask extends StatefulWidget {
  final int index;
  const EditTask({
    super.key,
    required this.index,
  });
  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  final _formKey = GlobalKey<FormState>();
  late TasksListsChangeViewModel task;

  @override
  void initState() {
    int index = widget.index;
    final box = context.read<TasksListsChangeViewModel>().activesTasks.values;
    final activeTasks = box.elementAt(index);
    // print(activeTasks.imageBytes);
    context.read<EditTaskFieldsViewModel>().init(EditTaskFieldsModel());
    context.read<EditTaskFieldsViewModel>().correctFieldsState(
        context,
        activeTasks.date,
        activeTasks.time,
        activeTasks.title,
        activeTasks.subtitle);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    EditTaskFieldsViewModel editTask = context.watch<EditTaskFieldsViewModel>();
    task = context.read<TasksListsChangeViewModel>();
    // print(task.task.imageBytes);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Редактировать задачу"),
      ),
      backgroundColor: const Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  EditTaskTitleTextField(
                      titleController:
                          editTask.editTaskFieldsModel.titleController),
                  const SizedBox(
                    height: 40,
                  ),
                  EditTaskDetailsTextField(
                      subtitleController:
                          editTask.editTaskFieldsModel.subtitleController),
                  const SizedBox(
                    height: 35,
                  ),
                  SwitchDateButton(addTask: editTask),
                  const SizedBox(
                    height: 35,
                  ),
                  SwitchTimeButton(addTask: editTask),
                  const SizedBox(
                    height: 40,
                  ),
                  // if (task.task.imageBytes != null) ...[
                  //   Image.memory(task.task.imageBytes![0])
                  // ],
                  Padding(
                    padding: const EdgeInsets.only(left: 14, right: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 65,
                            child: UpdateTaskButton(
                              index: widget.index,
                              formkey: _formKey,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 46,
                        ),
                        const Expanded(
                          child: SizedBox(
                            height: 65,
                            child: CancelEditButton(),
                          ),
                        ),
                      ],
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
    super.dispose();
    task.brightTaskFields();
  }
}

import 'package:flutter/material.dart';
import 'package:todo_list_app/styles/theme/app_colors.dart';
import 'package:todo_list_app/widgets/to_do_subtitle/to_do_subtitle_widget.dart';
import 'package:todo_list_app/widgets/to_do_title/to_do_title_widget.dart';
// import 'package:todo_list_app/styles/theme/task_decoration.dart';

class ToDoListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFD6D7EF),
      child: Stack(alignment: Alignment.bottomRight, children: [
        TasksListWidget(),
        AddTaskButtonWidget(),
      ]),
    );
  }
}

class TasksListWidget extends StatelessWidget {
  TasksListWidget({
    super.key,
  });

  final TaskDecoration = BoxDecoration(
    color: Color(0xFFFFFFFF),
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.25),
        blurRadius: 4,
        offset: Offset(0, 4),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 21),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(right: 10, left: 4, bottom: 21),
          child: Container(
            height: 82,
            decoration: TaskDecoration,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 18, right: 25, top: 15, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [ToDoTitleWidget(), ToDoSubtitleWidget()],
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Row(
                    children: [EditTaskButtonWidget(), CloseTaskButtonWidget()],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class AddTaskButtonWidget extends StatelessWidget {
  const AddTaskButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        iconSize: 70,
        onPressed: () {
          Navigator.pushNamed(context, '/main/add_task');
        },
        icon: Icon(
          Icons.add_circle_outlined,
          color: Color(0xFF9395D3),
        ));
  }
}

class CloseTaskButtonWidget extends StatelessWidget {
  const CloseTaskButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        color: AppColors.LightPurple,
        onPressed: null,
        icon: Icon(
          Icons.check_circle_outline_outlined,
          size: 25,
          color: AppColors.LightPurple,
        ));
  }
}

class EditTaskButtonWidget extends StatelessWidget {
  const EditTaskButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pushNamed(context, '/main/edit_task');
        },
        icon: Icon(
          Icons.mode_edit_outline_outlined,
          size: 25,
          color: AppColors.LightPurple,
        ));
  }
}

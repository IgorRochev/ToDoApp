import 'package:flutter/material.dart';
import 'package:todo_list_app/styles/theme/app_colors.dart';
import 'package:todo_list_app/styles/theme/button_styles.dart';
import 'package:todo_list_app/widgets/main_widget.dart';
import 'package:todo_list_app/widgets/to_do_list/detail_text_field/detail_text_field_widget.dart';
import 'package:todo_list_app/widgets/to_do_list/title_text_field/title_text_filed_widget.dart';
import 'package:provider/provider.dart';

class AddTaskWidget extends StatefulWidget {
  const AddTaskWidget({super.key});

  @override
  State<AddTaskWidget> createState() => _AddTaskWidgetState();
}

class _AddTaskWidgetState extends State<AddTaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Task"),
      ),
      backgroundColor: Color(0xFFFFFFFF),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: SizedBox(
                // height: 29,
                child: TitleTextFiledWidget(),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: SizedBox(
                // height: 29,
                child: DetailTextFieldWidget(),
              ),
            ),
            SizedBox(
              height: 54,
            ),
            Container(
              width: double.infinity,
              height: 65,
              padding: EdgeInsets.only(left: 14, right: 14),
              child: AddButtonWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

class AddButtonWidget extends StatefulWidget {
  const AddButtonWidget({
    super.key,
  });

  @override
  State<AddButtonWidget> createState() => _AddButtonWidgetState();
}

class _AddButtonWidgetState extends State<AddButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final onPressed = context.read<Model>();
    return TextButton(
        onPressed: () => {onPressed.addTask(context)},
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

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
  final _formKey1 = GlobalKey<FormState>();
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
                  height: 54,
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

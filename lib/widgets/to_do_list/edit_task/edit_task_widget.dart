import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/styles/theme/app_colors.dart';
import 'package:todo_list_app/styles/theme/button_styles.dart';
import 'package:todo_list_app/widgets/main_widget.dart';

class EditTaskWidget extends StatefulWidget {
  const EditTaskWidget({super.key});

  @override
  State<EditTaskWidget> createState() => _EditTaskWidgetState();
}

class _EditTaskWidgetState extends State<EditTaskWidget> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  void initState() {
    // TODO: implement initState
    super.initState();
    controller1.addListener(() {
      context.read<Model>().title = controller1.text;
      context.read<Model>().validate = controller1.text.isEmpty;
    });
    controller2
        .addListener(() => context.read<Model>().subtitle = controller2.text);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // print(1);
    int index = ModalRoute.of(context)!.settings.arguments as int;
    final box1 = context.read<Model>().ActivesTasks.values;
    final ActiveTasks = box1.elementAt(index);
    controller1.text = ActiveTasks.title;
    controller2.text = ActiveTasks.subtitle;
    bool validator = context.read<Model>().validate;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Task"),
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
                child: TextField(
                  controller: controller1,
                  cursorColor: Color(0xFF8B8787),
                  decoration: InputDecoration(
                    errorText: validator ? "Value Can't Be Empty" : null,
                    labelStyle: TextStyle(color: Color(0xFF8B8787)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF8B8787), width: 1)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF8B8787), width: 1)),
                    label: Text("Title"),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: SizedBox(
                // height: 29,
                child: TextField(
                  controller: controller2,
                  onChanged: null,
                  cursorColor: Color(0xFF8B8787),
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Color(0xFF8B8787)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF8B8787), width: 1)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF8B8787), width: 1)),
                    label: Text("Detail"),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 54,
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
                          validate: validator,
                          controller: controller1),
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
        ),
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

class UpdateButtonWidget extends StatefulWidget {
  final index;
  bool validate;
  var controller;
  UpdateButtonWidget({
    super.key,
    this.index,
    required this.validate,
    this.controller,
  });

  @override
  State<UpdateButtonWidget> createState() => _UpdateButtonWidgetState();
}

class _UpdateButtonWidgetState extends State<UpdateButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final onPressed = context.read<Model>();
    return TextButton(
        onPressed: () {
          context.read<Model>().isValidate();

          if (!context.read<Model>().validate) {
            // print(context.read<Model>().validate);
            onPressed.updateTask(
              context,
              widget.index,
            );
          }
          ;
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

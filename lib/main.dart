import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/services/local_notification_service.dart';
import 'package:todo_list_app/utils/init_hive.dart';
import 'package:todo_list_app/view_models/app_view_model.dart';
import 'package:todo_list_app/view_models/edit_task_fields_view_model.dart';
import 'package:todo_list_app/view_models/tasks_lists_change_view_model.dart';
import 'package:todo_list_app/views/edit_task/edit_task.dart';
import 'views/main_screen.dart';
import 'views/add_task/add_task.dart';
import 'package:todo_list_app/styles/theme/app_colors.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  LocalNotificationService.initialize();
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppViewModel>(create: (_) => AppViewModel()),
        ChangeNotifierProvider<TasksListsChangeViewModel>(
            create: (_) => TasksListsChangeViewModel()),
        ChangeNotifierProvider<EditTaskFieldsViewModel>(
            create: (_) => EditTaskFieldsViewModel()),
      ],
      child: MaterialApp(
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        supportedLocales: const [Locale('ru')],
        title: 'To Do App',
        theme: ThemeData(
          useMaterial3: false,
          appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.darkPurple,
              toolbarHeight: 74,
              titleTextStyle: TextStyle(
                fontSize: 24,
                fontFamily: "Jost",
                fontWeight: FontWeight.w600,
              )),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const MainScreen(),
          '/add_task': (context) => const AddTaskWidget(),
        },
        onGenerateRoute: (settings) {
          int index = settings.arguments as int;
          var routes = <String, WidgetBuilder>{
            "/edit_task": (ctx) => EditTask(index: index),
          };
          if (settings.name == '/edit_task') {
            WidgetBuilder builder = routes[settings.name]!;
            return MaterialPageRoute(builder: (ctx) => builder(ctx));
          }
          return null;
        },
      ),
    );
  }
}

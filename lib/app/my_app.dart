import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/ui/todo_list_theme.dart';
import 'modules/home/home_module.dart';
import 'modules/splash/splash_module.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: TodoListTheme.title,
      theme: TodoListTheme.theme,
      getPages: [
        ...SplashModule().routers,
        ...HomeModule().routers,
      ],
    );
  }
}

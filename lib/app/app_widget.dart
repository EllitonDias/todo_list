import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'core/bindings/app_bindings.dart';
import 'core/ui/todo_list_theme.dart';
import 'modules/home/home_module.dart';
import 'modules/splash/splash_module.dart';
import 'modules/tasks/tasks_module.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: TodoListTheme.title,
      theme: TodoListTheme.theme,
      debugShowCheckedModeBanner: false,
      initialBinding: AppBindings(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
      getPages: [
        ...SplashModule().routers,
        ...HomeModule().routers,
        ...TasksModule().routers,
      ],
    );
  }
}

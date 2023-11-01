import 'package:get/get.dart';

import '../../core/modules/module.dart';
import '../../core/ui/constants.dart';
import 'tasks_bindings.dart';
import 'tasks_page.dart';

class TasksModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: RoutersConstants.tasks,
      page: () => const TasksPage(),
      binding: TasksBindings(),
      transition: Transition.fadeIn,
    ),
  ];
}

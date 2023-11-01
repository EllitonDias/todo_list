import 'package:get/get.dart';
import './tasks_controller.dart';

class TasksBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(TasksController( tasksService: Get.find()));
    }
}
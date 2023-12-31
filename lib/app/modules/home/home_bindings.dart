import 'package:get/get.dart';
import './home_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      HomeController(
        tasksService: Get.find(),
        result: Get.arguments,
      ),
    );
  }
}

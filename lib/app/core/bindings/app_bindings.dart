import 'package:get/get.dart';

import '../../repositories/tasks/tasks_repository.dart';
import '../../repositories/tasks/tasks_repository_impl.dart';
import '../../services/tasks/tasks_service.dart';
import '../../services/tasks/tasks_service_impl.dart';
import '../database/sqlite_connection_factory.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SqliteConnectionFactory(),
      fenix: true,
    );
    Get.lazyPut<TasksRepository>(
      () => TasksRepositoryImpl(
        sqliteConnectionFactory: Get.find(),
      ),
      fenix: true,
    );
    Get.lazyPut<TasksService>(
      () => TasksServiceImpl(
        tasksRepository: Get.find(),
      ),
      fenix: true,
    );
  }
}

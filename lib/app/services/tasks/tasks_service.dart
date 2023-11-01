import '../../models/task_model.dart';

abstract interface class TasksService {
  Future<void> create(DateTime dateTime, String description);
  Future<List<TaskModel>> findAll();
  Future<void> checkOrUncheckTask(TaskModel taskModel);
  Future<void> delete(TaskModel taskModel);
}

import '../../models/task_model.dart';
import '../../repositories/tasks/tasks_repository.dart';
import './tasks_service.dart';

class TasksServiceImpl implements TasksService {
  final TasksRepository _tasksRepository;

  TasksServiceImpl({
    required TasksRepository tasksRepository,
  }) : _tasksRepository = tasksRepository;

  @override
  Future<void> create(DateTime dateTime, String description) =>
      _tasksRepository.create(dateTime, description);

  @override
  Future<void> checkOrUncheckTask(TaskModel taskModel) =>
      _tasksRepository.checkOrUncheckTask(taskModel);

  @override
  Future<void> delete(TaskModel taskModel) =>
      _tasksRepository.delete(taskModel);

  @override
  Future<List<TaskModel>> findAll() => _tasksRepository.findAll();
}

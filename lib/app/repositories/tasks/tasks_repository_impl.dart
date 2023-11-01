import '../../core/database/sqlite_connection_factory.dart';
import '../../models/task_model.dart';
import './tasks_repository.dart';

class TasksRepositoryImpl implements TasksRepository {
  final SqliteConnectionFactory _sqliteConnectionFactory;

  TasksRepositoryImpl({
    required SqliteConnectionFactory sqliteConnectionFactory,
  }) : _sqliteConnectionFactory = sqliteConnectionFactory;

  @override
  Future<void> create(DateTime dateTime, String description) async {
    final conn = await _sqliteConnectionFactory.openConnection();

    await conn.insert('todo', {
      'id': null,
      'description': description,
      'dateTime': dateTime.toIso8601String(),
      'finished': 0,
    });
  }

  @override
  Future<void> checkOrUncheckTask(TaskModel taskModel) async {
    final conn = await _sqliteConnectionFactory.openConnection();
    final finished = taskModel.finished ? 1 : 0;

    await conn.rawUpdate(
      'update todo set finished = ? where id = ?',
      [finished, taskModel.id],
    );
  }

  @override
  Future<void> delete(TaskModel taskModel) async {
    final conn = await _sqliteConnectionFactory.openConnection();
    await conn.rawDelete('delete from todo where id = ?', [taskModel.id]);
  }

  @override
  Future<List<TaskModel>> findAll() async {
    final conn = await _sqliteConnectionFactory.openConnection();
    final result = await conn.rawQuery(''' 
      select * 
      from todo 
      order by data_hora
    ''');
    return result.map((task) => TaskModel.fromMap(task)).toList();
  }
}

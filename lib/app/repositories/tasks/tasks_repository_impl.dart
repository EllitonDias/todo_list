import '../../core/database/sqlite_connection_factory.dart';
import '../../models/task_model.dart';
import './tasks_repository.dart';

class TasksRepositoryImpl implements TasksRepository {
  final SqliteConnectionFactory _sqliteConnectionFactory;

  TasksRepositoryImpl({
    required SqliteConnectionFactory sqliteConnectionFactory,
  }) : _sqliteConnectionFactory = sqliteConnectionFactory;

  @override
  Future<void> save(DateTime dateTime, String description) async {
    final conn = await _sqliteConnectionFactory.openConnection();

    await conn.insert('todo', {
      'id': null,
      'description': description,
      'dateTime': dateTime.toIso8601String(),
      'finished': 0,
    });
  }

  @override
  Future<List<TaskModel>> findByPeriod(DateTime start, DateTime end) async {
    final startFilter = DateTime(start.year, start.month, start.day, 0, 0, 0);
    final endFilter = DateTime(end.year, end.month, end.day, 0, 0, 0);

    final conn = await _sqliteConnectionFactory.openConnection();
    final result = await conn.rawQuery('''
      select * 
      from todo 
      where dateTime between ? and ? 
      order by dateTime
    ''', [
      startFilter.toIso8601String(),
      endFilter.toIso8601String(),
    ]);
    return result.map((task) => TaskModel.fromMap(task)).toList();
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
  Future<void> deleteAll() async {
    final conn = await _sqliteConnectionFactory.openConnection();
    await conn.rawDelete('delete from todo');
  }
}

import 'package:sqflite/sqlite_api.dart';

import 'migration.dart';

class MigrationV1 implements Migration {
  @override
  void create(Batch batch) {
    batch.execute('''
      create table todo(
        id Integer primary key autoincrement,
        description varchar(500) not null,
        dateTime datetime,
        finished Integer
      )
    ''');
  }

  @override
  void upgrade(Batch batch) {}
}

import 'package:flutter_offline_first_app/helpers/helper_dao.dart';
import 'package:flutter_offline_first_app/models/todo.dart';
import 'package:sqflite_common/sqlite_api.dart';

class TodoDao implements DaoHelper {
  Database db;
  TodoDao(this.db);

  TodoDao.createTable(Database database) {
    createTable(database);
  }

  @override
  createTable(Database database) async {
    try {
      await database.execute(
        'CREATE TABLE TODO    '
        '(                    '
        ' ID TEXT,            '
        ' COMPLETED INTEGER,  '
        ' CREATEDAT TEXT,     '
        ' UPDATEDAT TEXT,     '
        ' VERSION INTEGER     '
        ');                   ',
      );
    } on Exception catch (e) {
      print('Create Table error $e');
    }
  }

  @override
  Future get(int id) async {
    List<Map> maps = await db.query(
      'TODO',
      columns: [
        'ID',
        'COMPLETED',
        'CREATEDAT',
        'UPDATEDAT',
        'VERSION',
      ],
      where: 'ID = ?',
      whereArgs: [id],
    );
  }

  @override
  getAll() async {
    try {
      List<Map> maps = await db.query(
        'TODO',
        columns: [
          'ID',
          'COMPLETED',
          'CREATEDAT',
          'UPDATEDAT',
          'VERSION',
        ],
      );
      if (maps.length > 0) {
        return maps.map((map) => Todo.fromMap(map)).toList();
      }
    } catch (_) {
      return [];
    }
  }

  @override
  insert(item) async {
    if (item is Todo) {
      try {
        print(item);
        item.id = db
            .insert('TODO', item.toMap()
                // {
                //   'ID': item.id,
                //   'COMPLETED': item.completed,
                //   'CREATEDAT': item.createdAt.toString(),// parse(item.createdAt.toString().substring(0, 19)),
                //   'UPDATEDAT': item.createdAt.toString(),//DateTime.parse(item.updatedAt.toString().substring(0, 19)),
                //   'VERSION': item.version,
                // },
                )
            .toString();
      } catch (_) {
        update(item);
      }
    }

    try {
      List<Map> maps = await db.query(
        'TODO',
        columns: [
          'ID',
          'COMPLETED',
          'CREATEDAT',
          'UPDATEDAT',
          'VERSION',
        ],
      );
      if (maps.length > 0) {
        return maps.map((map) => Todo.fromMap(map)).toList();
      }
    } catch (_) {
      return [];
    }
  }

  @override
  insertAll(List items) async {
    if (items is List<Todo>) {
      for (Todo item in items) {
        await insert(item);
      }
    }
  }

  @override
  remove(item) async {
    if (item is Todo) {
      try {
        await db.delete('TODO', where: 'ID = ?', whereArgs: [item.id]);
      } catch (_) {}
    }
  }

  @override
  removeAll(List items) {
    if (items is List<Todo>) {
      for (Todo item in items) {
        remove(item);
      }
    }
  }

  @override
  removeNoneExisting(List list) async {
    if (list is List<Todo>) {
      List<int> ids = list.map((todo) => todo.id != null ? todo.id : -1).toList();
      try {
        await db.delete(
          'TODO',
          where: 'ID NOT IN (${ids.join(', ')})',
        );
      } catch (_) {}
    }
  }

  @override
  update(item) async {
    if (item is Todo) {
      await db.update('TODO', item.toMap(), where: 'ID = ?', whereArgs: [item.id]);
    }
  }
}

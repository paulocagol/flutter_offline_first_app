import 'dart:io';

import 'package:flutter_offline_first_app/database/dao/todo_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DataStore implements DataStoreHelper {
  String dbName = 'todo3.db';
  String path = '';

  Database db;
  TodoDao todoDao;

  @override
  void create(Database database, int version) {
    TodoDao.createTable(database);
  }

  @override
  Future<Database> connect() async {
    var databasesPath = await getDatabasesPath();
    
    path = join(databasesPath, dbName);
    
    bool dbExists = await databaseExists(path);
    
    if (dbExists) {
      await Directory(databasesPath).create(recursive: true);
    }
    db = await openDatabase(path, version: 1, onCreate: create);
    
    createDaos();
    return db;
  }

  @override
  void createDaos() {
    todoDao = TodoDao(db);// .createTable(db);
  }

  @override
  void delete() async {
    await deleteDatabase(path);
  }

  @override
  void disconnect() async {
    await db.close();
  }

  @override
  void preload() {}
}

abstract class DataStoreHelper {
  void create(Database db, int version);
  Future<Database> connect();
  void disconnect();
  void createDaos();
  void delete();
  void preload();
}

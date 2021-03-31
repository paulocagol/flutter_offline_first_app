import 'package:flutter_offline_first_app/database/database.dart';
import 'package:flutter_offline_first_app/helpers/helper_dao.dart';
import 'package:flutter_offline_first_app/services/todo_service.dart';

class Repository {
  bool connected = false;
  DataStore store;
  TodoService todoService = TodoService();

  initStore() async {
    if (store == null) {
      store = DataStore();
      await store.connect();
    }
  }

  addNoneExisting(DaoHelper dao, List<dynamic> list) async {
    print('teste');
    await dao.insertAll(list);
  }

  removeNoneExisting(DaoHelper dao, List<dynamic> items) async {
    print(items);
    await dao.removeNoneExisting(items);
  }
}

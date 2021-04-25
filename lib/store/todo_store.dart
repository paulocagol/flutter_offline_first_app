import 'package:flutter_offline_first_app/models/todo.dart';
import 'package:flutter_offline_first_app/repository/todo_repository.dart';
import 'package:flutter_offline_first_app/store/store.dart';

class TodoStore with Store {
  TodoRepository repository = TodoRepository();
  Future<List<Todo>> getTodos() async {
    return await repository.loadTodos();
  }
}

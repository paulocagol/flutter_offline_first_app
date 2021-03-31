import 'package:flutter_offline_first_app/models/todo.dart';
import 'package:flutter_offline_first_app/repository/todo_repository.dart';
import 'package:flutter_offline_first_app/store/store.dart';

class TodoStore with Store {
  TodoRepository repository = TodoRepository();
  List<Todo> todos;

  Future<List<Todo>> getTodos() async {
    List<Todo> todos;
    todos = await repository.loadTodos();
    print(todos);

    return todos; 
  }

  // Future<Todo> getTodo(int id) async => currentTodo = await repository.getTodo(id);
}

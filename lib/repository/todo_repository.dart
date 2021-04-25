import 'package:flutter_offline_first_app/models/todo.dart';
import 'package:flutter_offline_first_app/repository/repository.dart';

class TodoRepository extends Repository {
  
  loadTodos() async {
    await initStore();
    try {
      await addNoneExisting(store.todoDao, await todoService.getTodos());
      await removeNoneExisting(store.todoDao, await todoService.getTodos());
      return await store.todoDao.getAll();
    } catch (_) {
      return await store.todoDao.getAll();
    }
  }

  createOrder(Todo newTodo) async {
    await initStore();
    try {
      var order = await todoService.createTodo(newTodo);
      return await store.todoDao.insert(order);
    } catch (_) {
      return await store.todoDao.insert(newTodo);
    }
  }

  getTodo(int id) async {
    await initStore();
    try {
      Todo newTodo = await todoService.getTodo(id);
      await saveTodo(newTodo);
      return await storedTodo(id);
    } catch (_) {
      return await storedTodo(id);
    }
  }

  saveTodo(Todo newTodo) async {
    await store.todoDao.insert(newTodo);
  }

  Future<Todo> storedTodo(int id) async {
    Todo todo = await store.todoDao.get(id);
    return todo;
  }
}

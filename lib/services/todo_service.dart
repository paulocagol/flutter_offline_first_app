import 'dart:convert';

import 'package:flutter_offline_first_app/commons/api_routes.dart';
import 'package:flutter_offline_first_app/models/todo.dart';
import 'package:flutter_offline_first_app/services/base_service.dart';
import 'package:http/http.dart';

class TodoService extends BaseService {
  getTodo(int id) async {
    Response response = await client.get(URL + TODO + '/$id');
    return Todo.fromJson(jsonDecode(response.body)['todo']);
  }

  getTodos() async {
    try {
      Response response = await client.get(URL + TODO);
      return List<Todo>.from(
        json.decode(response.body).map(
          (x) {
            return Todo.fromJson(x['todo']);
          },
        ),
      );
    } on Exception catch (e) {
      print(e);
    }
  }

  createTodo(Todo newTodo) async {
    var uri = Uri.http(URL, TODO);
    Response response = await client.put(uri, body: json.encode(newTodo.toJson()));
    return Todo.fromJson(json.decode(response.body)['todo']);
  }
}

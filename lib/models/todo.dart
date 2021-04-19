import 'package:intl/intl.dart';

class Todo {
  int id;
  String task;
  DateTime createdAt;
  DateTime updatedAt;
  int sync;

  Todo();

  Todo.add({
    this.id,
    this.task,
    this.createdAt,
    this.updatedAt,
    this.sync,
  });

  Todo copyWith({
    int id,
    String task,
    DateTime createdAt,
    DateTime updatedAt,
    int sync,
  }) {
    return Todo.add(
      id: id,
      task: task,
      createdAt: createdAt,
      updatedAt: updatedAt,
      sync: sync,
    );
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'ID': id,
      'TASK': task,
      'CREATEDAT': createdAt,
      'UPDATEDAT': updatedAt,
      'VERSION': sync,
    };
    if (id != null) {
      map['ID'] = id;
    }

    return map;
  }

  Todo.fromMap(Map<String, dynamic> map) {
    id = map['ID'];
    task = map['task'];
    createdAt = DateTime.parse(map['CREATEDAT']);
    updatedAt = DateTime.parse(map['UPDATEDAT']);
    sync = map['VERSION'];
  }

  factory Todo.fromJson(Map<String, dynamic> json) {
    try {

      Todo todo = Todo();
      print(json);
      todo.id = int.tryParse(json['id']);
      print(todo);
      todo.task = json['task'];
      print(todo);
      todo.sync = int.tryParse(json['version']);
      print(todo);
      todo.createdAt = DateTime.parse(json['createdAt']); //DateFormat("yyyy-MM-dd hh:mm:ss").parse(DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(json['createdAt']).toString());
      print(todo);
      todo.updatedAt = DateTime.parse(json['updatedAt']);
      
      print(todo);
      
      return todo;
    } on Exception catch (e) {
      print(e);
    }

    return null;
  }

  Map<String, dynamic> toJson() => {
        'objectId': id,
        'task': task,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'version': sync,
      };

  @override
  String toString() {
    return 'Todo{id: $id, task: $task, createdAt: $createdAt, updatedAt: $updatedAt, version: $sync}';
  }
}

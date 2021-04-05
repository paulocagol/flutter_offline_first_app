import 'package:intl/intl.dart';

class Todo {
  String id;
  int completed;
  DateTime createdAt;
  DateTime updatedAt;
  int version;

  Todo();

  Todo.add({
    this.id,
    this.completed,
    this.createdAt,
    this.updatedAt,
    this.version,
  });

  Todo copyWith({
    String id,
    int completed,
    DateTime createdAt,
    DateTime updatedAt,
    int version,
  }) {
    return Todo.add(
      id: id,
      completed: completed,
      createdAt: createdAt,
      updatedAt: updatedAt,
      version: version,
    );
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'ID': id,
      'COMPLETED': completed,
      'CREATEDAT': createdAt,
      'UPDATEDAT': updatedAt,
      'VERSION': version,
    };
    if (id != null) {
      map['ID'] = id;
    }

    return map;
  }

  Todo.fromMap(Map<String, dynamic> map) {
    id = map['ID'];
    completed = map['COMPLETED'];
    createdAt = map['CREATEDAT'];
    updatedAt = map['UPDATEDAT'];
    version = map['VERSION'];
  }

  factory Todo.fromJson(Map<String, dynamic> json) {
    try {

      Todo todo = Todo();
      todo.id = json['objectId'].toString();
      todo.completed = json['completed'] == 'false' ? 0 : 1;
      todo.version = int.tryParse(json['version'].toString());
      todo.createdAt = DateTime.parse('2021-03-30 01:20:13'); //DateFormat("yyyy-MM-dd hh:mm:ss").parse(DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(json['createdAt']).toString());
      todo.updatedAt = DateTime.parse('2021-03-30 01:20:13');
      return todo;
    } on Exception catch (e) {
      print(e);
    }

    return null;
  }

  Map<String, dynamic> toJson() => {
        'objectId': id,
        'completed': completed,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'version': version,
      };

  @override
  String toString() {
    return 'Todo{id: $id, completed: $completed, createdAt: $createdAt, updatedAt: $updatedAt, version: $version}';
  }
}

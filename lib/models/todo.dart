class Todo {
  String id;
  int completed;

  Todo();

  Todo.add({
    this.id,
    this.completed,
  });

  Todo copyWith({String id, int completed}) {
    return Todo.add(
      id: id,
      completed: completed,
    );
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'ID': id,
      'COMPLETED': completed,
    };
    if (id != null) {
      map['ID'] = id;
    }
    return map;
  }

  Todo.fromMap(Map<String, dynamic> map) {
    id = map['ID'];
    completed = map['COMPLETED'];
  }

  factory Todo.fromJson(Map<String, dynamic> json) {
    // print(json['objectId']);
    // print(json['completed']);
    Todo todo = Todo();
    todo.id = json['objectId'];
    todo.completed = json['completed'] == 'false' ? 0 : 1;
    return todo;

    // return Todo.add(
    //   id: json['objectId'],
    //   completed: json['completed'] == 'false' ? 0 : 1,
    // );
  }

  Map<String, dynamic> toJson() => {
        'objectId': id,
        'completed': completed,
      };

  @override
  String toString() {
    return 'Todo{id: $id, completed: $completed}';
  }
}

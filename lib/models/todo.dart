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
      'SYNC': sync,
    };
    if (id != null) {
      map['ID'] = id;
    }

    return map;
  }

  Todo.fromMap(Map<String, dynamic> map) {
    id = int.tryParse(map['ID']);
    task = map['TASK'];
    createdAt = DateTime.parse(map['CREATEDAT']);
    updatedAt = DateTime.parse(map['UPDATEDAT']);
    sync = map['SYNC'];
  }

  factory Todo.fromJson(Map<String, dynamic> json) {
    try {
      Todo todo = Todo();
      todo.id = json['id'];
      todo.task = json['task'];
      todo.createdAt = DateTime.parse(json['createdAt']);
      todo.updatedAt = DateTime.parse(json['updatedAt']);
      todo.sync = json['sync'];
      return todo;
    } on Exception catch (e) {
      print(e);
    }

    return null;
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'task': task,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'sync': sync,
      };

  @override
  String toString() {
    return 'Todo{id: $id, task: $task, createdAt: $createdAt, updatedAt: $updatedAt, version: $sync}';
  }
}

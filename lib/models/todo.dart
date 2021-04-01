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
    Todo todo = Todo();
    todo.id = json['objectId'];
    todo.completed = json['completed'];
    todo.createdAt = json['createdAt'];
    todo.updatedAt = json['updatedAt'];
    todo.version = json['version'];
    return todo;
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

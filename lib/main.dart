import 'package:flutter/material.dart';
import 'package:flutter_offline_first_app/models/todo.dart';
import 'package:flutter_offline_first_app/store/todo_store.dart';

main() {
  runApp(MaterialApp(
    home: HomeApp(),
  ));
}

class HomeApp extends StatefulWidget {
  const HomeApp({Key key}) : super(key: key);

  @override
  _HomeAppState createState() => _HomeAppState();
}

TodoStore todoStore = TodoStore();

class _HomeAppState extends State<HomeApp> {
  Future<List<Todo>> _getAllTodos() async {
    return await todoStore.getTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: FutureBuilder(
        future: _getAllTodos(),
        builder: (context, snapTodo) {
          if (!snapTodo.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Container(
              child: ListView.builder(
                itemCount: snapTodo.data.length,
                itemBuilder: (BuildContext context, int index) {
                  Todo todo = snapTodo.data[index];
                  return ListTile(
                    leading: Text(todo.id.toString()),
                    title: Text(todo.task),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}

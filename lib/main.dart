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
    return todoStore.getTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: FutureBuilder(
          future: _getAllTodos(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            } else if (snapshot.data.isNotEmpty) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  Todo todo = snapshot.data[index];
                  return Column(
                    children: <Widget>[
                      Text(todo.id.toString()),
                    ],
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

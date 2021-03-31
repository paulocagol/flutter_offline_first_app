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
    // print('****');
    List<Todo> todos = List<Todo>();
    List<Todo> todosR = List<Todo>();
    Todo todo1 = Todo.add(id: '1', completed: 1);
    todos.add(todo1);
    Todo todo2 = Todo.add(id: '1', completed: 1);
    todos.add(todo2);
    Todo todo3 = Todo.add(id: '1', completed: 1);
    todos.add(todo3);

    todos = await todoStore.getTodos();
    setState(() {
      todos.forEach((item) {
        todosR.add(item);
      });
    });
    return todosR;
  }

  Future<List<String>> _getData() async {
    var values = new List<String>();
    values.add("Horses");
    values.add("Goats");
    values.add("Chickens");

    //throw new Exception("Danger Will Robinson!!!");

    await new Future.delayed(new Duration(seconds: 5));

    return values;
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
              print('center de cima');
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
              print('center de baixo');
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

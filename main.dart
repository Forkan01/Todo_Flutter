import 'package:flutter/material.dart';

void main() {
  runApp(todo_flutter());
}

class todo_flutter extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TodoHomePage(),
    );
  }
}

class TodoHomePage extends StatefulWidget {
  @override
  _TodoHomePageState createState() => _TodoHomePageState();
}

class _TodoHomePageState extends State<TodoHomePage> {
  final List<String> _todoList =[];
  final TextEditingController _controller = TextEditingController();

  void _addTodoItem() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _todoList.add(_controller.text);
        _controller.clear();
      });
    }
  }
  void _removeTodoItem(int index) {
    setState(() {
      _todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Todo App')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(labelText: 'Enter task'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _addTodoItem,
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _todoList.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(_todoList[index]),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _removeTodoItem(index),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
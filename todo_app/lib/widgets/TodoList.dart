// ignore_for_file: unused_field, use_key_in_widget_constructors, unused_element, prefer_const_constructors, unused_local_variable, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo"),
      ),
      body: ListView.builder(
          itemCount: _todoList.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 10,
              child: ListTile(
                title: Text(_todoList[index]),
                trailing: IconButton(onPressed: () => _removeitems(index), icon: Icon(Icons.delete),),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _displayBox(context),
        child: Icon(Icons.add),
      ),
    );
  }

  final List<String> _todoList = <String>[];
  final _textFieldController = TextEditingController();
  void _addItems(String item) {
    setState(() {
      _todoList.add(item);
    });
    _textFieldController.clear();
  }

  void _removeitems(int index){
      setState(() {
        _todoList.removeAt(index);
      });
  }

  Widget _viewTodoItems(String item) {
    return ListTile(
      title: Text(item),
    );
  }

  Future<AlertDialog> _displayBox(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Add a task to your list"),
          content: TextField(
            controller: _textFieldController,
            decoration: InputDecoration(hintText: "Enter a task"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _addItems(_textFieldController.text);
              },
              child: Text("Add"),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Cancel"))
          ],
        );
      },
    );
  }

  List<Widget> listItems() {
    final List<Widget> _todoWidgets = <Widget>[];
    for (String item in _todoList) {
      _todoWidgets.add(_viewTodoItems(item));
    }
    return _todoWidgets;
  }
}

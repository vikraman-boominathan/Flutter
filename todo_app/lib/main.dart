import 'package:flutter/material.dart';
import './widgets/TodoList.dart';

void main()=> runApp(Todo());

class Todo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoList(),
    );
  }
}


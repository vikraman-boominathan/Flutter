import 'package:flutter/material.dart';

class TextChange extends StatelessWidget {
  String note;

  TextChange(this.note);  

  @override
  Widget build(BuildContext context) {
    return Text(note);
  }
}
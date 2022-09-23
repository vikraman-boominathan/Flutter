import 'package:flutter/material.dart';

class TextControl extends StatelessWidget {
  final Function selectionHandler;
 

  TextControl(this.selectionHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(onPressed: selectionHandler, child: Text("Press Me!")),
    );
  }
}

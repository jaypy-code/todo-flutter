import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final String content;
  final bool done;
  final Function toggle;
  final Function edit;
  final Function delete;
  Item({this.content, this.done, this.toggle, this.edit, this.delete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: this.edit.call,
      leading: Checkbox(
        activeColor: Colors.green,
        value: this.done,
        onChanged: this.toggle.call,
      ),
      title: Text(
        this.content,
        style: TextStyle(
          decoration: this.done ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        splashRadius: 24,
        onPressed: this.delete.call,
      ),
    );
  }
}

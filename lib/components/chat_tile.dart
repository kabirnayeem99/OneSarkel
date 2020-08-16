import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({
    Key key,
    this.context,
    this.index,
  }) : super(key: key);

  final BuildContext context;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.people,
        color: Colors.white,
      ),
      title: Text(
        "user_name${index + 1}3${index * 11}",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      subtitle: Text(
        "This is a message...",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      trailing: Text(
        "1/1/99",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}

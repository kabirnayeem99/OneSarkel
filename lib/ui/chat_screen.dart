import 'package:flutter/material.dart';
import 'package:flutter_samsung_messaging_app_clone/theme/samsung_color.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({Key key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: SamsungColor.black,
          elevation: 0.0,
          title: Text("username4582"),
          actions: [
            IconButton(
              icon: Icon(Icons.call),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          color: SamsungColor.black,
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}

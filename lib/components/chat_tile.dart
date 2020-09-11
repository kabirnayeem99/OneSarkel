import 'package:flutter/material.dart';
import 'package:flutter_samsung_messaging_app_clone/models/user.dart';
import 'package:flutter_samsung_messaging_app_clone/ui/chat_screen.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({
    Key key,
    this.userData,
  }) : super(key: key);

  final UserData userData;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => ChatScreen(
              user: userData,
            ),
          ),
        );
      },
      leading: Icon(
        Icons.people,
        color: Colors.white,
      ),
      title: Text(
        "${userData.username}",
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

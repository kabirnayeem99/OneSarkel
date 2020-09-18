import 'package:flutter/material.dart';
import 'package:flutter_samsung_messaging_app_clone/models/user.dart';
import 'package:flutter_samsung_messaging_app_clone/screens/chat_screen.dart';

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
              reciever: userData,
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
        userData.lastActive.toString().replaceRange(5, 7, "") ?? "",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}

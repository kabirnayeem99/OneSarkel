import 'package:flutter/material.dart';
import 'package:flutter_samsung_messaging_app_clone/models/user.dart';
import 'package:flutter_samsung_messaging_app_clone/theme/samsung_color.dart';
import 'package:flutter_samsung_messaging_app_clone/ui/chat_screen.dart';

class ContactTile extends StatelessWidget {
  const ContactTile({
    Key key,
    this.userData,
  }) : super(key: key);

  final UserData userData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
      child: ListTile(
        leading: Icon(
          Icons.people,
          color: Colors.white,
        ),
        title: Text(
          userData.username,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          "${userData.email}",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        trailing: Icon(
          Icons.block,
          color: SamsungColor.lightGrey,
        ),
      ),
    );
  }
}

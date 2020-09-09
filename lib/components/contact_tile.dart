import 'package:flutter/material.dart';
import 'package:flutter_samsung_messaging_app_clone/models/user.dart';
import 'package:flutter_samsung_messaging_app_clone/theme/samsung_color.dart';

class ContactTile extends StatelessWidget {
  const ContactTile({
    Key key,
    this.userData,
  }) : super(key: key);

  final UserData userData;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.people,
        color: Colors.white,
      ),
      title: Text(
        "First Name",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      subtitle: Text(
        "${userData.username}",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      trailing: Icon(
        Icons.block,
        color: SamsungColor.lightGrey,
      ),
    );
  }
}

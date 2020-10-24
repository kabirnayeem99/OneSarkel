import 'package:flutter/material.dart';

import '../theme/samsung_color.dart';

class ContactTile extends StatelessWidget {
  const ContactTile({
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
        "First Name",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      subtitle: Text(
        "user_name${index + 1}3${index * 11}",
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

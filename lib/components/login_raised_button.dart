import 'package:flutter/material.dart';
import 'package:flutter_samsung_messaging_app_clone/theme/samsung_color.dart';

class LogInRaisedButton extends StatelessWidget {
  const LogInRaisedButton({
    Key key,
    this.screenName,
  }) : super(key: key);

  final Widget screenName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150.0,
      child: RaisedButton(
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => this.screenName,
            ),
          );
        },
        child: Text(
          "Log In",
          style: TextStyle(color: Colors.white),
        ),
        color: SamsungColor.primaryDark,
      ),
    );
  }
}

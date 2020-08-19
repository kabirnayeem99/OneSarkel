import 'package:flutter/material.dart';
import 'package:flutter_samsung_messaging_app_clone/services/firebase_auth.dart';
import 'package:flutter_samsung_messaging_app_clone/theme/samsung_color.dart';
import 'package:flutter_samsung_messaging_app_clone/ui/login_screen.dart';

class LogInRaisedButton extends StatelessWidget {
  LogInRaisedButton({
    Key key,
    this.screenName,
  }) : super(key: key);

  final Widget screenName;
  final AppAuthentication _appAuthentication = AppAuthentication();

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
      onPressed: () async {
        var result = await _appAuthentication.signInAnonymously();
        result != null
            ? Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => this.screenName,
                ),
              )
            : Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LogInScreen(),
                ),
              );
      },
      child: Text(
        "Log In",
        style: TextStyle(color: Colors.white),
      ),
      color: SamsungColor.primaryDark,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_samsung_messaging_app_clone/services/firebase_auth.dart';
import 'package:flutter_samsung_messaging_app_clone/theme/samsung_color.dart';

class RegistrationRaisedButton extends StatelessWidget {
  RegistrationRaisedButton({
    Key key,
    this.screenName,
    this.email,
    this.password,
  }) : super(key: key);

  final Widget screenName;
  final String email;
  final String password;
  final AppAuthentication _appAuthentication = AppAuthentication();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150.0,
      child: RaisedButton(
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        onPressed: () async {
          var result = await _appAuthentication.createUser(email, password,);
          if (result != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => this.screenName,
              ),
            );
          }
        },
        child: Text(
          "Registration",
          style: TextStyle(color: Colors.white),
        ),
        color: SamsungColor.primaryDark,
      ),
    );
  }
}

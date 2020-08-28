import 'package:flutter/material.dart';
import 'package:flutter_samsung_messaging_app_clone/ui/registration_screen.dart';

class Wrapper extends StatefulWidget {
  Wrapper({Key key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    //TODO: will return homescreen or login screen based on user data
    return RegistrationScreen();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_samsung_messaging_app_clone/models/user.dart';
import 'package:flutter_samsung_messaging_app_clone/ui/auth_screen.dart';
import 'package:flutter_samsung_messaging_app_clone/ui/home_screen.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  Wrapper({Key key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CurrentUser>(context);
    return user == null ? RegistrationScreen() : HomeScreen();
  }
}

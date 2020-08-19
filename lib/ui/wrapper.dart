import 'package:flutter/material.dart';
import 'package:flutter_samsung_messaging_app_clone/ui/home_screen.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: will return homescreen or login screen based on user data
    return HomeScreen();
  }
}

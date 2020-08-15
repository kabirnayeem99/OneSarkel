import 'package:flutter/material.dart';
import 'package:flutter_samsung_messaging_app_clone/theme/samsung_color.dart';

class LogInScreen extends StatefulWidget {
  LogInScreen({Key key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: SamsungColor.black,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: SamsungColor.black,
          body: Column(
            children: [
              TextField(),
              TextField(),
              RaisedButton(
                onPressed: () {},
                child: Text(
                  "Log In",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.purple,
              ),
              RaisedButton(
                onPressed: () {},
                child: Text(
                  "Registration",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.purple,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

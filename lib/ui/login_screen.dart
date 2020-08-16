import 'package:flutter/material.dart';
import 'package:flutter_samsung_messaging_app_clone/components/login_raised_button.dart';
import 'package:flutter_samsung_messaging_app_clone/components/registration_raised_button.dart';
import 'package:flutter_samsung_messaging_app_clone/theme/samsung_color.dart';
import 'package:flutter_samsung_messaging_app_clone/ui/home_screen.dart';
import 'package:flutter_samsung_messaging_app_clone/ui/registration_screen.dart';

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
          body: ListView(
            children: [
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(
                  top: 80.0,
                  bottom: 70.0,
                  right: 30.0,
                  left: 30.0,
                ),
                child: Text(
                  "Log In",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 45.0,
                  ),
                ),
              ),
              Container(
                height: 50.0,
                margin: EdgeInsets.all(10.0),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60.0),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: SamsungColor.lightGrey,
                    filled: true,
                  ),
                ),
              ),
              Container(
                height: 50.0,
                margin: EdgeInsets.all(10.0),
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60.0),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: SamsungColor.lightGrey,
                    filled: true,
                  ),
                ),
              ),
              Column(
                children: [
                  LogInRaisedButton(
                    screenName: HomeScreen(),
                  ),
                  RegistrationRaisedButton(
                    screenName: RegistrationScreen(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

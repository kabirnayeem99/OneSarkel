import 'package:flutter/material.dart';
import 'package:flutter_samsung_messaging_app_clone/components/login_raised_button.dart';
import 'package:flutter_samsung_messaging_app_clone/components/registration_raised_button.dart';
import 'package:flutter_samsung_messaging_app_clone/theme/samsung_color.dart';
import 'package:flutter_samsung_messaging_app_clone/ui/home_screen.dart';
import 'package:flutter_samsung_messaging_app_clone/ui/login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({Key key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String email;
  String password;
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
                  "Registration",
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
                  onChanged: (value) {
                    email = value;
                  },
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
                  onChanged: (value) {
                    password = value;
                  },
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
                  RegistrationRaisedButton(
                    email: email,
                    password: password,
                    screenName: HomeScreen(),
                  ),
                  LogInRaisedButton(
                    screenName: LogInScreen(),
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

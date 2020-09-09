import 'package:flutter/material.dart';
import 'package:flutter_samsung_messaging_app_clone/services/auth.dart';
import 'package:flutter_samsung_messaging_app_clone/theme/samsung_color.dart';

class LogInScreen extends StatefulWidget {
  LogInScreen({Key key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  String email;
  String password;
  final _formKey = GlobalKey<FormState>();
  final _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      // Main container which covers the whole screen

      child: Container(
        color: SamsungColor.black,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: SamsungColor.black,
            // ListView widget that holds all the widgets in the screen
            // including the two textfield and buttons
            body: ListView(
              children: [
                // First container that holds the title of the screen
                // which in this case is Registration
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
                // Second container which holds the first email textfield
                Container(
                  height: 50.0,
                  margin: EdgeInsets.all(10.0),
                  child: TextFormField(
                    validator: (typedEmail) =>
                        typedEmail.isEmpty ? "Enter an email." : null,
                    onChanged: (typedEmail) {
                      email = typedEmail;
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
                // Third container which holds the second pass textfield
                Container(
                  height: 50.0,
                  margin: EdgeInsets.all(10.0),
                  child: TextFormField(
                    validator: (typedPass) => typedPass.length < 6
                        ? "Enter the correct password."
                        : null,
                    onChanged: (typedPass) {
                      password = typedPass;
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
                // Fourth comes the login button
                RaisedButton(
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  onPressed: () async {
                    var result = await _auth.signIn(
                      email,
                      password,
                    );
                    if (result != null) {
                      print("sing in successful");
                    }
                  },
                  child: Text(
                    "Log In",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: SamsungColor.primaryDark,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

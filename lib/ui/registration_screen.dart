import 'package:flutter/material.dart';
import 'package:flutter_samsung_messaging_app_clone/services/auth.dart';
import 'package:flutter_samsung_messaging_app_clone/theme/samsung_color.dart';

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({Key key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String _email;
  String _pass;
  AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Main container which covers the whole screen
    return Container(
      color: SamsungColor.black,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: SamsungColor.black,
          body: Form(
            key: _formKey,
            // ListView widget that holds all the widgets in the screen
            // including the two textfield and buttons
            child: ListView(
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
                    "Registration",
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
                        typedEmail.isEmpty ? "Enter an email" : null,
                    onChanged: (typedEmail) {
                      setState(() {
                        _email = typedEmail;
                      });
                    },
                    textAlign: TextAlign.center,
                    decoration: textInPutDecoration(),
                  ),
                ),
                // Third container which holds the second pass textfield
                Container(
                  height: 50.0,
                  margin: EdgeInsets.all(10.0),
                  child: TextFormField(
                    validator: (typedPassword) => typedPassword.length < 6
                        ? 'Pass with at least 6 characters'
                        : null,
                    onChanged: (typedPassword) {
                      setState(() {
                        _pass = typedPassword;
                      });
                    },
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.center,
                    decoration: textInPutDecoration(),
                  ),
                ),
                // Column that holds two buttons: registration and login
                Column(
                  children: [
                    // First button: registration button
                    SizedBox(
                      width: 150.0,
                      child: RaisedButton(
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            print("in registration screen email is $_email" +
                                "and password is $_pass.");
                            await _auth.register(_email, _pass).then((result) {
                              if (result != null) {
                                print("registration successful");
                              } else {
                                print(
                                    "Registration screen: user returned $result");
                              }
                            });
                          }
                        },
                        child: Text(
                          "Registration",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: SamsungColor.primaryDark,
                      ),
                    ),
                    // Second button: login button
                    RaisedButton(
                        child: Text(
                          "Log In",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: SamsungColor.primaryDark,
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        onPressed: () async {
                          var result = await _auth.signIn(
                            _email,
                            _pass,
                          );
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration textInPutDecoration() {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(60.0),
        borderSide: BorderSide.none,
      ),
      fillColor: SamsungColor.lightGrey,
      filled: true,
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samsung_messaging_app_clone/services/auth.dart';
import 'package:flutter_samsung_messaging_app_clone/theme/samsung_color.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

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
  String warningMessage = "";
  bool showLoading = false;

  @override
  Widget build(BuildContext context) {
    // Main container which covers the whole screen
    return Container(
      color: SamsungColor.black,
      child: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: showLoading,
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
                      "Register or Log In",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 45.0,
                      ),
                    ),
                  ),
                  // Second container which holds the first email textfield
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextFormField(
                      style:
                          TextStyle(color: SamsungColor.white, fontSize: 20.0),
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
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextFormField(
                      obscureText: true,
                      style:
                          TextStyle(color: SamsungColor.white, fontSize: 20.0),
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
                      SizedBox(
                        height: 20.0,
                      ),
                      // First button: registration button
                      SizedBox(
                        width: 200.0,
                        height: 50.0,
                        child: RaisedButton(
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          onPressed: () async {
                            FocusScope.of(context).unfocus();
                            if (_formKey.currentState.validate()) {
                              print("in registration screen email is $_email" +
                                  "and password is $_pass.");
                              setState(() {
                                showLoading = true;
                              });
                              await _auth
                                  .register(_email, _pass)
                                  .then((result) {
                                if (result != null) {
                                  print("registration successful");
                                  setState(() {
                                    showLoading = false;
                                  });
                                } else {
                                  setState(() {
                                    showLoading = false;
                                    warningMessage =
                                        "Try another email address";
                                  });
                                  print(
                                      "Registration screen: user returned $result");
                                }
                              });
                            }
                          },
                          child: Text(
                            "Registration",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                          color: SamsungColor.primaryDark,
                        ),
                      ),
                      // Second button: login button
                      SizedBox(
                        height: 20.0,
                      ),

                      SizedBox(
                        width: 200.0,
                        height: 50.0,
                        child: RaisedButton(
                            child: Text(
                              "Log In",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                            color: SamsungColor.primaryDark,
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            onPressed: () async {
                              FocusScope.of(context).unfocus();
                              if (_formKey.currentState.validate()) {
                                print("in sign in screen email is $_email" +
                                    "and password is $_pass.");
                                setState(() {
                                  showLoading = true;
                                });
                                await _auth
                                    .signIn(_email, _pass)
                                    .then((result) {
                                  if (result != null) {
                                    print("sign in successful");
                                  } else {
                                    setState(() {
                                      showLoading = false;
                                    });
                                    print(
                                        "Sign in screen screen: user returned $result");
                                  }
                                });
                              }
                            }),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  WarningText(warningMessage: warningMessage),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration textInPutDecoration() {
    return InputDecoration(
      errorStyle: TextStyle(
        fontSize: 15.0,
        color: SamsungColor.lightGrey,
      ),
      contentPadding: EdgeInsets.all(20.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(60.0),
        borderSide: BorderSide.none,
      ),
      fillColor: SamsungColor.lightGrey,
      filled: true,
    );
  }
}

class WarningText extends StatelessWidget {
  const WarningText({
    Key key,
    @required this.warningMessage,
  }) : super(key: key);

  final String warningMessage;

  @override
  Widget build(BuildContext context) {
    return Text(
      warningMessage,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: SamsungColor.lightGrey,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

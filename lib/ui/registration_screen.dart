import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samsung_messaging_app_clone/services/firebase_auth.dart';
import 'package:flutter_samsung_messaging_app_clone/theme/samsung_color.dart';
import 'package:flutter_samsung_messaging_app_clone/ui/home_screen.dart';

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({Key key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String email = "";
  String password = "";
  TextEditingController emailFieldController;
  TextEditingController passwordFieldController;
  FirebaseAuthService _appAuthentication = FirebaseAuthService();

  @override
  void initState() {
    super.initState();
    emailFieldController = TextEditingController();
    passwordFieldController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Container(
      color: SamsungColor.black,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: SamsungColor.black,
          body: Form(
            key: _formKey,
            child: ListView(
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
                  child: TextFormField(
                    validator: (typedEmail) =>
                    typedEmail.isEmpty ? "Enter an email" : null,
                    controller: emailFieldController,
                    onChanged: (typedEmail) {
                      setState(() {
                        email = typedEmail;
                      });
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
                  child: TextFormField(
                    validator: (typedPassword) => typedPassword.length < 6
                        ? 'Pass with at least 6 characters'
                        : null,
                    controller: passwordFieldController,
                    onChanged: (typedPassword) {
                      setState(() {
                        password = typedPassword;
                      });
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
                    SizedBox(
                      width: 150.0,
                      child: RaisedButton(
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        onPressed: () async {
                          print(
                              "in registration screen email is $email and password is $password.");
                          await _appAuthentication
                              .createUser(email, password)
                              .then((result) {
                            if (result != null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ),
                              );
                            } else {
                              print(
                                  "Registration screen: user returned $result");
                            }
                          });
                        },
                        child: Text(
                          "Registration",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: SamsungColor.primaryDark,
                      ),
                    ),
                    RaisedButton(
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      onPressed: () async {
                        var result =
                            await _appAuthentication.signInWithEmailAndPassword(
                          email,
                          password,
                        );
                      },
                      child: Text(
                        "Log In",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: SamsungColor.primaryDark,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

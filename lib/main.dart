import 'package:flutter/material.dart';
import 'package:flutter_samsung_messaging_app_clone/ui/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Messagin',
      theme: ThemeData(
        fontFamily: "Roboto",
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LogInScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_samsung_messaging_app_clone/services/firebase_auth.dart';
import 'package:flutter_samsung_messaging_app_clone/ui/wrapper.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Messaging',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Roboto",
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiProvider(
        providers: [
          Provider<FirebaseAuthService>(
            create: (context) => FirebaseAuthService(),
          ),
        ],
        child: Wrapper(),
      ),
    );
  }
}

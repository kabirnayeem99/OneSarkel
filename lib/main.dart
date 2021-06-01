import 'package:flutter/material.dart';
import 'package:flutter_samsung_messaging_app_clone/services/auth.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';
import 'screens/auth/wrapper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<CurrentUser>.value(
      value: _authService.user,
      catchError: (_, __) => null,
      child: FutureProvider<UserData>.value(
        catchError: (_, __) => null,
        value: _authService.getCurrentUser() ?? UserData(),
        child: MaterialApp(
          title: 'Messaging',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: "Roboto",
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: Wrapper(),
        ),
      ),
    );
  }
}

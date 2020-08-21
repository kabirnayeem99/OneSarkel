import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samsung_messaging_app_clone/ui/login_screen.dart';

class AppAuthentication {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<FirebaseUser> signInAnonymously() async {
    try {
      AuthResult result = await _firebaseAuth.signInAnonymously();
      FirebaseUser user = result.user;
      return user;
    } catch (e) {
      print("Error from Firebase Anonymous sign in: ${e.toString()}");
      return null;
    }
  }

  Future<FirebaseUser> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      AuthResult result;
      result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUser user = result.user;
      return user;
    } catch (e) {
      print("Error from Firebase Email and password sign in: $e");
      return null;
    }
  }

  Future<FirebaseUser> createUser(String email, String password) async {
    try {
      AuthResult result;
      result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch (e) {
      print("Error from Firebase creatin new user: $e");
      return null;
    }
  }

  signOut(BuildContext context) async {
    await _firebaseAuth.signOut();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LogInScreen(),
      ),
    );
  }
}

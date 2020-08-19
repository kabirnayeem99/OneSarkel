import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future signInAnonymously() async {
    try {
      UserCredential result = await _firebaseAuth.signInAnonymously();
      User user = result.user;
      return user;
    } catch (e) {
      print("Error from Firebase Anonymous sign in: $e");
      return null;
    }
  }

  // TODO: sign in with email & password

  // TODO: register with email & password

  // TODO: signout

}

FirebaseAuth firebaseAuth = FirebaseAuth.instance;

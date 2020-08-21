import 'package:firebase_auth/firebase_auth.dart';

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

  // Future<User>

  // TODO: register with email & password
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

  // TODO: signout

}

FirebaseAuth firebaseAuth = FirebaseAuth.instance;

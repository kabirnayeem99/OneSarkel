import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_samsung_messaging_app_clone/models/user.dart';

class FirebaseAuthService {
  final _firebaseAuth = auth.FirebaseAuth.instance;

  User _userFromFirebase(auth.User user) {
    return user == null ? null : User(uid: user.uid);
  }

  Stream<User> get onAuthStateChanged {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  Future<User> signInAnonymously() async {
    final authResult = await _firebaseAuth.signInAnonymously();
    return _userFromFirebase(authResult.user);
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}

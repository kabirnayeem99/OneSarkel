import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_samsung_messaging_app_clone/components/utilities.dart';
import 'package:flutter_samsung_messaging_app_clone/models/user.dart';
import 'package:flutter_samsung_messaging_app_clone/services/database.dart';

Firestore firestore = Firestore();

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<CurrentUser> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebase);
  }

  CurrentUser _userFromFirebase(FirebaseUser user) {
    return user == null ? null : CurrentUser(userId: user.uid);
  }

  Future signIn(String email, String password) async {
    try {
      AuthResult result;
      result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUser currentUser = result.user;

      return _userFromFirebase(currentUser);
    } catch (e) {
      print("Error from Firebase Email and password sign in: $e");
      return null;
    }
  }

  Future register(
    String email,
    String password,
  ) async {
    print("starting create user process. email is $email."
        " and password is$password");
    try {
      AuthResult result;
      result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUser currentUser = result.user;
      // While a new user is created the user data is updated with a new user
      // name which is generated by a separate utility.
      await DatabaseService(uid: currentUser.uid).updateUserData(
        Utilities.getUsername(currentUser.email),
        currentUser.email,
      );
      return _userFromFirebase(currentUser);
    } catch (e) {
      print("Error from Firebase creating new user: $e");
      return null;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<String> getCurrentUser() async {
    String currentUserId;
    await _auth.currentUser().then((user) {
      currentUserId = user.uid;
    });
    return currentUserId;
  }
}
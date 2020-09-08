import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samsung_messaging_app_clone/models/user.dart';

Firestore firestore = Firestore();

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebase);
  }

  User _userFromFirebase(FirebaseUser user) {
    return user == null
        ? null
        : User(userId: user.uid, username: "u${user.uid}");
  }

  Future signIn(String email, String password) async {
    try {
      AuthResult result;
      result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUser user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      print("Error from Firebase Email and password sign in: $e");
      return null;
    }
  }

  Future register(String email,
      String password,) async {
    print(
        "starting createuser process. email is $email. and password is$password");
    try {
      AuthResult result;
      result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUser user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      print("Error from Firebase creating new user: $e");
      return null;
    }
  }

  Future<void> signOut(BuildContext context) async {
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

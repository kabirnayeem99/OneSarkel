import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samsung_messaging_app_clone/components/utilities.dart';
import 'package:flutter_samsung_messaging_app_clone/models/user.dart';
import 'package:flutter_samsung_messaging_app_clone/ui/login_screen.dart';

Firestore firestore = Firestore();

class AppAuthentication {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;

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

  Future<FirebaseUser> createUser(
    String email,
    String password,
  ) async {
    print(
        "starting createuser process. email is $email. and password is$password");
    try {
      AuthResult result;
      result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("$result");
      FirebaseUser firebaseUser = result.user;
      String userId = firebaseUser.uid;
      String username = Utilities.getUsername(email);
      User user = User(
        userId: userId,
        username: username,
      );
      await firestore.collection("users").document(userId).setData(
            user.toMap(firebaseUser),
          );
      return firebaseUser;
    } catch (e) {
      print("Error from Firebase creating new user: $e");
      return null;
    }
  }

  Future<void> signOut(BuildContext context) async {
    await _firebaseAuth.signOut();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LogInScreen(),
      ),
    );
  }

  Future<String> getCurrentUser() async {
    String currentUserId;
    await _firebaseAuth.currentUser().then((user) {
      currentUserId = user.uid;
    });
    return currentUserId;
  }
}

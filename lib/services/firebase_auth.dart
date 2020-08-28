import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samsung_messaging_app_clone/components/utilities.dart';
import 'package:flutter_samsung_messaging_app_clone/models/user.dart';
import 'package:flutter_samsung_messaging_app_clone/ui/login_screen.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class AppAuthentication {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User> signInAnonymously() async {
    try {
      UserCredential result = await _firebaseAuth.signInAnonymously();
      User user = result.user;
      return user;
    } catch (e) {
      print("Error from Firebase Anonymous sign in: ${e.toString()}");
      return null;
    }
  }

  Future<User> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result;
      result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = result.user;
      return user;
    } catch (e) {
      print("Error from Firebase Email and password sign in: $e");
      return null;
    }
  }

  Future<User> createUser(
    String email,
    String password,
  ) async {
    print(
        "starting createuser process. email is $email. and password is$password");
    try {
      UserCredential result;
      result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("$result");
      User firebaseUser = result.user;
      String userId = firebaseUser.uid;
      String username = Utilities.getUsername(email);
      MUser user = MUser(
        userId: userId,
        username: username,
      );
      await firestore.collection("users").doc(userId).set(
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
    String currentUserId = _firebaseAuth.currentUser.uid;
    return currentUserId;
  }
}

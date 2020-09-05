import 'package:flutter/material.dart';
import 'package:flutter_samsung_messaging_app_clone/components/utilities.dart';

@immutable
class User {
  User({this.uid, this.username});
  final String uid;
  String username = Utilities.getUsername();

  factory User.fromMap(Map<String, dynamic> data) {
    if (data == null) {
      return null;
    }
    final String username = data['downloadUrl'];
    if (username == null) {
      return null;
    }
    return User(username: username);
  }

  Map<String, dynamic> toMap() {
    return {
      'downloadUrl': downloadUrl,
    };
  }
}

import 'package:firebase_auth/firebase_auth.dart';

class User {
  String userId;
  String username;

  User({
    this.userId,
    this.username,
  });

  Map toMap(FirebaseUser user) {
    var data = Map<String, dynamic>();
    data["userId"] = this.userId;
    data["username"] = this.username;
    return data;
  }

  fromMap(Map<String, dynamic> mapData) {
    this.userId = mapData["userId"];
    this.username = mapData["username"];
  }
}

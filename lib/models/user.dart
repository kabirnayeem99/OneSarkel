import 'package:firebase_auth/firebase_auth.dart';

class User {
  String userId;
  String username;
  String status;
  String state;

  User({
    this.userId,
    this.username,
    this.state,
    this.status,
  });

  Map toMap(FirebaseUser user) {
    var data = Map<String, dynamic>();
    data["userId"] = this.userId;
    data["username"] = this.username;
    data["state"] = this.state;
    data["status"] = this.status;
    return data;
  }

  fromMap(Map<String, dynamic> mapData) {
    this.userId = mapData["userId"];
    this.username = mapData["username"];
    this.state = mapData["state"];
    this.status = mapData["status"];
  }
}

import 'package:firebase_auth/firebase_auth.dart';

class MUser {
  String userId;
  String username;

  MUser({
    this.userId,
    this.username,
  });

  Map toMap(User user) {
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

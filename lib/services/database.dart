import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_samsung_messaging_app_clone/models/user.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  Future updateUserData(String username, String email) async {
    return await userCollection.document(uid).setData({
      "username": username,
      "email": email,
    });
  }

  List<UserData> _updateUserDataFromSnapshot(QuerySnapshot snapshot) {
    // this is a private function which takes a firestore snapshot
    // and turns simplifies this using a userData model. After retrieving all
    // the user model, it then turns them into a list, which is needed to be.
    return snapshot.documents.map((document) {
      return UserData(
        uid: document.data["userId"],
        username: document.data["username"],
        email: document.data["email"],
      );
    }).toList();
  }

  Stream<List<UserData>> get userData {
    // It gets the user data from the firestore
    // and turns this into a more simplified object
    // with only two properties.
    return userCollection.snapshots().map(_updateUserDataFromSnapshot);
  }
}

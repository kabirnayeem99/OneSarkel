import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_samsung_messaging_app_clone/models/message.dart';
import 'package:flutter_samsung_messaging_app_clone/models/user.dart';
import 'package:flutter_samsung_messaging_app_clone/services/auth.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  Future updateUserData(
      String username, String email, String lastActive) async {
    return await userCollection.document(uid).setData({
      "uid": this.uid,
      "username": username,
      "email": email,
      "lastActive": lastActive,
    });
  }

  List<UserData> _updateUserDataFromSnapshot(QuerySnapshot snapshot) {
    // this is a private function which takes a firestore snapshot
    // and turns simplifies this using a userData model. After retrieving all
    // the user model, it then turns them into a list, which is needed to be.
    return snapshot.documents.map((document) {
      return UserData(
        uid: document.documentID,
        username: document.data["username"],
        email: document.data["email"],
        lastActive: document.data["lastActive"],
      );
    }).toList();
  }

  Stream<List<UserData>> get userData {
    // It gets the user data from the firestore
    // and turns this into a more simplified object
    // with only two properties.
    return userCollection.snapshots().map(_updateUserDataFromSnapshot);
  }

  Future<void> addMessagesToFirestore(
    Message message,
    UserData reciever,
    UserData sender,
  ) async {
    var map = message.toMap();

    await firestore
        .collection("messages")
        .document(message.senderId)
        .collection(message.recieverId)
        .add(map);

    await firestore
        .collection("messages")
        .document(message.recieverId)
        .collection(message.senderId)
        .add(map);
  }

  Future<DocumentSnapshot> getMessageFromFirestore() async {
    DocumentSnapshot messageDocument;
    QuerySnapshot snapshot =
        await firestore.collection("messages").getDocuments();
    for (int i = 0; i < snapshot.documents.length; i++) {
      var a = snapshot.documents[i];
      print(a.documentID);
      if (a.documentID == uid) {
        messageDocument = a;
      }
    }

    return messageDocument;
  }
}

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_samsung_messaging_app_clone/models/user.dart';
import 'package:flutter_samsung_messaging_app_clone/services/firestore_path.dart';

class FirestoreService {
  FirestoreService({@required this.uid}) : assert(uid != null);
  final String uid;

  // Sets the avatar download url
  Future<void> setAvatarReference(User avatarReference) async {
    final path = FirestorePath.avatar(uid);
    final reference = FirebaseFirestore.instance.doc(path);
    await reference.set(User.toMap());
  }

  // Reads the current avatar download url
  Stream<User> userStream() {
    final path = FirestorePath.avatar(uid);
    final reference = FirebaseFirestore.instance.doc(path);
    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) => User.fromMap(snapshot.data));
  }
}

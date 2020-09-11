import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  String senderId;
  String recieverId;
  Timestamp timestamp;

  Message({this.senderId, this.recieverId, this.timestamp});

  Map toMap() {
    Map map = Map<String, dynamic>();
    map['senderId'] = this.senderId;
    map['recieverId'] = this.recieverId;
    map['timestamp'] = this.timestamp;
    return map;
  }

  Message fromMap(Map<String, dynamic> map) {
    Message _message = Message();
    _message.senderId = map['senderId'];
    _message.recieverId = map['recieverId'];
    _message.timestamp = map['timestamp'];
    return _message;
  }
}

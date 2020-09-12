import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samsung_messaging_app_clone/models/message.dart';
import 'package:flutter_samsung_messaging_app_clone/models/user.dart';
import 'package:flutter_samsung_messaging_app_clone/services/database.dart';
import 'package:flutter_samsung_messaging_app_clone/theme/samsung_color.dart';
import 'package:flutter_samsung_messaging_app_clone/ui/profile_screen.dart';
import 'package:provider/provider.dart';

final messageFieldController = TextEditingController();
final DatabaseService _databaseService = DatabaseService();

class ChatScreen extends StatefulWidget {
  final UserData reciever;

  ChatScreen({this.reciever});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  void navigateToProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileScreen(),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    UserData currentUser = Provider.of<UserData>(context) ?? UserData();

    sendMessage(UserData reciever) {
      print("done ${reciever.uid}");
      var text = messageFieldController.text;
      Message _message = Message(
        recieverId: reciever.uid,
        senderId: currentUser.uid,
        timestamp: Timestamp.now(),
        messageText: text,
      );
      _databaseService.addMessagesToFirestore(
        _message,
        reciever,
        currentUser,
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: SamsungColor.black,
          elevation: 0.0,
          title: GestureDetector(
            child: Text("${widget.reciever.username}"),
            onTap: navigateToProfile,
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.call),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          color: SamsungColor.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: SamsungColor.primaryDark,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          bottomLeft: Radius.circular(50.0),
                          topRight: Radius.circular(60.0),
                        ),
                      ),
                      margin: EdgeInsets.only(
                        left: 60.0,
                        top: 16.0,
                        right: 10.0,
                      ),
                      padding: EdgeInsets.all(10.0),
                      // height: 40.0,
                      width: 30.0,
                      child: Text(
                        "These are all the Dummy messages, dummy dummy ${widget.reciever.username} \n "
                        "sing with me, dummy dummy...",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                  itemCount: 20,
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        height: 40.0,
                        margin: EdgeInsets.only(
                          right: 2.0,
                          left: 10.0,
                          top: 10.0,
                          bottom: 10.0,
                        ),
                        child: TextField(
                          controller: messageFieldController,
                          style: TextStyle(color: Colors.black),
                          textAlignVertical: TextAlignVertical.top,
                          textAlign: TextAlign.left,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(60.0),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        iconSize: 40.0,
                        icon: Icon(Icons.send),
                        onPressed: () {
                          sendMessage(widget.reciever);
                          print(widget.reciever.username);
                        },
                        color: SamsungColor.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

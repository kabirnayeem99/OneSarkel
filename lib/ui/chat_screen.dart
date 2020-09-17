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
ScrollController _listScrollController;
bool _isOnTop = true;
FocusNode _focus = FocusNode();

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

  void _onFocusChange() {
    if (_focus.hasFocus) {
      print("keyboard focused");
    }
  }

  @override
  void initState() {
    super.initState();
    _listScrollController = ScrollController(initialScrollOffset: 20.0);
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _listScrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    UserData currentUser = Provider.of<UserData>(context) ?? UserData();
    _scrollToBottom() {
      _listScrollController.animateTo(
          _listScrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 250),
          curve: Curves.easeOut);
      setState(() => _isOnTop = false);
    }

    sendMessage(UserData reciever) {
      var text = messageFieldController.text;
      if (text.length > 0) {
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
        messageFieldController.clear();
      }
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
        body: StreamBuilder(
          stream: Firestore.instance
              .collection("messages")
              .document(currentUser.uid)
              .collection(widget.reciever.uid)
              .orderBy("timestamp", descending: false)
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return snapshot.data == null
                ? Container(
                    color: SamsungColor.black,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ))
                : Container(
                    color: SamsungColor.black,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: ListView.builder(
                            controller: _listScrollController,
                            itemBuilder: (BuildContext context, int index) {
                              bool isSender = snapshot.data.documents[index]
                                      ["senderId"] ==
                                  currentUser.uid;
                              return Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Container(
                                  decoration: isSender
                                      ? BoxDecoration(
                                          color: SamsungColor.primaryDark,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(50),
                                            bottomLeft: Radius.circular(50.0),
                                            topRight: Radius.circular(60.0),
                                          ),
                                        )
                                      : BoxDecoration(
                                          color: SamsungColor.primary,
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(50),
                                            bottomRight: Radius.circular(50.0),
                                            topLeft: Radius.circular(60.0),
                                          ),
                                        ),
                                  margin: isSender
                                      ? EdgeInsets.only(
                                          left: 60.0,
                                          top: 16.0,
                                          right: 10.0,
                                        )
                                      : EdgeInsets.only(
                                          left: 10.0,
                                          top: 16.0,
                                          right: 60.0,
                                        ),
                                  padding: EdgeInsets.all(10.0),
                                  // height: 40.0,
                                  // width: 30.0,
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      snapshot.data.documents[index]
                                          ["messageText"],
                                      textAlign: isSender
                                          ? TextAlign.right
                                          : TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemCount: snapshot.data.documents.length,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 5,
                                child: Container(
                                  // height: 50.0,
                                  child: TextField(
                                    focusNode: _focus,
                                    style: TextStyle(
                                        color: SamsungColor.black,
                                        fontSize: 20.0),
                                    controller: messageFieldController,
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(20.0),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(60.0),
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
                                    _scrollToBottom();
                                    sendMessage(widget.reciever);
                                  },
                                  color: SamsungColor.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_samsung_messaging_app_clone/components/chat_tile.dart';
import 'package:flutter_samsung_messaging_app_clone/components/header_text.dart';
import 'package:flutter_samsung_messaging_app_clone/theme/samsung_color.dart';
import 'package:flutter_samsung_messaging_app_clone/ui/chat_screen.dart';

class ConversationPage extends StatefulWidget {
  const ConversationPage({
    Key key,
  }) : super(key: key);

  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  ScrollController _conversationListController;
  Alignment headerAlignment = Alignment.center;
  EdgeInsets headerPadding = EdgeInsets.only(bottom: 90.0, top: 60.0);
  double headerTextSize = 40.0;

  _scrollListener() {
    if (_conversationListController.offset >=
            _conversationListController.position.maxScrollExtent &&
        !_conversationListController.position.outOfRange) {
      setState(() {
        headerTextSize = 22.0;
        headerAlignment = Alignment.topLeft;
        headerPadding = EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 20.0,
        );
        print("reached bottom");
      });
    }
    if (_conversationListController.offset <=
            _conversationListController.position.minScrollExtent &&
        !_conversationListController.position.outOfRange) {
      setState(
        () {
          headerTextSize = 40.0;
          headerAlignment = Alignment.bottomCenter;
          headerPadding = EdgeInsets.only(bottom: 90.0, top: 60.0);
          print("reached top");
        },
      );
    }
  }

  void navigateToChatScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatScreen(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _conversationListController = ScrollController();
    _conversationListController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    _conversationListController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: SamsungColor.primaryDark,
        child: Icon(
          Icons.message,
        ),
      ),
      backgroundColor: SamsungColor.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HeaderTextWidget(
            headerAlignment: headerAlignment,
            headerPadding: headerPadding,
            headerTextSize: headerTextSize,
            title: "Messaging",
          ),
          Expanded(
            child: SizedBox(
              height: 400.0,
              child: ListView.builder(
                controller: _conversationListController,
                itemCount: 8,
                itemBuilder: (BuildContext context, int index) {
                  return ChatTile(
                    context: context,
                    index: index,
                    onTap: navigateToChatScreen,
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

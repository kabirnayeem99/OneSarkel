import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_samsung_messaging_app_clone/components/chat_tile.dart';
import 'package:flutter_samsung_messaging_app_clone/components/header_text.dart';
import 'package:flutter_samsung_messaging_app_clone/models/user.dart';
import 'package:flutter_samsung_messaging_app_clone/services/auth.dart';
import 'package:flutter_samsung_messaging_app_clone/theme/samsung_color.dart';
import 'package:provider/provider.dart';

class ConversationPage extends StatefulWidget {
  const ConversationPage({
    Key key,
  }) : super(key: key);

  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  // ScrollController _conversationListController;
  Alignment headerAlignment = Alignment.center;
  EdgeInsets headerPadding = EdgeInsets.only(bottom: 90.0, top: 60.0);
  double headerTextSize = 40.0;

  // _scrollListener() {
  //   if (_conversationListController.offset >=
  //           _conversationListController.position.maxScrollExtent &&
  //       !_conversationListController.position.outOfRange) {
  //     setState(() {
  //       headerTextSize = 22.0;
  //       headerAlignment = Alignment.topLeft;
  //       headerPadding = EdgeInsets.symmetric(
  //         vertical: 20.0,
  //         horizontal: 20.0,
  //       );
  //       print("reached bottom");
  //     });
  //   }
  //   if (_conversationListController.offset <=
  //           _conversationListController.position.minScrollExtent &&
  //       !_conversationListController.position.outOfRange) {
  //     setState(
  //       () {
  //         headerTextSize = 40.0;
  //         headerAlignment = Alignment.bottomCenter;
  //         headerPadding = EdgeInsets.only(bottom: 90.0, top: 60.0);
  //         print("reached top");
  //       },
  //     );
  //   }
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   _conversationListController = ScrollController();
  //   _conversationListController.addListener(_scrollListener);
  // }
  //
  // @override
  // void dispose() {
  //   super.dispose();
  //   _conversationListController.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    List<UserData> users =
        Provider.of<List<UserData>>(context, listen: false) ?? [];
    final currentUser =
        Provider.of<UserData>(context, listen: false) ?? UserData();
    // it removes the current user from the list
    users.removeWhere((userData) {
      return userData.uid == currentUser.uid;
    });

    void handleClick(String value) {
      if (value == "Logout") {
        AuthService().signOut();
      } else if (value == "Settings") {
        //TODO: settings will be here
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: SamsungColor.black,
        actions: [
          PopupMenuButton<String>(
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {'Logout', 'Settings'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
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
          FutureBuilder<UserData>(
              future: AuthService().getCurrentUser(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return snapshot.hasData
                    ? HeaderTextWidget(
                        headerAlignment: headerAlignment,
                        headerPadding: headerPadding,
                        headerTextSize: headerTextSize,
                        title: "Hi, ${snapshot.data.username}",
                      )
                    : HeaderTextWidget(
                        headerAlignment: headerAlignment,
                        headerPadding: headerPadding,
                        headerTextSize: headerTextSize,
                        title: "Please, wait, Mr(s)");
              }),
          Expanded(
            child: SizedBox(
              height: 400.0,
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (BuildContext context, int index) {
                  return ChatTile(
                    userData: users[index],
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

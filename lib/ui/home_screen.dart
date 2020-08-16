import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samsung_messaging_app_clone/theme/samsung_color.dart';
import 'package:flutter_samsung_messaging_app_clone/ui/pages/conversation_page.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController homeScreenPageController = PageController();
  int _page = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: SamsungColor.black,
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: HomeScreenBottomNavBar(page: _page),
          body: PageView(
            controller: homeScreenPageController,
            children: [
              ConversationPage(page: _page),
              ConversationPage(page: _page),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreenBottomNavBar extends StatelessWidget {
  const HomeScreenBottomNavBar({
    Key key,
    @required int page,
  })  : _page = page,
        super(key: key);

  final int _page;

  @override
  Widget build(BuildContext context) {
    return CupertinoTabBar(
      currentIndex: _page,
      backgroundColor: SamsungColor.black,
      items: [
        BottomNavigationBarItem(
          title: Container(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Conversations",
              style: TextStyle(
                color: SamsungColor.primaryDark,
                fontSize: 18.0,
              ),
            ),
          ),
          icon: Container(),
        ),
        BottomNavigationBarItem(
          title: Container(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Contatcs",
              style: TextStyle(
                color: SamsungColor.primaryDark,
                fontSize: 18.0,
              ),
            ),
          ),
          icon: Container(),
        )
      ],
    );
  }
}

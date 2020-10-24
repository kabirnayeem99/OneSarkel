import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/home_screen_nav_bar.dart';
import '../theme/samsung_color.dart';
import 'pages/conversation_page.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin<HomeScreen> {
  PageController homeScreenPageController = PageController();
  int _page = 1;

  void navigationTapped(page) {
    homeScreenPageController.animateToPage(
      page,
      duration: Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void onPageChanged(page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: SamsungColor.black,
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: HomeScreenBottomNavBar(
            page: _page,
            navigationTapped: navigationTapped,
          ),
          body: PageView(
            controller: homeScreenPageController,
            onPageChanged: onPageChanged,
            children: [
              ConversationPage(),
            ],
          ),
        ),
      ),
    );
  }
}

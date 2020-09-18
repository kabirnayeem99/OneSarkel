import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samsung_messaging_app_clone/components/home_screen_nav_bar.dart';
import 'package:flutter_samsung_messaging_app_clone/models/user.dart';
import 'package:flutter_samsung_messaging_app_clone/services/database.dart';
import 'package:flutter_samsung_messaging_app_clone/theme/samsung_color.dart';
import 'package:flutter_samsung_messaging_app_clone/ui/pages/contact_page.dart';
import 'package:flutter_samsung_messaging_app_clone/ui/pages/conversation_page.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin<HomeScreen> {
  PageController homeScreenPageController = PageController();
  int _page = 0;

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
    return StreamProvider<List<UserData>>.value(
      value: DatabaseService().userData,
      catchError: (_, __) => null,
      child: Container(
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
                ContactPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

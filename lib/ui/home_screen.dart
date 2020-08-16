import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samsung_messaging_app_clone/components/home_screen_nav_bar.dart';
import 'package:flutter_samsung_messaging_app_clone/theme/samsung_color.dart';
import 'package:flutter_samsung_messaging_app_clone/ui/pages/contact_page.dart';
import 'package:flutter_samsung_messaging_app_clone/ui/pages/conversation_page.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin<HomeScreen> {
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
              ConversationPage(
                page: _page,
              ),
              ContactPage(page: _page),
            ],
          ),
        ),
      ),
    );
  }
}

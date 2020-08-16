import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController homeScreenPageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: homeScreenPageController,
        children: [Text("who")],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_samsung_messaging_app_clone/components/contact_tile.dart';
import 'package:flutter_samsung_messaging_app_clone/components/header_text.dart';
import 'package:flutter_samsung_messaging_app_clone/theme/samsung_color.dart';

class ContactPage extends StatefulWidget {
  ContactPage({Key key, @required int page}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  ScrollController _contactListController;
  Alignment headerAlignment = Alignment.center;
  EdgeInsets headerPadding = EdgeInsets.only(bottom: 90.0, top: 60.0);
  double headerTextSize = 40.0;

  _scrollListener() {
    if (_contactListController.offset >=
            _contactListController.position.maxScrollExtent &&
        !_contactListController.position.outOfRange) {
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
    if (_contactListController.offset <=
            _contactListController.position.minScrollExtent &&
        !_contactListController.position.outOfRange) {
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

  @override
  void initState() {
    super.initState();
    _contactListController = ScrollController();
    _contactListController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    _contactListController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SamsungColor.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HeaderTextWidget(
            headerAlignment: headerAlignment,
            headerPadding: headerPadding,
            headerTextSize: headerTextSize,
            title: "Contacts",
          ),
          Expanded(
            child: SizedBox(
              height: 400.0,
              child: ListView.builder(
                controller: _contactListController,
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return ContactTile(
                    context: context,
                    index: index,
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

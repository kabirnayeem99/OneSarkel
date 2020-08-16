import 'package:flutter/material.dart';
import 'package:flutter_samsung_messaging_app_clone/components/contact_tile.dart';
import 'package:flutter_samsung_messaging_app_clone/theme/samsung_color.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({
    Key key,
    @required int page,
  }) : super(key: key);

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
          Container(
            padding: EdgeInsets.only(bottom: 90.0, top: 30.0),
            child: Text(
              "Contacts",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40.0,
              ),
            ),
          ),
          SizedBox(
            height: 200.0,
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return ContactTile(
                  context: context,
                  index: index,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

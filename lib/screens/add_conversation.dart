import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samsung_messaging_app_clone/theme/samsung_color.dart';

class AddConversation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SamsungColor.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SearchBar(
            iconActiveColor: SamsungColor.primary,
            textStyle: TextStyle(
              color: SamsungColor.white,
              fontSize: 20.0,
            ),
            searchBarStyle: SearchBarStyle(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              backgroundColor: SamsungColor.lightGrey,
              borderRadius: BorderRadius.circular(40.0),
            ),
          ),
        ),
      ),
    );
  }
}

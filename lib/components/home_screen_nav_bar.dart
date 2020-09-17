import 'package:flutter/cupertino.dart';
import 'package:flutter_samsung_messaging_app_clone/theme/samsung_color.dart';

class HomeScreenBottomNavBar extends StatelessWidget {
  HomeScreenBottomNavBar({
    Key key,
    @required int page,
    this.navigationTapped,
  })  : _page = page,
        super(key: key);

  final int _page;
  final Function navigationTapped;

  @override
  Widget build(BuildContext context) {
    return CupertinoTabBar(
      border: Border(
        top: BorderSide.none,
      ),
      onTap: navigationTapped,
      currentIndex: _page,
      backgroundColor: SamsungColor.black,
      items: [
        BottomNavigationBarItem(
          title: Container(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Conversations",
              style: TextStyle(
                color: _page == 0
                    ? SamsungColor.primaryDark
                    : SamsungColor.lightGrey,
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
                color: _page == 1
                    ? SamsungColor.primaryDark
                    : SamsungColor.lightGrey,
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

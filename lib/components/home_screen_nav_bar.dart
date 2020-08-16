import 'package:flutter/cupertino.dart';
import 'package:flutter_samsung_messaging_app_clone/theme/samsung_color.dart';

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
                color: SamsungColor.lightGrey,
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

import 'package:flutter/material.dart';

class HeaderTextWidget extends StatelessWidget {
  const HeaderTextWidget({
    Key key,
    @required this.headerAlignment,
    @required this.headerPadding,
    @required this.headerTextSize,
    @required this.title,
  }) : super(key: key);

  final Alignment headerAlignment;
  final EdgeInsets headerPadding;
  final double headerTextSize;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: headerAlignment,
      padding: headerPadding,
      child: AnimatedDefaultTextStyle(
        style: TextStyle(
          color: Colors.white,
          fontSize: headerTextSize,
        ),
        duration: Duration(milliseconds: 400),
        curve: Curves.slowMiddle,
        child: Text(
          title,
        ),
      ),
    );
  }
}

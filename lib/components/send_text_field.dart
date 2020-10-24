import 'package:flutter/material.dart';

import '../theme/samsung_color.dart';

class SendTextField extends StatelessWidget {
  const SendTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              height: 40.0,
              margin: EdgeInsets.only(
                right: 2.0,
                left: 10.0,
                top: 10.0,
                bottom: 10.0,
              ),
              child: TextField(
                style: TextStyle(color: Colors.black),
                textAlignVertical: TextAlignVertical.top,
                textAlign: TextAlign.left,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(60.0),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
              iconSize: 40.0,
              icon: Icon(Icons.send),
              onPressed: () {
                print("send button tapped");
              },
              color: SamsungColor.primary,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../theme/samsung_color.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: SamsungColor.black,
        ),
        body: Container(
          color: SamsungColor.black,
          child: Column(
            children: [
              Container(
                height: 200.0,
                alignment: Alignment.bottomCenter,
                width: double.infinity,
                child: Text(
                  "username348u5",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Text(
                "Media, Links, Docs",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 50.0,
                    child: Image.network(
                      "https://images.homedepot-static.com/productImages/84e72c36-570c-4768-9e46-fae15fc5a5ea/svn/home-decorators-collection-dimensional-wall-art-1865642270-64_1000.jpg",
                    ),
                  ),
                  SizedBox(
                    width: 50.0,
                    child: Image.network(
                      "https://images.homedepot-static.com/productImages/84e72c36-570c-4768-9e46-fae15fc5a5ea/svn/home-decorators-collection-dimensional-wall-art-1865642270-64_1000.jpg",
                    ),
                  ),
                  SizedBox(
                    width: 50.0,
                    child: Image.network(
                      "https://images.homedepot-static.com/productImages/84e72c36-570c-4768-9e46-fae15fc5a5ea/svn/home-decorators-collection-dimensional-wall-art-1865642270-64_1000.jpg",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

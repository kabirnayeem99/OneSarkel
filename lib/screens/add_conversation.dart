import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samsung_messaging_app_clone/models/user.dart';
import 'package:flutter_samsung_messaging_app_clone/services/auth.dart';
import 'package:flutter_samsung_messaging_app_clone/services/database.dart';
import 'package:flutter_samsung_messaging_app_clone/theme/samsung_color.dart';

final database = DatabaseService();
final auth = AuthService();

class AddConversation extends StatefulWidget {
  @override
  _AddConversationState createState() => _AddConversationState();
}

class _AddConversationState extends State<AddConversation> {
  TextEditingController searchController = TextEditingController();
  String query = "";
  List<UserData> userList;

  searchAppBar(context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: SamsungColor.black,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        color: SamsungColor.white,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 21),
        child: Padding(
          padding: EdgeInsets.only(left: 20),
          child: TextField(
            controller: searchController,
            onChanged: (typedQuery) {
              setState(() {
                query = typedQuery;
              });
            },
            autofocus: true,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 35,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Search",
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                color: Color(0x88ffffff),
              ),
              suffixIcon: IconButton(
                icon: Icon(Icons.clear, color: Colors.white),
                onPressed: () {
                  WidgetsBinding.instance
                      .addPostFrameCallback((_) => searchController.clear());
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  generateSearchResults(String query) {
    print(query);
    final List<UserData> searchUserList = query.isEmpty
        ? []
        : userList.where((UserData user) {
      String _getEmail = user.email.toLowerCase();
      String _getUsername = user.username.toLowerCase();
      String _query = query.toLowerCase();
      bool matchedUsername = _getUsername.contains(_query);
      bool matchedEmail = _getEmail.contains(_query);

      return (matchedEmail || matchedUsername);
    }).toList();

    return Container(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(

            title: Text("who", style: TextStyle(color: SamsungColor.white),),
          );
          // return ContactTile(
          //   userData: userList[index],
          // );
        },
        itemCount: 6,
      ),
    );
  }


  @override
  void initState() {
    super.initState();
    auth.getCurrentUser().then((currentUser) {
      database.fetchUserCollection(currentUser).then((
          List<UserData> userCollection) {
        setState(() {
          userList = userCollection;
        });
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchAppBar(context),
      body: Container(
        color: SamsungColor.black,
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: generateSearchResults(query),
      ),
    );
  }
}

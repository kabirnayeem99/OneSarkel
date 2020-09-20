
class CurrentUser {
  String userId;
  String email;
  String username;

  CurrentUser({
    this.userId,
    this.email,
    this.username,
  });
}

class UserData {
  String uid;
  String username;
  String email;
  String lastActive;

  UserData({
    this.uid,
    this.username,
    this.email,
    this.lastActive,
  });

  UserData.fromMap(Map<String, dynamic> mapData) {
    this.uid = mapData['uid'];
    this.username = mapData['username'];
    this.email = mapData['email'];
    this.lastActive = mapData['lastActive'];
  }
}
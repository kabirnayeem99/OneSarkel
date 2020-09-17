
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
  final String uid;
  final String username;
  final String email;
  final String lastActive;

  UserData({
    this.uid,
    this.username,
    this.email,
    this.lastActive,
  });
}
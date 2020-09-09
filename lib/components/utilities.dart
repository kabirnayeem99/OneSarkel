import "dart:math";

List<String> usernamePrefixList = [
  'sparrow',
  'jey',
  'blackbird',
  'dove',
];
String username;
class Utilities {
  static String getUsername(String email) {
    String username = "_${email.split('@')[0]}";

// generates a new Random object

// generate a random index based on the list length
// and use it to retrieve the element
    var element =
        usernamePrefixList[Random().nextInt(usernamePrefixList.length)];
    username = element + username + Random().nextInt(100).toString();
    return username;
  }
}

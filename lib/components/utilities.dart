import "dart:math";

List<String> usernamePrefixList = [
  'sparrow',
  'jey',
  'blackbird',
  'cardinal',
  'dove',
];
String username;
Random random = Random();

class Utilities {
  static String getUsername(String email) {
    random = Random();
    String username = "_${email.split('@')[0]}";

// generates a new Random object

// generate a random index based on the list length
// and use it to retrieve the element
    var element = usernamePrefixList[random.nextInt(usernamePrefixList.length)];
    username = element + username + random.nextInt(100).toString();
    return username;
  }
}
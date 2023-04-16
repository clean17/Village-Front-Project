import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:village/model/test/user_test.dart';

class Services {
  static const String url = 'https://jsonplaceholder.typicode.com/users';

  static Future<List<UserTest>> getInfo() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<UserTest> user = userTestFromJson(response.body);
        return user;
      } else {
        Fluttertoast.showToast(msg: 'Error occurred. Please try again');
        return <UserTest>[];
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      return <UserTest>[];
    }
  }
}

import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:village/model/search/search.dart';
import 'package:http/http.dart' as http;

void main() async {
  await getSearchInfo_test();
}
// flutter test test/model/search/search_repository_test.dart
Future<Search> getSearchInfo_test() async {
  final url =
      Uri.parse('http://43.201.70.90:8081/search?keyword=연산동');
  Logger().d(url.query);
  try {
    final response = await http.get(url);
    Logger().d(response);
// final Search search = Search.FromJson(response.body);
    final Search search =
        Search.fromJson(response.body as Map<String, dynamic>);
    Logger().d(search);
    print(search);
    return search;
  } catch (e) {
    Fluttertoast.showToast(msg: '$e왜 안돼');
    return Search(keyword: '');
  }
}

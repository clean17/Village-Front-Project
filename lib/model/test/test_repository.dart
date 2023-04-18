import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:village/model/address/address_model.dart';
import 'package:village/model/test/user_test.dart';
import 'package:village/model/test/village_user_test.dart';

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

  static Future<VillageUserTest> getUserInfo() async {
    final url = Uri.parse('http://10.0.2.2:8080/join');
    // 안드로이드 보안정책상 localhost로 직접들어가는것을 허용하지 않음
    final headers = {'Content-Type': 'application/json'};
    final data = {
      'name': 'ssar2223',
      'password': '1234',
      'email': 'ssar2@nate.com'
    };
    try {
      final response =
          await http.post(url, headers: headers, body: jsonEncode(data));
      if (response.statusCode == 200) {
        final VillageUserTest user = villageUserTestFromJson(response.body);
        print(user.data.name);
        return user;
      } else {
        Fluttertoast.showToast(msg: 'Error occurred. Please try again');
        return VillageUserTest(
            status: 1,
            msg: 'd',
            data:
                Data(id: 1, name: '2', email: '3', createdAt: DateTime.now()));
      }
      // final VillageUserTest user = villageUserTestFromJson(response.body);
      // print(user.data.name);
      // return user;
    } catch (e) {
      Fluttertoast.showToast(msg: '$e왜 안돼');
      return VillageUserTest(
          status: 1,
          msg: 'd',
          data: Data(id: 1, name: '2', email: '3', createdAt: DateTime.now()));
    }
  }

  static Future<AddressModel> getJusoInfo() async {
    final url = Uri.parse(
        'https://dapi.kakao.com/v2/local/search/address.json?query=연산동');
    final headers = {
      'Authorization': 'KakaoAK be27266b89f7c26c366f013dccf137a3'
    };

    try {
      final response = await http.get(url, headers: headers);
      print(response.body);
      final AddressModel address = AddressModelFromJson(response.body);
      print(address);
      return address;
    } catch (e) {
      Fluttertoast.showToast(msg: '$e왜 안돼');
      return AddressModel(documents: null!, meta: null!);
    }
  }
}

import 'package:dio/dio.dart';
import 'package:village/model/address/address_model.dart';

class AddressRepository {
  static final AddressRepository _instance = AddressRepository._single();
  factory AddressRepository() {
    return _instance;
  }
  AddressRepository._single();

  // 도로명 주소를 입력하면 위도, 경도가 포함된 주소 정보가 반환된다.
  // 모든 데이터가 필요 없고 , 데이터마다 null 이 달라서 필요 없는 데이터 모두 삭제함
  Future<AddressModel> addressReq(String query) async {
    final dio = Dio();
    final headers = {
      "Authorization": "KakaoAK be27266b89f7c26c366f013dccf137a3"
    };
    const url = "https://dapi.kakao.com/v2/local/search/address.json";
    final response = await dio.get(url,
        queryParameters: {'query': query}, options: Options(headers: headers));
    // Logger().d(response.data);
    if (response.statusCode == 200) {
      return AddressModel.fromJson(response.data);
    } else {
      throw Exception('주소 요청 실패');
    }
  }
}

import 'package:dio/dio.dart';
import 'package:village/core/constants/http.dart';
import 'package:village/dto/response_dto.dart';
import 'package:village/model/search/search.dart';

class SearchRepository {
  static final SearchRepository _instance = SearchRepository._single();

  factory SearchRepository() {
    return _instance;
  }

  SearchRepository._single();

  Future<ResponseDTO> fetchPostList(String jwt) async {
    try {
      Response response = await dio.get(
        "/post");
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      List<dynamic> mapList =
          responseDTO.data as List<dynamic>; // as List<dynamic> 생략가능 : 묵시적 변환
      // e : post처럼 생긴 map
      List<Search> searchList = mapList.map((e) => Search.fromJson(e)).toList();
      responseDTO.data = searchList;
      return responseDTO;
    } catch (e) {
      return ResponseDTO(code: -1, msg: "실패 : ${e}");
    }
  }

// Future<ResponseDTO> fetchPost(int id, String jwt) async {
//   // 나중에 jwt는 인터셉터 사용
//   try {
//     Response response = await dio.get("/post/$id",
//         options: Options(
//           // header를 추가하고싶을 때 사용
//           headers: {
//             "Authorization": "$jwt" // 받아오면됨!
//           },
//         ));
//     ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
//     responseDTO.data = Post.fromJson(responseDTO.data);
//     return responseDTO;
//   } catch (e) {
//     return ResponseDTO(code: -1, msg: "실패 : ${e}");
//   }
// }
}

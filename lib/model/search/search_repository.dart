
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:village/core/constants/http.dart';
import 'package:village/dto/response_dto.dart';
import 'package:village/model/search/search.dart';
import 'package:http/http.dart' as http;
import 'package:village/model/search/search_list.dart';

class SearchRepository {
  static final SearchRepository _instance = SearchRepository._single();

  factory SearchRepository() {
    return _instance;
  }

  SearchRepository._single();

  Future<ResponseDTO> fetchSearchList(String keyword) async {
    try {
      Response response = await dio.get(
        "/search?keyword=$keyword");
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      List<dynamic> mapList =
          responseDTO.data as List<dynamic>; // as List<dynamic> 생략가능 : 묵시적 변환
      // e : post처럼 생긴 map
      List<SearchList> searchList = mapList.map((e) => SearchList.fromJson(e)).toList();
      responseDTO.data = searchList;
      return responseDTO;
    } catch (e) {
      return ResponseDTO(code: -1, msg: "실패 : ${e}");
    }
  }

}

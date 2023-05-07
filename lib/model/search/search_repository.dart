import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:village/core/constants/http.dart';
import 'package:village/dto/response_dto.dart';
import 'package:village/model/place/place_List.dart';

class SearchRepository {
  static final SearchRepository _instance = SearchRepository._single();

  factory SearchRepository() {
    return _instance;
  }

  SearchRepository._single();

  Future<ResponseDTO> fetchSearchList(String keyword) async {
    String msg = "";
    Response response = await dio.get("/search?keyword=$keyword");
    if (response.statusCode == 200) {
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      msg = responseDTO.msg!;
      // Logger().d(responseDTO.data);
      responseDTO.data = placesFromJson(responseDTO.data);
      Logger().d('파싱 성공');
      return responseDTO;
    } else {
      Logger().d('통신 실패');
      return ResponseDTO(code: -1, msg: msg, data: null);
    }
  }
}

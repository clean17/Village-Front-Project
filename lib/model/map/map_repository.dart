import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:village/core/constants/http.dart';
import 'package:village/dto/response_dto.dart';
import 'package:village/model/map/map_xy.dart';

class MapRepository {
  static final MapRepository _instance = MapRepository._single();
  factory MapRepository() {
    return _instance;
  }
  MapRepository._single();

  Future<ResponseDTO> fetchMapXyList() async {
    String msg = "";
    Logger().d('응답 준비');
    Response response = await dio.get(
      "/maps",
    );
    Logger().d('응답 성공');
    if (response.statusCode == 200) {
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      msg = responseDTO.msg!;
      Logger().d(response.data);
      responseDTO.data = mapXyFromJson(responseDTO.data);
      Logger().d('파싱 성공');
      return responseDTO;
    } else {
      Logger().d('통신 실패');
      return ResponseDTO(code: -1, msg: msg, data: null);
    }
  }
}

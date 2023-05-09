import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:village/core/constants/http.dart';
import 'package:village/dto/place_request.dart';
import 'package:village/dto/response_dto.dart';
import 'package:village/model/place/place.dart';
import 'package:village/model/place/place_List.dart';

class PlaceRepository {
  static final PlaceRepository _instance = PlaceRepository._single();
  factory PlaceRepository() {
    return _instance;
  }
  PlaceRepository._single();

  Future<ResponseDTO> fetchSave(PlaceSaveReqDTO saveReqDto, String jwt) async {
    String msg = "";
    Logger().d('응답 준비');
    Response response = await dio.post(
      "/host/places",
      data: saveReqDto.toJson(),
      options: Options(headers: {"Authorization": jwt}),
    );
    Logger().d('응답 성공');
    Logger().d(response.statusCode);
    if (response.statusCode == 200) {
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      msg = responseDTO.msg!;
      Logger().d(response.data);
      responseDTO.data = Place.fromJson(responseDTO.data);
      Logger().d('파싱 성공');
      return responseDTO;
    } else {
      Logger().d('통신 실패');
      return ResponseDTO(code: -1, msg: msg, data: null);
    }
  }

  Future<ResponseDTO> fetchMain() async {
    String msg = "";
    // Logger().d('응답 준비');
    // 바보야 get post 구분
    Response response = await dio.get(
      "/places",
      // options: Options(headers: {"Authorization": jwt}),
    );
    // Logger().d('응답 성공');
    // Logger().d(response.statusCode);
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

  Future<ResponseDTO> fetchDetail(int id) async {
    String msg = "";
    // Logger().d('응답 준비');
    // 바보야 get post 구분
    Response response = await dio.get(
      "/places/$id",
      // options: Options(headers: {"Authorization": jwt}),
    );
    // Logger().d('응답 성공');
    // Logger().d(response.statusCode);
    if (response.statusCode == 200) {
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      msg = responseDTO.msg!;
      // Logger().d(responseDTO.data);
      responseDTO.data = Place.fromJson(responseDTO.data);
      Logger().d('파싱 성공');
      return responseDTO;
    } else {
      Logger().d('통신 실패');
      return ResponseDTO(code: -1, msg: msg, data: null);
    }
  }

  Future<ResponseDTO> fetchMap(int id) async {
    String msg = "";
    Logger().d('응답 준비');
    Response response = await dio.get(
      "/places/$id/map",
      // options: Options(headers: {"Authorization": jwt}),
    );
    Logger().d('응답 성공');
    Logger().d(response.statusCode);
    if (response.statusCode == 200) {
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      msg = responseDTO.msg!;
      Logger().d(responseDTO.data);
      responseDTO.data = Place.fromJson(responseDTO.data);
      Logger().d('파싱 성공');
      return responseDTO;
    } else {
      Logger().d('통신 실패');
      return ResponseDTO(code: -1, msg: msg, data: null);
    }
  }

  // Future<ResponseDTO> testImage(ImageReqDTO iDTO) async {
  //   String msg = "";
  //   Response response = await dio.post(
  //     "/bootpaytest",
  //     data: iDTO.toJson(),
  //   );
  //   Logger().d('응답 성공');
  //   if (response.statusCode == 200) {
  //     ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
  //     Logger().d(response.data);
  //     Logger().d('파싱 성공');

  //     return responseDTO;
  //   } else {
  //     Logger().d('통신 실패');
  //     return ResponseDTO(code: -1, msg: msg, data: null);
  //   }
  // }
}

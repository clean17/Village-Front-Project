import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:village/core/constants/http.dart';
import 'package:village/core/utils/show_toast.dart';
import 'package:village/dto/place_request.dart';
import 'package:village/dto/response_dto.dart';
import 'package:village/model/place/place.dart';

class PlaceRepository {
  static final PlaceRepository _instance = PlaceRepository._single();
  factory PlaceRepository() {
    return _instance;
  }
  PlaceRepository._single();

  Future<ResponseDTO> fetchSave(PlaceSaveReqDTO saveReqDto, String jwt) async {
    String msg = "";
    try {
      Response response = await dio.post("/places",
          data: saveReqDto.toJson(),
          options: Options(headers: {"Authorization": jwt}));
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      msg = responseDTO.msg!;
      responseDTO.data = Place.fromJson(responseDTO.data);
      showToast(responseDTO.data);
      return responseDTO;
    } catch (e) {
      return ResponseDTO(code: -1, msg: msg);
    }
  }

  Future<void> testImage(ImageReqDTO saveReqDto) async {
    // String msg = "";
    try {
      Response response = await dio.post(
        "/bootpaytest",
        data: saveReqDto.toJson(),
      );
      Logger().d('레파지토리 응답데이터 확인');
      if (response.statusCode == 200) {
        Logger().d(response.data);
      }

      Logger().d('이미지 보냄');
      // return responseDTO;
    } catch (e) {
      Logger().d('이미지 못 보냄');
    }
  }
}

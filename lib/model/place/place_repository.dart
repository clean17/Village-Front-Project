import 'package:dio/dio.dart';
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

  Future<ResponseDTO> fetchSave(SaveReqDto saveReqDto) async {
    String msg = "";
    try {
      Response response = await dio.post("/place", data: saveReqDto.toJson());
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      msg = responseDTO.msg!;
      responseDTO.data = Place.fromJson(responseDTO.data);
      showToast(responseDTO.data);
      return responseDTO;
    } catch (e) {
      return ResponseDTO(code: -1, msg: msg);
    }
  }
}

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:village/core/constants/http.dart';
import 'package:village/dto/host_request.dart';
import 'package:village/dto/response_dto.dart';
import 'package:village/model/host/host.dart';



class HostRepository {
  static final HostRepository _instance = HostRepository._single();
  factory HostRepository() {
    return _instance;
  }
  HostRepository._single();


  Future<ResponseDTO> fetchHostJoin(HostReqDto hostReqDto) async {
    try {
      Response response = await dio.post("/user/host", data: hostReqDto.toJson());
      Logger().d("${response.data}");
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      Logger().d("2");
      responseDTO.data = Host.fromJson(responseDTO.data);
      return responseDTO;
    } catch (e) {
      return ResponseDTO(code: -1, msg: "호스트 신청 실패");
    }
  }
}

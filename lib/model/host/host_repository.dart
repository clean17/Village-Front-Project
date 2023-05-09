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

  Future<ResponseDTO> fetchHostJoin(HostReqDto hostReqDto, String jwt) async {
    Logger().d('응답준비');
    Response response = await dio.post("/user/host",
        data: hostReqDto.toJson(),
        options: Options(
          // header를 추가하고싶을 때 사용
          headers: {
            "Authorization": jwt // 받아오면됨!
          },
        ));
    if (response.statusCode == 200) {
      Logger().d('응답성공');
      Logger().d("${response.data}");
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      responseDTO.data = Host.fromJson(responseDTO.data);
      return responseDTO;
    } else {
      return ResponseDTO(code: -1, msg: "호스트 신청 실패");
    }
  }
}

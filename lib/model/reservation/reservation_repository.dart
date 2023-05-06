import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:village/core/constants/http.dart';
import 'package:village/dto/reservation_request.dart';
import 'package:village/dto/response_dto.dart';
import 'package:village/model/reservation/reservation.dart';

class ReservationRepository {
  static final ReservationRepository _instance =
      ReservationRepository._single();
  factory ReservationRepository() {
    return _instance;
  }
  ReservationRepository._single();

  Future<ResponseDTO> fetchReservation(
      ReservationSaveReqDto saveReqDto, String jwt) async {
    String msg = "";
    Logger().d('응답 준비');
    Response response = await dio.post(
      "/reservation",
      data: saveReqDto.toJson(),
      options: Options(headers: {"Authorization": jwt}),
    );
    Logger().d('응답 성공');
    Logger().d(response.statusCode);
    if (response.statusCode == 200) {
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      msg = responseDTO.msg!;
      Logger().d(response.data);
      responseDTO.data = Reservation.fromJson(responseDTO.data);
      Logger().d('파싱 성공');
      return responseDTO;
    } else {
      Logger().d('통신 실패');
      return ResponseDTO(code: -1, msg: msg, data: null);
    }
  }
}

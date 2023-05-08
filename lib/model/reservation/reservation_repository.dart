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
      "/user/reservation",
      data: saveReqDto.toJson(),
      options: Options(headers: {"Authorization": jwt}),
    );
    // Logger().d('응답 성공');
    // Logger().d(response.statusCode);
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



  Future<ResponseDTO> fetchReservationList(String jwt) async {
    try {
      Response response = await dio.get("/user/reservation",
          options: Options(
            // header를 추가하고싶을 때 사용
            headers: {
              "Authorization": "$jwt" // 받아오면됨!
            },
          ));
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      List<dynamic> mapList =
      responseDTO.data as List<dynamic>; // as List<dynamic> 생략가능 : 묵시적 변환
      // e : post처럼 생긴 map
      List<Reservation> ReservationList = mapList.map((e) => Reservation.fromJson(e)).toList();
      responseDTO.data = ReservationList;
      return responseDTO;
    } catch (e) {
      return ResponseDTO(code: -1, msg: "실패 : ${e}");
    }
  }

}

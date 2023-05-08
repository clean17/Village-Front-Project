import 'package:village/dto/reservation_request.dart';
import 'package:village/dto/response_dto.dart';
import 'package:village/model/reservation/reservation.dart';
import 'package:village/model/reservation/reservation_repository.dart';

void main() async {
  // 테스트    flutter test test/model/reservation/reservation_repository_test.dart
  String jwt =
      "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJqd3RzdHVkeSIsInJvbGUiOiJVU0VSIiwiaWQiOjEsImV4cCI6MTY4NDA1NDM2OH0.KAh7smiN5YNtPDey0vhziHL3exbMJjuUSL0UxfuTWu6zFam2983pi4X1cGhLzQ9zIND3nfZwVTJlNCdwGSxZHA";

  ReservationSaveReqDto saveReqDto = ReservationSaveReqDto(
    placeId: 1,
    peopleNum: 1,
    date: DateTime.now(),
    startTime: DateTime.now(),
    endTime: DateTime.now(),
  );
  // await ReservationRepository().fetchReservation(saveReqDto, jwt);

  Future<void> fetchPostList_test() async{
    // String jwt = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJjb3PthqDtgbAiLCJpZCI6MSwiZXhwIjoxNjgyNjQ5NzQ3fQ.KIBy1lIC8kuA2V3k_aKS8-EHgiRj9dwS_KkUEBY6XVezIpP6ScVRHye_re7wXZyThk_2ZaX5uGeRX9T61mhCoQ";
    ResponseDTO responseDTO = await ReservationRepository().fetchReservationList(jwt);
    print(responseDTO.code);
    print(responseDTO.msg);
    List<Reservation> reservationList = responseDTO.data;
    reservationList.forEach((element) {
      print(element.date);
    });
  }
    await fetchPostList_test();
}

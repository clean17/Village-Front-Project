import 'package:village/dto/reservation_request.dart';
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
  await ReservationRepository().fetchReservation(saveReqDto, jwt);
}

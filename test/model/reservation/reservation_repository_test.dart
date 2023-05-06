import 'package:village/dto/reservation_request.dart';
import 'package:village/model/reservation/reservation_repository.dart';

void main() async {
  // 테스트    flutter test test/model/reservation/reservation_repository_test.dart
  String jwt =
      "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJqd3RzdHVkeSIsInJvbGUiOiJVU0VSIiwiaWQiOjEsImV4cCI6MTY4MzM1ODk3OH0.GwxiXtfO6iEeP54gqDvzJvP31IsSnpZh6nn5XuRVq5n9AqpX7NUFZzmQFBu7gW3x3Z3i2f3DySdqBIg8DSaFZg";

  ReservationSaveReqDto saveReqDto = ReservationSaveReqDto(
    placeId: 1,
    peopleNum: 1,
    date: DateTime.now(),
    startTime: DateTime.now(),
    endTime: DateTime.now(),
  );
  // Logger().d('요청보냄');
  await ReservationRepository().fetchReservation(saveReqDto, jwt);
}

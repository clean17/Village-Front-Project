import 'package:intl/intl.dart';

class ReservationSaveReqDto {
  int placeId;
  int peopleNum;
  DateTime date;
  DateTime startTime;
  DateTime endTime;

  ReservationSaveReqDto({
    required this.placeId,
    required this.peopleNum,
    required this.date,
    required this.startTime,
    required this.endTime,
  });

  DateFormat dateFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss");
  Map<String, dynamic> toJson() => {
        "placeId": placeId,
        "peopleNum": peopleNum,
        "date": dateFormat.format(date),
        "startTime": dateFormat.format(startTime),
        "endTime": dateFormat.format(endTime),
      };
}

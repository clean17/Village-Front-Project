// To parse this JSON data, do
//
//     final reservationSaveReqDto = reservationSaveReqDtoFromJson(jsonString);

import 'dart:convert';

ReservationSaveReqDto reservationSaveReqDtoFromJson(String str) =>
    ReservationSaveReqDto.fromJson(json.decode(str));

String reservationSaveReqDtoToJson(ReservationSaveReqDto data) =>
    json.encode(data.toJson());

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

  factory ReservationSaveReqDto.fromJson(Map<String, dynamic> json) =>
      ReservationSaveReqDto(
        placeId: json["placeId"],
        peopleNum: json["peopleNum"],
        date: DateTime.parse(json["date"]),
        startTime: DateTime.parse(json["startTime"]),
        endTime: DateTime.parse(json["endTime"]),
      );

  Map<String, dynamic> toJson() => {
        "placeId": placeId,
        "peopleNum": peopleNum,
        "date": date.toIso8601String(),
        "startTime": startTime.toIso8601String(),
        "endTime": endTime.toIso8601String(),
      };
}

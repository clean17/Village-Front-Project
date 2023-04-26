// To parserequired this JSON data, do
//
//     final place = placeFromJson(jsonString);

import 'dart:convert';

List<Place> placeFromJson(String str) =>
    List<Place>.from(json.decode(str).map((x) => Place.fromJson(x)));

String placeToJson(List<Place> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Place {
  Place({
    required this.id,
    required this.title,
    required this.address,
    required this.tel,
    required this.placeIntroductionInfo,
    required this.notice,
    required this.fileInfo,
    required this.maxPeople,
    required this.pricePerHour,
    required this.startTime,
    required this.endTime,
  });

  int id;
  String title;
  Address address;
  String tel;
  String placeIntroductionInfo;
  String notice;
  dynamic fileInfo;
  int maxPeople;
  int pricePerHour;
  String startTime;
  String endTime;

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        id: json["id"],
        title: json["title"],
        address: Address.fromJson(json["address"]),
        tel: json["tel"],
        placeIntroductionInfo: json["placeIntroductionInfo"],
        notice: json["notice"],
        fileInfo: json["fileInfo"],
        maxPeople: json["maxPeople"],
        pricePerHour: json["pricePerHour"],
        startTime: json["startTime"],
        endTime: json["endTime"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "address": address.toJson(),
        "tel": tel,
        "placeIntroductionInfo": placeIntroductionInfo,
        "notice": notice,
        "fileInfo": fileInfo,
        "maxPeople": maxPeople,
        "pricePerHour": pricePerHour,
        "startTime": startTime,
        "endTime": endTime,
      };
}

class Address {
  Address({
    required this.id,
    required this.roadFullAddr,
    required this.sggNm,
    required this.zipNo,
    required this.lat,
    required this.lng,
  });

  int id;
  String roadFullAddr;
  String sggNm;
  String zipNo;
  String lat;
  String lng;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        roadFullAddr: json["roadFullAddr"],
        sggNm: json["sggNm"],
        zipNo: json["zipNo"],
        lat: json["lat"],
        lng: json["lng"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "roadFullAddr": roadFullAddr,
        "sggNm": sggNm,
        "zipNo": zipNo,
        "lat": lat,
        "lng": lng,
      };
}

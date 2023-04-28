// To parse this JSON data, do
//
//     final place = placeFromJson(jsonString);

import 'dart:convert';

Place placeFromJson(String str) => Place.fromJson(json.decode(str));

String placeToJson(Place data) => json.encode(data.toJson());

class Place {
  int id;
  String title;
  Host host;
  String placeIntroductionInfo;
  String notice;
  String tel;
  int maxPeople;
  int maxParking;
  int pricePerHour;
  String startTime;
  String endTime;
  bool isConfirmed;
  String categoryName;
  List<Image> image;
  List<DayOfWeek> dayOfWeek;
  List<Hashtag> hashtag;
  Address address;
  List<FacilityInfo> facilityInfo;

  Place({
    required this.id,
    required this.title,
    required this.host,
    required this.placeIntroductionInfo,
    required this.notice,
    required this.tel,
    required this.maxPeople,
    required this.maxParking,
    required this.pricePerHour,
    required this.startTime,
    required this.endTime,
    required this.isConfirmed,
    required this.categoryName,
    required this.image,
    required this.dayOfWeek,
    required this.hashtag,
    required this.address,
    required this.facilityInfo,
  });

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        id: json["id"],
        title: json["title"],
        host: Host.fromJson(json["host"]),
        placeIntroductionInfo: json["placeIntroductionInfo"],
        notice: json["notice"],
        tel: json["tel"],
        maxPeople: json["maxPeople"],
        maxParking: json["maxParking"],
        pricePerHour: json["pricePerHour"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        isConfirmed: json["isConfirmed"],
        categoryName: json["categoryName"],
        image: List<Image>.from(json["Image"].map((x) => Image.fromJson(x))),
        dayOfWeek: List<DayOfWeek>.from(
            json["dayOfWeek"].map((x) => DayOfWeek.fromJson(x))),
        hashtag:
            List<Hashtag>.from(json["hashtag"].map((x) => Hashtag.fromJson(x))),
        address: Address.fromJson(json["address"]),
        facilityInfo: List<FacilityInfo>.from(
            json["facilityInfo"].map((x) => FacilityInfo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "host": host.toJson(),
        "placeIntroductionInfo": placeIntroductionInfo,
        "notice": notice,
        "tel": tel,
        "maxPeople": maxPeople,
        "maxParking": maxParking,
        "pricePerHour": pricePerHour,
        "startTime": startTime,
        "endTime": endTime,
        "isConfirmed": isConfirmed,
        "categoryName": categoryName,
        "Image": List<dynamic>.from(image.map((x) => x.toJson())),
        "dayOfWeek": List<dynamic>.from(dayOfWeek.map((x) => x.toJson())),
        "hashtag": List<dynamic>.from(hashtag.map((x) => x.toJson())),
        "address": address.toJson(),
        "facilityInfo": List<dynamic>.from(facilityInfo.map((x) => x.toJson())),
      };
}

class Address {
  int id;
  String address;
  String sigungu;
  String zonecode;
  String detailAddress;
  String x;
  String lng;

  Address({
    required this.id,
    required this.address,
    required this.sigungu,
    required this.zonecode,
    required this.detailAddress,
    required this.x,
    required this.lng,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        address: json["address"],
        sigungu: json["sigungu"],
        zonecode: json["zonecode"],
        detailAddress: json["detailAddress"],
        x: json["x"],
        lng: json["lng"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "address": address,
        "sigungu": sigungu,
        "zonecode": zonecode,
        "detailAddress": detailAddress,
        "x": x,
        "lng": lng,
      };
}

class DayOfWeek {
  int id;
  String dayOfWeekName;

  DayOfWeek({
    required this.id,
    required this.dayOfWeekName,
  });

  factory DayOfWeek.fromJson(Map<String, dynamic> json) => DayOfWeek(
        id: json["id"],
        dayOfWeekName: json["dayOfWeekName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dayOfWeekName": dayOfWeekName,
      };
}

class FacilityInfo {
  int id;
  String facilityName;

  FacilityInfo({
    required this.id,
    required this.facilityName,
  });

  factory FacilityInfo.fromJson(Map<String, dynamic> json) => FacilityInfo(
        id: json["id"],
        facilityName: json["facilityName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "facilityName": facilityName,
      };
}

class Hashtag {
  int id;
  String hashtagName;

  Hashtag({
    required this.id,
    required this.hashtagName,
  });

  factory Hashtag.fromJson(Map<String, dynamic> json) => Hashtag(
        id: json["id"],
        hashtagName: json["hashtagName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "hashtagName": hashtagName,
      };
}

class Host {
  int id;
  String hostName;

  Host({
    required this.id,
    required this.hostName,
  });

  factory Host.fromJson(Map<String, dynamic> json) => Host(
        id: json["id"],
        hostName: json["hostName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "hostName": hostName,
      };
}

class Image {
  String id;
  String fileName;
  String fileUrl;

  Image({
    required this.id,
    required this.fileName,
    required this.fileUrl,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        fileName: json["fileName"],
        fileUrl: json["fileUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fileName": fileName,
        "fileUrl": fileUrl,
      };
}

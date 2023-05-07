// To parse this JSON data, do
//
//     final place = placeFromJson(jsonString);

import 'dart:convert';

Place placeFromJson(String str) => Place.fromJson(json.decode(str));

String placeToJson(Place data) => json.encode(data.toJson());

class Place {
  int id;
  String title;
  Address address;
  String tel;
  DateTime startTime;
  DateTime endTime;
  String placeIntroductionInfo;
  int maxPeople;
  int maxParking;
  int pricePerHour;
  String notice;
  FileClass file;
  Host host;
  List<Review> review;
  Scrap scrap;
  List<Hashtag> hashtags;
  List<Facility> facilitys;
  List<DayOfWeek> dayOfWeeks;

  Place({
    required this.id,
    required this.title,
    required this.address,
    required this.tel,
    required this.startTime,
    required this.endTime,
    required this.placeIntroductionInfo,
    required this.maxPeople,
    required this.maxParking,
    required this.pricePerHour,
    required this.notice,
    required this.file,
    required this.host,
    required this.review,
    required this.scrap,
    required this.hashtags,
    required this.facilitys,
    required this.dayOfWeeks,
  });

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        id: json["id"],
        title: json["title"],
        address: Address.fromJson(json["address"]),
        tel: json["tel"],
        startTime: DateTime.parse(json["startTime"]),
        endTime: DateTime.parse(json["endTime"]),
        placeIntroductionInfo: json["placeIntroductionInfo"],
        maxPeople: json["maxPeople"],
        maxParking: json["maxParking"],
        pricePerHour: json["pricePerHour"],
        notice: json["notice"],
        file: FileClass.fromJson(json["file"]),
        host: Host.fromJson(json["host"]),
        review:
            List<Review>.from(json["review"].map((x) => Review.fromJson(x))),
        scrap: Scrap.fromJson(json["scrap"]),
        hashtags: List<Hashtag>.from(
            json["hashtags"].map((x) => Hashtag.fromJson(x))),
        facilitys: List<Facility>.from(
            json["facilitys"].map((x) => Facility.fromJson(x))),
        dayOfWeeks: List<DayOfWeek>.from(
            json["dayOfWeeks"].map((x) => DayOfWeek.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "address": address.toJson(),
        "tel": tel,
        "startTime": startTime.toIso8601String(),
        "endTime": endTime.toIso8601String(),
        "placeIntroductionInfo": placeIntroductionInfo,
        "maxPeople": maxPeople,
        "maxParking": maxParking,
        "pricePerHour": pricePerHour,
        "notice": notice,
        "file": file.toJson(),
        "host": host.toJson(),
        "review": List<dynamic>.from(review.map((x) => x.toJson())),
        "scrap": scrap.toJson(),
        "hashtags": List<dynamic>.from(hashtags.map((x) => x.toJson())),
        "facilitys": List<dynamic>.from(facilitys.map((x) => x.toJson())),
        "dayOfWeeks": List<dynamic>.from(dayOfWeeks.map((x) => x.toJson())),
      };
}

class Address {
  int id;
  String address;
  String sigungu;
  String zonecode;
  String detailAddress;
  String x;
  String y;

  Address({
    required this.id,
    required this.address,
    required this.sigungu,
    required this.zonecode,
    required this.detailAddress,
    required this.x,
    required this.y,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        address: json["address"],
        sigungu: json["sigungu"],
        zonecode: json["zonecode"],
        detailAddress: json["detailAddress"],
        x: json["x"],
        y: json["y"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "address": address,
        "sigungu": sigungu,
        "zonecode": zonecode,
        "detailAddress": detailAddress,
        "x": x,
        "y": y,
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

class Facility {
  int id;
  String facilityName;

  Facility({
    required this.id,
    required this.facilityName,
  });

  factory Facility.fromJson(Map<String, dynamic> json) => Facility(
        id: json["id"],
        facilityName: json["facilityName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "facilityName": facilityName,
      };
}

class FileClass {
  int id;
  String fileName;
  String fileUrl;
  dynamic extension;
  String status;

  FileClass({
    required this.id,
    required this.fileName,
    required this.fileUrl,
    this.extension,
    required this.status,
  });

  factory FileClass.fromJson(Map<String, dynamic> json) => FileClass(
        id: json["id"],
        fileName: json["fileName"],
        fileUrl: json["fileUrl"],
        extension: json["extension"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fileName": fileName,
        "fileUrl": fileUrl,
        "extension": extension,
        "status": status,
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

class Review {
  int id;
  int starRating;
  String content;
  String? image;
  int likeCount;
  DateTime createdAt;

  Review({
    required this.id,
    required this.starRating,
    required this.content,
    this.image,
    required this.likeCount,
    required this.createdAt,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["id"],
        starRating: json["starRating"],
        content: json["content"],
        image: json["image"],
        likeCount: json["likeCount"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "starRating": starRating,
        "content": content,
        "image": image,
        "likeCount": likeCount,
        "createdAt": createdAt.toIso8601String(),
      };
}

class Scrap {
  int id;

  Scrap({
    required this.id,
  });

  factory Scrap.fromJson(Map<String, dynamic> json) => Scrap(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}

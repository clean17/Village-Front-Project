// To parse this JSON data, do
//
//     final places = placesFromJson(jsonString);

import 'dart:convert';

// 아래 코드는 http 라이브러리를 사용하기 위한 것 ?
List<Places> placesFromJson1(String str) =>
    List<Places>.from(json.decode(str).map((x) => Places.fromJson(x)));

// dio 라이브러리는 json 으로 변환하는 과정을 생략
List<Places> placesFromJson(dynamic str) =>
    List<Places>.from(str.map((x) => Places.fromJson(x)));

class Places {
  int id;
  String title;
  MainAddress? address;
  List<FileUrl>? fileUrls;
  Review? review;
  List<Hashtag>? hashtags;
  int maxPeople;
  int? maxParking;
  int pricePerHour;
  Scrap? scrap;

  Places({
    required this.id,
    required this.title,
    required this.address,
    required this.fileUrls,
    this.review,
    this.hashtags,
    required this.maxPeople,
    this.maxParking,
    required this.pricePerHour,
    this.scrap,
  });

  factory Places.fromJson(Map<String, dynamic> json) => Places(
        id: json["id"],
        title: json["title"],
        address: json["address"] != null
            ? MainAddress.fromJson(json["address"])
            : null,
        fileUrls: json["fileUrls"] != null
            ? List<FileUrl>.from(
                json["fileUrls"].map((x) => FileUrl.fromJson(x)))
            : [],
        review: json["review"] == null ? null : Review.fromJson(json["review"]),
        hashtags: json["hashtags"] == null
            ? []
            : List<Hashtag>.from(
                json["hashtags"]!.map((x) => Hashtag.fromJson(x))),
        maxPeople: json["maxPeople"],
        maxParking: json["maxParking"],
        pricePerHour: json["pricePerHour"],
        scrap: json["scrap"] != null ? Scrap.fromJson(json["scrap"]) : null,
      );
}

class MainAddress {
  int id;
  String sigungu;

  MainAddress({
    required this.id,
    required this.sigungu,
  });

  factory MainAddress.fromJson(Map<String, dynamic> json) => MainAddress(
        id: json["id"],
        sigungu: json["sigungu"],
      );
}

class FileUrl {
  int id;
  String? fileUrl;

  FileUrl({
    required this.id,
    required this.fileUrl,
  });

  factory FileUrl.fromJson(Map<String, dynamic> json) => FileUrl(
        id: json["id"],
        fileUrl: json["fileUrl"],
      );
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
}

class Review {
  int? ratingStar;
  int? reviewCount;

  Review({
    this.ratingStar,
    this.reviewCount,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        ratingStar: json["ratingStar"],
        reviewCount: json["reviewCount"],
      );
}

class Scrap {
  int id;

  Scrap({
    required this.id,
  });

  factory Scrap.fromJson(Map<String, dynamic> json) => Scrap(
        id: json["id"],
      );
}

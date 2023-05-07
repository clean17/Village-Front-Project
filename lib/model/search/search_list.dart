// To parse this JSON data, do
//
//     final searchList = searchListFromJson(jsonString);

import 'dart:convert';

SearchList searchListFromJson(String str) => SearchList.fromJson(json.decode(str));

String searchListToJson(SearchList data) => json.encode(data.toJson());

class SearchList {
  int id;
  String title;
  int maxPeople;
  int maxParking;
  int pricePerHour;
  String keyword;
  Address address;
  Review review;
  List<Hashtag> hashtags;
  List<FileUrl> fileUrls;
  dynamic scrap;

  SearchList({
    required this.id,
    required this.title,
    required this.maxPeople,
    required this.maxParking,
    required this.pricePerHour,
    required this.keyword,
    required this.address,
    required this.review,
    required this.hashtags,
    required this.fileUrls,
    this.scrap,
  });

  factory SearchList.fromJson(Map<String, dynamic> json) => SearchList(
    id: json["id"],
    title: json["title"],
    maxPeople: json["maxPeople"],
    maxParking: json["maxParking"],
    pricePerHour: json["pricePerHour"],
    keyword: json["keyword"],
    address: Address.fromJson(json["address"]),
    review: Review.fromJson(json["review"]),
    hashtags: List<Hashtag>.from(json["hashtags"].map((x) => Hashtag.fromJson(x))),
    fileUrls: List<FileUrl>.from(json["fileUrls"].map((x) => FileUrl.fromJson(x))),
    scrap: json["scrap"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "maxPeople": maxPeople,
    "maxParking": maxParking,
    "pricePerHour": pricePerHour,
    "keyword": keyword,
    "address": address.toJson(),
    "review": review.toJson(),
    "hashtags": List<dynamic>.from(hashtags.map((x) => x.toJson())),
    "fileUrls": List<dynamic>.from(fileUrls.map((x) => x.toJson())),
    "scrap": scrap,
  };
}

class Address {
  int id;
  String sigungu;

  Address({
    required this.id,
    required this.sigungu,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    id: json["id"],
    sigungu: json["sigungu"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sigungu": sigungu,
  };
}

class FileUrl {
  int id;
  String fileUrl;

  FileUrl({
    required this.id,
    required this.fileUrl,
  });

  factory FileUrl.fromJson(Map<String, dynamic> json) => FileUrl(
    id: json["id"],
    fileUrl: json["fileUrl"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fileUrl": fileUrl,
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

class Review {
  int starRating;
  int reviewCount;

  Review({
    required this.starRating,
    required this.reviewCount,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    starRating: json["starRating"],
    reviewCount: json["reviewCount"],
  );

  Map<String, dynamic> toJson() => {
    "starRating": starRating,
    "reviewCount": reviewCount,
  };
}

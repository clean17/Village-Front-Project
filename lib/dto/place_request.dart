import 'package:intl/intl.dart';

class PlaceSaveReqDTO {
  String title;
  String placeIntroductionInfo;
  String notice;
  String tel;
  int maxPeople;
  int maxParking;
  int pricePerHour;
  DateTime startTime;
  DateTime endTime;
  String categoryName;
  AddressReqDTO address;
  List<ImageReqDTO> image;
  List<DayOfWeekReqDTO> dayOfWeek;
  List<HashtagReqDTO> hashtag;
  List<FacilityInfoReqDTO> facilityInfo;
  bool isConfirmed;

  PlaceSaveReqDTO({
    required this.title,
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
    required this.address,
    required this.image,
    required this.dayOfWeek,
    required this.hashtag,
    required this.facilityInfo,
  });

  Map<String, dynamic> toJson() => {
        "title": title,
        "placeIntroductionInfo": placeIntroductionInfo,
        "notice": notice,
        "tel": tel,
        "maxPeople": maxPeople,
        "maxParking": maxParking,
        "pricePerHour": pricePerHour,
        "startTime": DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(startTime),
        "endTime": DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(endTime),
        "isConfirmed": isConfirmed,
        "categoryName": categoryName,
        "address": address.toJson(),
        "image": List<dynamic>.from(image.map((x) => x.toJson())),
        "dayOfWeek": List<dynamic>.from(dayOfWeek.map((x) => x.toJson())),
        "hashtag": List<dynamic>.from(hashtag.map((x) => x.toJson())),
        "facilityInfo": List<dynamic>.from(facilityInfo.map((x) => x.toJson())),
      };
}

class AddressReqDTO {
  String? address;
  String? sigungu;
  String? zonecode;
  String? detailAddress;
  String? x;
  String? y;

  AddressReqDTO({
    required this.address,
    required this.sigungu,
    required this.zonecode,
    required this.detailAddress,
    required this.x,
    required this.y,
  });

  Map<String, dynamic> toJson() => {
        "address": address,
        "sigungu": sigungu,
        "zonecode": zonecode,
        "detailAddress": detailAddress,
        "x": x,
        "y": y,
      };
}

class DayOfWeekReqDTO {
  String dayOfWeekName;

  DayOfWeekReqDTO({
    required this.dayOfWeekName,
  });

  Map<String, dynamic> toJson() => {
        "dayOfWeekName": dayOfWeekName,
      };
}

class FacilityInfoReqDTO {
  String facilityName;

  FacilityInfoReqDTO({
    required this.facilityName,
  });

  Map<String, dynamic> toJson() => {
        "facilityName": facilityName,
      };
}

class HashtagReqDTO {
  String hashtagName;

  HashtagReqDTO({
    required this.hashtagName,
  });

  Map<String, dynamic> toJson() => {
        "hashtagName": hashtagName,
      };
}

class ImageReqDTO {
  String fileName;
  String type;
  String fileUrl;

  ImageReqDTO({
    required this.fileName,
    required this.type,
    required this.fileUrl,
  });

  Map<String, dynamic> toJson() => {
        "fileName": fileName,
        "type": type,
        "fileUrl": fileUrl,
      };

  // factory ImageReqDTO.fromJson(Map<String, dynamic> json) {
  //   return ImageReqDTO(
  //     name: json['name'],
  //     type: json['type'],
  //     data: json['data'],
  //   );
  // }
}

class PlaceSaveReqDto {
  String title;
  String placeIntroductionInfo;
  String notice;
  String tel;
  int maxPeople;
  int maxParking;
  int pricePerHour;
  String startTime;
  String endTime;
  String categoryName;
  // Address address;
  // List<Image> image;
  // List<DayOfWeek> dayOfWeek;
  // List<Hashtag> hashtag;
  // List<FacilityInfo> facilityInfo;
  bool isConfirmed;

  PlaceSaveReqDto({
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
    // required this.image,
    // required this.dayOfWeek,
    // required this.hashtag,
    // required this.address,
    // required this.facilityInfo,
  });

  Map<String, dynamic> toJson() => {
        "title": title,
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
        // "Image": List<dynamic>.from(image.map((x) => x.toJson())),
        // "dayOfWeek": List<dynamic>.from(dayOfWeek.map((x) => x.toJson())),
        // "hashtag": List<dynamic>.from(hashtag.map((x) => x.toJson())),
        // "address": address.toJson(),
        // "facilityInfo": List<dynamic>.from(facilityInfo.map((x) => x.toJson())),
      };
}

class Address {
  String address;
  String sigungu;
  String zonecode;
  String detailAddress;
  String x;
  String y;

  Address({
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

class DayOfWeek {
  String dayOfWeekName;

  DayOfWeek({
    required this.dayOfWeekName,
  });

  Map<String, dynamic> toJson() => {
        "dayOfWeekName": dayOfWeekName,
      };
}

class FacilityInfo {
  String facilityName;

  FacilityInfo({
    required this.facilityName,
  });

  Map<String, dynamic> toJson() => {
        "facilityName": facilityName,
      };
}

class Hashtag {
  String hashtagName;

  Hashtag({
    required this.hashtagName,
  });

  Map<String, dynamic> toJson() => {
        "hashtagName": hashtagName,
      };
}

class Image {
  String fileName;
  String fileData;
  String type;

  Image({
    required this.fileName,
    required this.fileData,
    required this.type,
  });

  Map<String, dynamic> toJson() => {
        "fileName": fileName,
        "fileData": fileData,
        "type": type,
      };
}

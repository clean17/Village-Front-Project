// String placeReqDtoToJson(PlaceReqDto data) => json.encode(data.toJson());

class SaveReqDto {
  String title;
  String placeAddress;
  String tel;
  String startTime;
  String endTime;
  String placeIntroductionInfo;
  String notice;
  int maxPeople;
  int pricePerHour;
  DayOfWeek dayOfWeek;
  Hashtag hashtag;
  FacilityInfo facilityInfo;
  Category category;

  SaveReqDto({
    required this.title,
    required this.placeAddress,
    required this.tel,
    required this.startTime,
    required this.endTime,
    required this.placeIntroductionInfo,
    required this.notice,
    required this.maxPeople,
    required this.pricePerHour,
    required this.dayOfWeek,
    required this.hashtag,
    required this.facilityInfo,
    required this.category,
  });

  Map<String, dynamic> toJson() => {
        "title": title,
        "placeAddress": placeAddress,
        "tel": tel,
        "startTime": startTime,
        "endTime": endTime,
        "placeIntroductionInfo": placeIntroductionInfo,
        "notice": notice,
        "maxPeople": maxPeople,
        "pricePerHour": pricePerHour,
        "dayOfWeek": dayOfWeek.toJson(),
        "hashtag": hashtag.toJson(),
        "facilityInfo": facilityInfo.toJson(),
        "category": category.toJson(),
      };
}

class Category {
  String categoryName;

  Category({
    required this.categoryName,
  });

  Map<String, dynamic> toJson() => {
        "categoryName": categoryName,
      };
}

class DayOfWeek {
  List<String> dayOfWeekName;

  DayOfWeek({
    required this.dayOfWeekName,
  });

  Map<String, dynamic> toJson() => {
        "dayOfWeekName": List<dynamic>.from(dayOfWeekName.map((x) => x)),
      };
}

class FacilityInfo {
  List<String> facilityName;

  FacilityInfo({
    required this.facilityName,
  });

  Map<String, dynamic> toJson() => {
        "facilityName": List<dynamic>.from(facilityName.map((x) => x)),
      };
}

class Hashtag {
  List<String> hashtagName;

  Hashtag({
    required this.hashtagName,
  });

  Map<String, dynamic> toJson() => {
        "hashtagName": List<dynamic>.from(hashtagName.map((x) => x)),
      };
}

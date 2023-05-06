class Place {
  int id;
  Host? host;
  String title;
  String placeIntroductionInfo;
  String notice;
  String? tel;
  int maxPeople;
  int maxParking;
  int pricePerHour;
  String? startTime;
  String? endTime;
  bool? isConfirmed;
  String? categoryName;
  Address address;
  List<Image>? image;
  List<DayOfWeek> dayOfWeek;
  List<Hashtag>? hashtags;
  List<FacilityInfo>? facilityInfo;

  Place({
    required this.id,
    required this.host,
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
    required this.hashtags,
    required this.facilityInfo,
  });

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        id: json["id"],
        host: json["host"],
        title: json["title"],
        placeIntroductionInfo: json["placeIntroductionInfo"],
        notice: json["notice"],
        tel: json["tel"],
        maxPeople: json["maxPeople"],
        maxParking: json["maxParking"],
        pricePerHour: json["pricePerHour"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        isConfirmed: json["isConfirmed"] ?? false,
        categoryName: json["categoryName"],
        address: Address.fromJson(json["address"]),
        image: json["image"] != null
            ? List<Image>.from(json["image"].map((x) => Image.fromJson(x)))
            : [],
        dayOfWeek: List<DayOfWeek>.from(
            json["dayOfWeek"].map((x) => DayOfWeek.fromJson(x))),
        hashtags: List<Hashtag>.from(
            json["hashtags"].map((x) => Hashtag.fromJson(x))),
        facilityInfo: List<FacilityInfo>.from(
            json["facilityInfo"].map((x) => FacilityInfo.fromJson(x))),
      );
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
}

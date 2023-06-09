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
  List<FileElement> file;
  Host host;
  List<Review> review;
  int? scrap;
  List<Hashtag> hashtags;
  List<Facility> facilitys;
  List<DayOfWeek> dayOfWeeks;
  String categoryName;
  bool inConfirmed;

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
    required this.categoryName,
    required this.inConfirmed,
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
        file: List<FileElement>.from(
            json["file"].map((x) => FileElement.fromJson(x))),
        host: Host.fromJson(json["host"]),
        review:
            List<Review>.from(json["review"].map((x) => Review.fromJson(x))),
        scrap: json["scrap"],
        hashtags: List<Hashtag>.from(
            json["hashtags"].map((x) => Hashtag.fromJson(x))),
        facilitys: List<Facility>.from(
            json["facilitys"].map((x) => Facility.fromJson(x))),
        dayOfWeeks: List<DayOfWeek>.from(
            json["dayOfWeeks"].map((x) => DayOfWeek.fromJson(x))),
        categoryName: json["categoryName"],
        inConfirmed: json["isConfirmed"] ?? false,
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

class Category {
  int id;
  String categoryName;

  Category({
    required this.id,
    required this.categoryName,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        categoryName: json["categoryName"],
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
}

class FileElement {
  int id;
  String fileName;
  String fileUrl;

  FileElement({
    required this.id,
    required this.fileName,
    required this.fileUrl,
  });

  factory FileElement.fromJson(Map<String, dynamic> json) => FileElement(
        id: json["id"],
        fileName: json["fileName"],
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

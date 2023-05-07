class Reservation {
  int id;
  int peopleNum;
  DateTime date;
  DateTime startTime;
  DateTime endTime;
  String status;
  User user;
  Place place;

  Reservation({
    required this.id,
    required this.peopleNum,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.status,
    required this.user,
    required this.place,
  });

  factory Reservation.fromJson(Map<String, dynamic> json) => Reservation(
        id: json["id"],
        peopleNum: json["peopleNum"],
        date: DateTime.parse(json["date"]),
        startTime: DateTime.parse(json["startTime"]),
        endTime: DateTime.parse(json["endTime"]),
        status: json["status"],
        user: User.fromJson(json["user"]),
        place: Place.fromJson(json["place"]),
      );
}

class Place {
  int id;
  String title;
  Address address;

  Place({
    required this.id,
    required this.title,
    required this.address,
  });

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        id: json["id"],
        title: json["title"],
        address: Address.fromJson(json["address"]),
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

class User {
  int id;
  String name;

  User({
    required this.id,
    required this.name,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
      );
}

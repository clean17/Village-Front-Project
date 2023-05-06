// To parse this JSON data, do
//
//     final reservation = reservationFromJson(jsonString);

import 'dart:convert';

Reservation reservationFromJson(String str) =>
    Reservation.fromJson(json.decode(str));

String reservationToJson(Reservation data) => json.encode(data.toJson());

class Reservation {
  int code;
  int status;
  String msg;
  Data data;

  Reservation({
    required this.code,
    required this.status,
    required this.msg,
    required this.data,
  });

  factory Reservation.fromJson(Map<String, dynamic> json) => Reservation(
        code: json["code"],
        status: json["status"],
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "msg": msg,
        "data": data.toJson(),
      };
}

class Data {
  int id;
  int peopleNum;
  DateTime date;
  DateTime startTime;
  DateTime endTime;
  String status;
  User user;
  Place place;

  Data({
    required this.id,
    required this.peopleNum,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.status,
    required this.user,
    required this.place,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        peopleNum: json["peopleNum"],
        date: DateTime.parse(json["date"]),
        startTime: DateTime.parse(json["startTime"]),
        endTime: DateTime.parse(json["endTime"]),
        status: json["status"],
        user: User.fromJson(json["user"]),
        place: Place.fromJson(json["place"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "peopleNum": peopleNum,
        "date": date.toIso8601String(),
        "startTime": startTime.toIso8601String(),
        "endTime": endTime.toIso8601String(),
        "status": status,
        "user": user.toJson(),
        "place": place.toJson(),
      };
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

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "address": address.toJson(),
      };
}

class Address {
  int id;
  String address;

  Address({
    required this.id,
    required this.address,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "address": address,
      };
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

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

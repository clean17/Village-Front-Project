
import 'dart:convert';

import 'package:village/model/address/address_model.dart';
import 'package:village/model/user/user.dart';

import 'dart:convert';

Host hostFromJson(String str) => Host.fromJson(json.decode(str));

String hostToJson(Host data) => json.encode(data.toJson());

class Host {
  int id;
  User user;
  String nickName;
  Address address;
  String businessNum;
  String status;

  Host({
    required this.id,
    required this.user,
    required this.nickName,
    required this.address,
    required this.businessNum,
    required this.status,
  });

  factory Host.fromJson(Map<String, dynamic> json) => Host(
    id: json["id"],
    user: User.fromJson(json["user"]),
    nickName: json["nickName"],
    address: Address.fromJson(json["address"]),
    businessNum: json["businessNum"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user": user.toJson(),
    "nickName": nickName,
    "address": address.toJson(),
    "businessNum": businessNum,
    "status": status,
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

class User {
  int id;
  String name;
  String email;
  String tel;
  String profile;
  DateTime createdAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.tel,
    required this.profile,
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    tel: json["tel"],
    profile: json["profile"],
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "tel": tel,
    "profile": profile,
    "createdAt": createdAt.toIso8601String(),
  };
}

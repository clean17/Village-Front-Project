import 'dart:convert';

VillageUserTest villageUserTestFromJson(String str) =>
    VillageUserTest.fromJson(json.decode(str));

String villageUserTestToJson(VillageUserTest data) =>
    json.encode(data.toJson());

class VillageUserTest {
  VillageUserTest({
    required this.status,
    required this.msg,
    required this.data,
  });

  int status;
  String msg;
  Data data;

  factory VillageUserTest.fromJson(Map<String, dynamic> json) =>
      VillageUserTest(
        status: json["status"],
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.createdAt,
  });

  int id;
  String name;
  String email;
  DateTime createdAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "createdAt": createdAt.toIso8601String(),
      };
}

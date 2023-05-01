import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  int id;
  String name;
  dynamic email;
  dynamic tel;
  dynamic profile;
  DateTime createdAt;

  User({
    required this.id,
    required this.name,
    this.email,
    this.tel,
    this.profile,
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
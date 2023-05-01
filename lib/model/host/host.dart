
import 'package:village/model/user/user.dart';

class Host {
  int id;
  User user;
  String address;
  String businessNum;

  Host({
    required this.id,
    required this.user,
    required this.address,
    required this.businessNum,
  });

  factory Host.fromJson(Map<String, dynamic> json) => Host(
    id: json["id"],
    user: User.fromJson(json["user"]),
    address: json["address"],
    businessNum: json["businessNum"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user": user.toJson(),
    "address": address,
    "businessNum": businessNum,
  };
}
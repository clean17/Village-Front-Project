import 'package:village/model/address/address_model.dart';

class HostReqDto {
  final String nickName;
  final String address;
  final String businessNum;

  HostReqDto({
    required this.nickName,
    required this.address,
    required this.businessNum,
  });

  factory HostReqDto.fromJson(Map<String, dynamic> json) => HostReqDto(
    nickName: json["nickName"],
    address: json["address"],
    businessNum: json["businessNum"],
  );

  Map<String, dynamic> toJson() => {
    "hostName": nickName,
    "address": address,
    "businessNum": businessNum,
  };
}

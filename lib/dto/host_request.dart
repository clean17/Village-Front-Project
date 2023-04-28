class HostReqDto {
  final String hostName;
  final String address;
  final String businessNum;

  HostReqDto({
    required this.hostName,
    required this.address,
    required this.businessNum,
  });

  factory HostReqDto.fromJson(Map<String, dynamic> json) => HostReqDto(
    hostName: json["hostName"],
    address: json["address"],
    businessNum: json["businessNum"],
  );

  Map<String, dynamic> toJson() => {
    "hostName": hostName,
    "address": address,
    "businessNum": businessNum,
  };
}

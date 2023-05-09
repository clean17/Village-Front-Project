class HostReqDto {
  String? hostName;
  String? nickName;
  AddressReqDTO? address;
  String? businessNum;

  HostReqDto({
    this.hostName,
    this.nickName,
    this.address,
    this.businessNum,
  });

  Map<String, dynamic> toJson() => {
        "hostName": hostName,
        "nickName": nickName,
        "address": address?.toJson(),
        "businessNum": businessNum,
      };
}

class AddressReqDTO {
  String? address;
  String? sigungu;
  String? zonecode;
  String? detailAddress;
  String? x;
  String? y;

  AddressReqDTO({
    this.address,
    this.sigungu,
    this.zonecode,
    this.detailAddress,
    this.x,
    this.y,
  });

  Map<String, dynamic> toJson() => {
        "address": address,
        "sigungu": sigungu,
        "zonecode": zonecode,
        "detailAddress": detailAddress,
        "x": x,
        "y": y,
      };
}

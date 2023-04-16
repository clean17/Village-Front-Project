// To parse this JSON data, do
//
//     final jusoModel = jusoModelFromJson(jsonString);

import 'dart:convert';

JusoModel jusoModelFromJson(String str) => JusoModel.fromJson(json.decode(str));

String jusoModelToJson(JusoModel data) => json.encode(data.toJson());

class JusoModel {
  JusoModel({
    required this.documents,
    required this.meta,
  });

  List<Document> documents;
  Meta meta;

  factory JusoModel.fromJson(Map<String, dynamic> json) => JusoModel(
        documents: List<Document>.from(
            json["documents"].map((x) => Document.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "documents": List<dynamic>.from(documents.map((x) => x.toJson())),
        "meta": meta.toJson(),
      };
}

class Document {
  Document({
    required this.address,
    required this.addressName,
    required this.addressType,
    this.roadAddress,
    required this.x,
    required this.y,
  });

  Address address;
  String addressName;
  AddressType addressType;
  dynamic roadAddress;
  String x;
  String y;

  factory Document.fromJson(Map<String, dynamic> json) => Document(
        address: Address.fromJson(json["address"]),
        addressName: json["address_name"],
        addressType: addressTypeValues.map[json["address_type"]]!,
        roadAddress: json["road_address"],
        x: json["x"],
        y: json["y"],
      );

  Map<String, dynamic> toJson() => {
        "address": address.toJson(),
        "address_name": addressName,
        "address_type": addressTypeValues.reverse[addressType],
        "road_address": roadAddress,
        "x": x,
        "y": y,
      };
}

class Address {
  Address({
    required this.addressName,
    required this.bCode,
    required this.hCode,
    required this.mainAddressNo,
    required this.mountainYn,
    required this.region1DepthName,
    required this.region2DepthName,
    required this.region3DepthHName,
    required this.region3DepthName,
    required this.subAddressNo,
    required this.x,
    required this.y,
  });

  String addressName;
  String bCode;
  String hCode;
  String mainAddressNo;
  MountainYn mountainYn;
  String region1DepthName;
  String region2DepthName;
  String region3DepthHName;
  Region3DepthName region3DepthName;
  String subAddressNo;
  String x;
  String y;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        addressName: json["address_name"],
        bCode: json["b_code"],
        hCode: json["h_code"],
        mainAddressNo: json["main_address_no"],
        mountainYn: mountainYnValues.map[json["mountain_yn"]]!,
        region1DepthName: json["region_1depth_name"],
        region2DepthName: json["region_2depth_name"],
        region3DepthHName: json["region_3depth_h_name"],
        region3DepthName:
            region3DepthNameValues.map[json["region_3depth_name"]]!,
        subAddressNo: json["sub_address_no"],
        x: json["x"],
        y: json["y"],
      );

  Map<String, dynamic> toJson() => {
        "address_name": addressName,
        "b_code": bCode,
        "h_code": hCode,
        "main_address_no": mainAddressNo,
        "mountain_yn": mountainYnValues.reverse[mountainYn],
        "region_1depth_name": region1DepthName,
        "region_2depth_name": region2DepthName,
        "region_3depth_h_name": region3DepthHName,
        "region_3depth_name": region3DepthNameValues.reverse[region3DepthName],
        "sub_address_no": subAddressNo,
        "x": x,
        "y": y,
      };
}

enum MountainYn { N }

final mountainYnValues = EnumValues({"N": MountainYn.N});

enum Region3DepthName { EMPTY, REGION_3_DEPTH_NAME, PURPLE }

final region3DepthNameValues = EnumValues({
  "연산면": Region3DepthName.EMPTY,
  "": Region3DepthName.PURPLE,
  "연산동": Region3DepthName.REGION_3_DEPTH_NAME
});

enum AddressType { REGION }

final addressTypeValues = EnumValues({"REGION": AddressType.REGION});

class Meta {
  Meta({
    required this.isEnd,
    required this.pageableCount,
    required this.totalCount,
  });

  bool isEnd;
  int pageableCount;
  int totalCount;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        isEnd: json["is_end"],
        pageableCount: json["pageable_count"],
        totalCount: json["total_count"],
      );

  Map<String, dynamic> toJson() => {
        "is_end": isEnd,
        "pageable_count": pageableCount,
        "total_count": totalCount,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

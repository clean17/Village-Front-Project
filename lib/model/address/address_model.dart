// 모든 데이터가 필요 없고 , 데이터마다 null 이 달라서 필요 없는 데이터 모두 삭제함
class AddressModel {
  List<Document> documents;

  AddressModel({
    required this.documents,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        documents: List<Document>.from(
            json["documents"].map((x) => Document.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "documents": List<dynamic>.from(documents.map((x) => x.toJson())),
      };
}

class Document {
  Address address;
  String addressName;
  String x;
  String y;

  Document({
    required this.address,
    required this.addressName,
    required this.x,
    required this.y,
  });

  factory Document.fromJson(Map<String, dynamic> json) => Document(
        address: Address.fromJson(json["address"]),
        addressName: json["address_name"],
        x: json["x"],
        y: json["y"],
      );

  Map<String, dynamic> toJson() => {
        "address": address.toJson(),
        "address_name": addressName,
        "x": x,
        "y": y,
      };
}

class Address {
  String addressName;
  String x;
  String y;

  Address({
    required this.addressName,
    required this.x,
    required this.y,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        addressName: json["address_name"],
        x: json["x"],
        y: json["y"],
      );

  Map<String, dynamic> toJson() => {
        "address_name": addressName,
        "x": x,
        "y": y,
      };
}

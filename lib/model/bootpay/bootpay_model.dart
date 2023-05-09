// To parse this JSON data, do
//
//     final bootPayModel = bootPayModelFromJson(jsonString);

import 'dart:convert';

BootPayModel bootPayModelFromJson(String str) =>
    BootPayModel.fromJson(json.decode(str));

String bootPayModelToJson(BootPayModel data) => json.encode(data.toJson());

class BootPayModel {
  String? event;
  Data? data;

  BootPayModel({
    this.event,
    this.data,
  });

  factory BootPayModel.fromJson(Map<String, dynamic> json) => BootPayModel(
        event: json["event"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "event": event,
        "data": data?.toJson(),
      };
}

class Data {
  String? receiptId;
  String? orderId;
  int? price;
  int? taxFree;
  int? cancelledPrice;
  int? cancelledTaxFree;
  String? orderName;
  String? companyName;
  String? gatewayUrl;
  Metadata? metadata;
  bool? sandbox;
  String? pg;
  String? method;
  String? methodSymbol;
  String? methodOrigin;
  String? methodOriginSymbol;
  DateTime? purchasedAt;
  DateTime? requestedAt;
  String? statusLocale;
  String? currency;
  String? receiptUrl;
  int? status;
  CardData? cardData;

  Data({
    this.receiptId,
    this.orderId,
    this.price,
    this.taxFree,
    this.cancelledPrice,
    this.cancelledTaxFree,
    this.orderName,
    this.companyName,
    this.gatewayUrl,
    this.metadata,
    this.sandbox,
    this.pg,
    this.method,
    this.methodSymbol,
    this.methodOrigin,
    this.methodOriginSymbol,
    this.purchasedAt,
    this.requestedAt,
    this.statusLocale,
    this.currency,
    this.receiptUrl,
    this.status,
    this.cardData,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        receiptId: json["receipt_id"],
        orderId: json["order_id"],
        price: json["price"],
        taxFree: json["tax_free"],
        cancelledPrice: json["cancelled_price"],
        cancelledTaxFree: json["cancelled_tax_free"],
        orderName: json["order_name"],
        companyName: json["company_name"],
        gatewayUrl: json["gateway_url"],
        metadata: json["metadata"] == null
            ? null
            : Metadata.fromJson(json["metadata"]),
        sandbox: json["sandbox"],
        pg: json["pg"],
        method: json["method"],
        methodSymbol: json["method_symbol"],
        methodOrigin: json["method_origin"],
        methodOriginSymbol: json["method_origin_symbol"],
        purchasedAt: json["purchased_at"] == null
            ? null
            : DateTime.parse(json["purchased_at"]),
        requestedAt: json["requested_at"] == null
            ? null
            : DateTime.parse(json["requested_at"]),
        statusLocale: json["status_locale"],
        currency: json["currency"],
        receiptUrl: json["receipt_url"],
        status: json["status"],
        cardData: json["card_data"] == null
            ? null
            : CardData.fromJson(json["card_data"]),
      );

  Map<String, dynamic> toJson() => {
        "receipt_id": receiptId,
        "order_id": orderId,
        "price": price,
        "tax_free": taxFree,
        "cancelled_price": cancelledPrice,
        "cancelled_tax_free": cancelledTaxFree,
        "order_name": orderName,
        "company_name": companyName,
        "gateway_url": gatewayUrl,
        "metadata": metadata?.toJson(),
        "sandbox": sandbox,
        "pg": pg,
        "method": method,
        "method_symbol": methodSymbol,
        "method_origin": methodOrigin,
        "method_origin_symbol": methodOriginSymbol,
        "purchased_at": purchasedAt?.toIso8601String(),
        "requested_at": requestedAt?.toIso8601String(),
        "status_locale": statusLocale,
        "currency": currency,
        "receipt_url": receiptUrl,
        "status": status,
        "card_data": cardData?.toJson(),
      };
}

class CardData {
  String? tid;
  String? cardApproveNo;
  String? cardNo;
  String? cardInterest;

  CardData({
    this.tid,
    this.cardApproveNo,
    this.cardNo,
    this.cardInterest,
  });

  factory CardData.fromJson(Map<String, dynamic> json) => CardData(
        tid: json["tid"],
        cardApproveNo: json["card_approve_no"],
        cardNo: json["card_no"],
        cardInterest: json["card_interest"],
      );

  Map<String, dynamic> toJson() => {
        "tid": tid,
        "card_approve_no": cardApproveNo,
        "card_no": cardNo,
        "card_interest": cardInterest,
      };
}

class Metadata {
  String? callbackParam1;
  String? callbackParam2;
  String? callbackParam3;
  String? callbackParam4;

  Metadata({
    this.callbackParam1,
    this.callbackParam2,
    this.callbackParam3,
    this.callbackParam4,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        callbackParam1: json["callbackParam1"],
        callbackParam2: json["callbackParam2"],
        callbackParam3: json["callbackParam3"],
        callbackParam4: json["callbackParam4"],
      );

  Map<String, dynamic> toJson() => {
        "callbackParam1": callbackParam1,
        "callbackParam2": callbackParam2,
        "callbackParam3": callbackParam3,
        "callbackParam4": callbackParam4,
      };
}

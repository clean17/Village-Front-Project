class ResponseDTO {
  final int? code;
  final String? msg;
  String? token;
  dynamic data; // dynamic -> JsonArray [], JsonObject {}

  ResponseDTO({
    this.code,
    this.msg,
    this.data,
  });

  ResponseDTO.fromJson(Map<String, dynamic> json)
      : code = json["code"],
        msg = json["msg"],
        data = json["data"];
}

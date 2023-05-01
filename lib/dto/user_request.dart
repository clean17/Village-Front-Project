class JoinReqDTO {
  final String name;
  final String password;
  final String email;

  JoinReqDTO({
    required this.name,
    required this.password,
    required this.email,
  });

  // data: dto.toJson()); 요청을 보내는 data를 json으로 변환
  Map<String, dynamic> toJson() => {
        "name": name,
        "password": password,
        "email": email,
      };
}

class LoginReqDTO {
  final String email;
  final String password;

  LoginReqDTO({
    required this.email,
    required this.password,
  });

  // 통신을 위해서 json 처럼 생긴 문자열 {"id":1} => Dart 오브젝트
  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "targetToken":
            "dVimDFTAQJCHMrFDJD2W18:APA91bFef_eC8HUP_PPjtGnt3_1hJR4m-BJMDr2PSfFqA9eNtnYh4XTOqCStmPKnWgv6XDCkzur7kCrxlvghvtTPttD58zYKrz8OhkZn8Pc40vO9YCRIpJhHPaMT3wEMEkF7l7TCZkDx",
      };
}

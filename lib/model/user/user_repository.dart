import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:village/core/constants/http.dart';
import 'package:village/dto/response_dto.dart';
import 'package:village/dto/user_request.dart';
import 'package:village/provider/session_provider.dart';

import 'user.dart';

class UserRepository {
  static final UserRepository _instance = UserRepository._single();
  factory UserRepository() {
    return _instance;
  }
  UserRepository._single();

  Future<SessionUser> fetchJwtVerify() async {
    SessionUser sessionUser = SessionUser();
    String? deviceJwt = await secureStorage.read(key: "jwt");
    if (deviceJwt != null) {
      try {
        Response response = await dio.get("/jwtToken",
            options: Options(headers: {"Authorization": deviceJwt}));
        ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
        Logger().d(response.statusCode);
        final authorization = response.headers["Authorization"];
        if (authorization != null) {
          responseDTO.token = authorization.first;
          Logger().d(responseDTO.token);
        }
        responseDTO.data = User.fromJson(responseDTO.data);

        if (responseDTO.code == 1) {
          sessionUser.loginSuccess(responseDTO.data, responseDTO.token!);
        } else {
          sessionUser.logoutSuccess();
        }
        return sessionUser;
      } catch (e) {
        Logger().d("토큰 검증 에러 : $e");
        sessionUser.logoutSuccess();
        return sessionUser;
      }
    } else {
      sessionUser.logoutSuccess();
      return sessionUser;
    }
  }

  Future<ResponseDTO> fetchJoin(JoinReqDTO joinReqDTO) async {
    Response response = await dio.post("/join", data: joinReqDTO.toJson());
    if (response.statusCode == 200) {
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      responseDTO.data = User.fromJson(responseDTO.data);
      Logger().d('파싱 성공');
      return responseDTO;
    } else {
      return ResponseDTO(code: -1, msg: "유저네임중복");
    }
  }

  Future<ResponseDTO> fetchLogin(LoginReqDTO loginReqDTO) async {
    try {
      // 1. 통신 시작
      Response response = await dio.post("/login", data: loginReqDTO.toJson());
      Logger().d("통신성공");

      // 2. DTO 파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      Logger().d("${responseDTO.data}");
      responseDTO.data = User.fromJson(responseDTO.data);
      Logger().d("파싱성공");

      // 3. 토큰 받기
      final authorization = response.headers["Authorization"];
      if (authorization != null) {
        responseDTO.token = authorization.first;
      }
      return responseDTO;
    } catch (e) {
      return ResponseDTO(code: -1, msg: "유저네임 혹은 비번이 틀렸습니다");
    }
  }
}

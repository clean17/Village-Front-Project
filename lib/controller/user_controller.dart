import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/core/constants/http.dart';
import 'package:village/core/constants/move.dart';
import 'package:village/dto/response_dto.dart';
import 'package:village/dto/user_request.dart';
import 'package:village/main.dart';
import 'package:village/model/user/user_repository.dart';
import 'package:village/provider/session_provider.dart';

final userController = Provider<UserContoller>((ref) {
  return UserContoller(ref);
});

class UserContoller {
  final mContext = navigatorKey.currentContext; // 컨트롤러에서 뷰 핸들링
  final Ref ref;

  UserContoller(this.ref);

  Future<void> logout() async {
    try {
      await ref.read(sessionProvider).logoutSuccess(); // await가 없으면 안기다리고 화면 이동
      Navigator.pushNamedAndRemoveUntil(mContext!, Move.loginPage, (route) => false);
    } catch (e) {
      ScaffoldMessenger.of(mContext!)
          .showSnackBar(SnackBar(content: Text("로그아웃 실패")));
    }
  }

  Future<void> join(String name, String password, String email) async {
    JoinReqDTO joinReqDTO =
    JoinReqDTO(name: name, password: password, email: email);
    ResponseDTO responseDTO = await UserRepository().fetchJoin(joinReqDTO);
    if (responseDTO.code == 1) {
      Navigator.pushNamed(mContext!, Move.loginPage);
    } else {
      ScaffoldMessenger.of(mContext!)
          .showSnackBar(SnackBar(content: Text("회원가입 실패")));
    }
  }

  Future<void> login(String name, String password) async {
    LoginReqDTO loginReqDTO =
    LoginReqDTO(name: name, password: password);
    ResponseDTO responseDTO = await UserRepository().fetchLogin(loginReqDTO);
    if (responseDTO.code == 1) {
      // 1. 토큰을 휴대폰에 저장
      await secureStorage.write(key: "jwt", value: responseDTO.token);

      // 2. 로그인 상태 등록
      ref
          .read(sessionProvider)
          .loginSuccess(responseDTO.data, responseDTO.token!);

      // 3. 화면 이동
      Navigator.popAndPushNamed(mContext!, Move.homePage);
    } else {
      ScaffoldMessenger.of(mContext!)
          .showSnackBar(SnackBar(content: Text("로그인 실패 : ${responseDTO.msg}" )));
    }
  }

  // Future<void> update(int id, String name, String password) async{
  //   UserUpdateReqDTO userUpdateReqDTO = UserUpdateReqDTO(title: title, content: content);
  //   SessionUser sessionUser = ref.read(sessionProvider);
  //
  //   ResponseDTO responseDTO = await UserRepository().fetchUpdate(id, UserUpdateReqDTO,sessionUser.jwt!);
  //   ref.read(postDetailPageProvider(id).notifier).notifyUpdate(responseDTO.data);
  //   ref.read(postHomePageProvider.notifier).notifyUpdate(responseDTO.data); // 통신이 없으므로 await 안씀
  //   Navigator.pop(mContext!);
  // }


}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:village/core/constants/http.dart';
import 'package:village/core/constants/move.dart';
import 'package:village/dto/response_dto.dart';
import 'package:village/dto/user_request.dart';
import 'package:village/main.dart';
import 'package:village/model/user/user_repository.dart';
import 'package:village/provider/session_provider.dart';
import 'package:village/view/widgets/custom_error_show_toast.dart';
import 'package:village/view/widgets/custom_show_toast.dart';
import 'package:village/view/widgets/my_error_motion_toast.dart';
import 'package:village/view/widgets/my_success_motion_toast.dart';

final userControllerProvider = Provider<UserContoller>((ref) {
  return UserContoller(ref);
});

class UserContoller {
  final mContext = navigatorKey.currentContext; // 컨트롤러에서 뷰 핸들링
  final Ref ref;

  UserContoller(this.ref);

  Future<void> logout() async {
    try {
      await ref.read(sessionProvider).logoutSuccess(); // await가 없으면 안기다리고 화면 이동
      Navigator.pushNamedAndRemoveUntil(
          mContext!, Move.mainPage, (route) => false);
      MySuccessMotionToast("로그아웃", "로그아웃 성공");
    } catch (e) {
      // CustomErrorShowToast("로그아웃 실패");
      MyErrorMotionToast("로그아웃", "로그아웃 실패");
    }
  }

  Future<void> join(String name, String password, String email) async {
    JoinReqDTO joinReqDTO =
        JoinReqDTO(name: name, password: password, email: email);
    ResponseDTO responseDTO = await UserRepository().fetchJoin(joinReqDTO);
    if (responseDTO.code == 1) {
      Navigator.pushReplacementNamed(mContext!, '/login');
      MySuccessMotionToast("회원가입", "회원가입 성공");
      Logger().d("회원가입됨");
    } else {
      // CustomErrorShowToast("회원가입 실패");
      MyErrorMotionToast("회원가입", "회원가입 실패");
    }
  }

  Future<void> login(String email, String password) async {
    LoginReqDTO loginReqDTO = LoginReqDTO(email: email, password: password);
    ResponseDTO responseDTO = await UserRepository().fetchLogin(loginReqDTO);
    if (responseDTO.code == 1) {
      // 1. 토큰을 휴대폰에 저장
      await secureStorage.write(key: "jwt", value: responseDTO.token);
      Logger().d("${responseDTO.data.name}");
      Logger().d("${responseDTO.token}");

      // 2. 로그인 상태 등록
      ref
          .read(sessionProvider)
          .loginSuccess(responseDTO.data, responseDTO.token!);

      // 3. 화면 이동
      Navigator.pop(mContext!);
      Navigator.pop(mContext!);
      Navigator.popAndPushNamed(mContext!, Move.myPage);

      // Navigator.pushNamedAndRemoveUntil(mContext!, Move.mainPage, (route) => false);

      MySuccessMotionToast("로그인", "로그인 성공");

      // Navigator.popAndPushNamed(mContext!, Move.myPage);
    } else {
      // CustomErrorShowToast("로그인 실패");
      MyErrorMotionToast("로그인", "로그인 실패");
    }

    // 로그인 라우팅 때무에 수정하려고 복사했는데 잠시 보류
    Future<void> loginPop(String email, String password) async {
      LoginReqDTO loginReqDTO = LoginReqDTO(email: email, password: password);
      ResponseDTO responseDTO = await UserRepository().fetchLogin(loginReqDTO);
      if (responseDTO.code == 1) {
        // 1. 토큰을 휴대폰에 저장
        await secureStorage.write(key: "jwt", value: responseDTO.token);
        Logger().d("${responseDTO.data.name}");
        Logger().d("${responseDTO.token}");

        CustomShowToast("로그인 성공");
        // ScaffoldMessenger.of(mContext!).showSnackBar(BasicSnackBar("로그인 성공"));

        // 2. 로그인 상태 등록
        ref
            .read(sessionProvider)
            .loginSuccess(responseDTO.data, responseDTO.token!);

        // 3. 화면 이동
        Navigator.pop(mContext!);
        Navigator.pop(mContext!, Move.myPage);
        // Navigator.popAndPushNamed(mContext!, Move.myPage);
      } else {
        CustomErrorShowToast("로그인 실패");
        // ScaffoldMessenger.of(mContext!).showSnackBar(ErrorSnackBar("로그인 실패"));
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
}

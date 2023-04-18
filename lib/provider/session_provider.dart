import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:village/core/constants/http.dart';
import 'package:village/model/user/user.dart';

final sessionProvider = Provider<SessionUser>((ref) {
  return SessionUser();
});

// 최초 앱이 실행될 때 초기화 되어야 함.
// 1. JWT 존재 유무 확인 (I/O)
// 2. JWT로 회원정보 받아봄 (I/O)
// 3. OK -> loginSuccess() 호출
// 4. FAIL -> loginPage로 이동
// 로그인 정보를 가지고 있는 오브젝트 - 로그인 중이니 ? / 앱 로딩전에 실행해야함
class SessionUser {
  User? user;
  String? jwt;
  bool? isLogin;

  void loginSuccess(User user, String jwt) {
    this.user = user;
    this.jwt = jwt;
    isLogin = true;
  }

  Future<void> logoutSuccess() async {
    user = null;
    jwt = null;
    isLogin = false;
    // I/O가 발생하는 모든 접근은 비동기 !!!!!!!!!!!!!!!!!!!!!!!!!!!!
    await secureStorage.delete(key: "jwt");
    Logger().d("세션 종료 및 디바이서 jwt 삭제");
  }
}

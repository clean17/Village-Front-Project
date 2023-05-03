import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:village/dto/user_request.dart';
import 'package:village/model/user/user_repository.dart';
import 'package:village/provider/session_provider.dart';


//flutter test test/model/user/user_repository_test.dart
void main() async {
 await UserRepository().fetchLogin(LoginReqDTO(email: 'ssar@nate.com',password: '1234'));

  // 글 등록하는데 토큰을 못찾아서 토큰 있는지 테스트 함
  // final container = ProviderContainer();
  // final sessionUser = container.read(sessionProvider);
  // String? jwtToken = sessionUser.jwt;
  // Logger().d(jwtToken);
  // 테스트 실행전에 모든 데이터는 초기화가 된다 . 토큰이 당연히 없다 !
}

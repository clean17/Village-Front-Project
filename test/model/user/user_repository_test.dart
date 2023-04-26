import 'package:village/dto/user_request.dart';
import 'package:village/model/user/user_repository.dart';

void main() async {
 await UserRepository().fetchLogin(LoginReqDTO(email: 'ssar@nate.com',password: '1234'));
}
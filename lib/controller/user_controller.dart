import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/main.dart';

final chatController = Provider<UserContoller>((ref) {
  return UserContoller(ref);
});

class UserContoller {
  final mContext = navigatorKey.currentContext; // 컨트롤러에서 뷰 핸들링
  final Ref ref;
  UserContoller(this.ref);
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/main.dart';

final chatController = Provider<LikeController>((ref) {
  return LikeController(ref);
});

class LikeController {
  final mContext = navigatorKey.currentContext; // 컨트롤러에서 뷰 핸들링
  final Ref ref;
  LikeController(this.ref);
}

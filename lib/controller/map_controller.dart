import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/main.dart';

final mapController = Provider<MapController>((ref) {
  return MapController(ref);
});

class MapController {
  final mContext = navigatorKey.currentContext; // 컨트롤러에서 뷰 핸들링
  final Ref ref;
  MapController(this.ref);
}

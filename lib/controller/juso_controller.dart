import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:village/core/utils/show_toast.dart';
import 'package:village/main.dart';
import 'package:village/model/address/address_model.dart';
import 'package:village/model/address/address_repository.dart';
import 'package:village/view/pages/map/juso_search_page/juso_search_page_view_model.dart';

final jusoControllerProvider = Provider<JusoContoller>((ref) {
  return JusoContoller(ref);
});

class JusoContoller {
  final mContext = navigatorKey.currentContext;
  final Ref ref;
  JusoContoller(this.ref);

  // 위도 경도 요청 - ResponseDTO.data에 들어있음 - 프로바이더에 넣음
  Future<void> addressReq(String addrses) async {
    try {
      AddressModel addressDto = await AddressRepository().addressReq(addrses);
      // await Future.delayed(const Duration(seconds: 3)); // 창이 닫혀도 저장되는거 확인
      ref.read(jusoSearchPageProvider.notifier).notifyAddAddress(addressDto);
      Logger().d('프로바이더에 주소 위도 경도 저장');
    } catch (e) {
      Logger().d('주소 위도 경도 검색 실패 !');
      showToast('주소 요청 실패 !');
    }
  }
}

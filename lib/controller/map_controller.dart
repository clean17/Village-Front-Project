import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:village/core/utils/show_toast.dart';
import 'package:village/main.dart';
import 'package:village/model/address/address_model.dart';
import 'package:village/model/address/address_repository.dart';
import 'package:village/view/pages/map/juso_search_page/juso_search_page_view_model.dart';

final mapControllerProvider = Provider<MapContoller>((ref) {
  return MapContoller(ref);
});

class MapContoller {
  final mContext = navigatorKey.currentContext; // 컨트롤러에서 뷰 핸들링
  final Ref ref;
  MapContoller(this.ref);

  // 위도 경도 요청 - ResponseDTO.data에 들어있음 - 프로바이더에 넣음
  Future<void> addressReq(String addrses) async {
    try {
      AddressModel addressDto = await AddressRepository().addressReq(addrses);
      ref.read(jusoSearchPageProvider.notifier).notifyAddAddress(addressDto);
      // Logger()
      //     .d(ref.read(jusoSearchPageProvider)?.addressModel?.documents?[0].x);
      Logger().d('프로바이더에 주소 위도 경도 저장');
    } catch (e) {
      showToast('주소 요청 실패 !');
    }

    // showToast(responseDTO.msg!);
  }
}

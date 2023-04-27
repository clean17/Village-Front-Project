// 창고 관리자
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remedi_kopo/remedi_kopo.dart';
import 'package:village/model/address/address_model.dart';

final jusoSearchPageProvider = StateNotifierProvider.autoDispose<
    JusoSearchPageViewModel, JusoSearchPageModel?>((ref) {
  //placeId
  // SessionUser sessionUser = ref.read(sessionProvider);
  return JusoSearchPageViewModel(null, ref);
  // ..notifyInit(postId, sessionUser.jwt!);
});

// 창고 데이터
class JusoSearchPageModel {
  KopoModel? address;
  AddressModel? addressModel;
  JusoSearchPageModel({this.address, this.addressModel});
}

// 창고 - 관리
class JusoSearchPageViewModel extends StateNotifier<JusoSearchPageModel?> {
  JusoSearchPageViewModel(super.state, this.ref);
  Ref ref;

  void notifyAddKopo(KopoModel address) {
    state = JusoSearchPageModel(address: address);
  }

  void notifyAddAddress(AddressModel address) {
    state = JusoSearchPageModel(addressModel: address);
  }

  void inin() {
    // Logger().d('널 아님');
  }
}

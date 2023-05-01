// 창고 관리자
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:remedi_kopo/remedi_kopo.dart';
import 'package:village/model/address/address_model.dart';

final jusoSearchPageProvider = StateNotifierProvider.autoDispose<
    JusoSearchPageViewModel, JusoSearchPageModel?>((_) {
  return JusoSearchPageViewModel(null);
});

// 창고 데이터
class JusoSearchPageModel {
  KopoModel? address;
  AddressModel? addressModel;
  JusoSearchPageModel({this.address, this.addressModel});
}

// 창고 - 관리
class JusoSearchPageViewModel extends StateNotifier<JusoSearchPageModel?> {
  JusoSearchPageViewModel(super.state);

  void notifyAddKopo(KopoModel address) {
    AddressModel? addressModel = state?.addressModel;
    state = JusoSearchPageModel(
      address: address,
      addressModel: addressModel,
    );
    Logger().d("프로바이더 : 우편번호 저장");
  }

  void notifyAddAddress(AddressModel addressModel) {
    KopoModel? address = state?.address;
    state = JusoSearchPageModel(
      addressModel: addressModel,
      address: address,
    );
    Logger().d("프로바이더 : 위경도 저장");
  }
}

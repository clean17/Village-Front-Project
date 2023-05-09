// 창고 관리자
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:village/model/bootpay/bootpay_model.dart';

final bootpayProvider =
    StateNotifierProvider.autoDispose<BootpayPageViewModel, BootpayPageModel?>(
        (_) {
  return BootpayPageViewModel(null);
});

// 창고 데이터
class BootpayPageModel {
  BootPayModel bootpayModel;
  BootpayPageModel({
    required this.bootpayModel,
  });
}

// 창고 - 관리
class BootpayPageViewModel extends StateNotifier<BootpayPageModel?> {
  BootpayPageViewModel(super.state);

  void notifyAdd(BootPayModel bm) {
    state = BootpayPageModel(bootpayModel: bm);
    Logger().d(bm.data?.orderId);
  }
}

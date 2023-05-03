import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:village/core/constants/http.dart';
import 'package:village/core/constants/move.dart';
import 'package:village/dto/host_request.dart';
import 'package:village/dto/response_dto.dart';
import 'package:village/dto/user_request.dart';
import 'package:village/main.dart';
import 'package:village/model/address/address_model.dart';
import 'package:village/model/host/host_repository.dart';
import 'package:village/model/user/user_repository.dart';
import 'package:village/provider/session_provider.dart';
import 'package:village/view/pages/main/home_page/home_page.dart';
import 'package:village/view/widgets/basic_snack_bar.dart';
import 'package:village/view/widgets/custom_show_toast.dart';
import 'package:village/view/widgets/error_snack_bar.dart';

final hostControllerProvider = Provider<HostContoller>((ref) {
  return HostContoller(ref);
});

class HostContoller {
  final mContext = navigatorKey.currentContext; // 컨트롤러에서 뷰 핸들링
  final Ref ref;

  HostContoller(this.ref);


  Future<void> Hostjoin(String nickName, String address, String businessNum) async {
    HostReqDto hostReqDto = HostReqDto(nickName: nickName, address: address, businessNum: businessNum);
    ResponseDTO responseDTO = await HostRepository().fetchHostJoin(hostReqDto);
    Logger().d("${responseDTO.data}");
    if (responseDTO.code == 1) {
      // CustomShowToast("호스트 신청 성공");
      ScaffoldMessenger.of(mContext!)
          .showSnackBar(BasicSnackBar("호스트 신청 성공"));
      Logger().d("호스트 신청됨");

      Navigator.popAndPushNamed(mContext!, '/myPage');
    } else {

      // CustomShowToast("호스트 신청 실패");
      ScaffoldMessenger.of(mContext!)
          .showSnackBar(ErrorSnackBar("호스트 신청 실패"));
    }
  }


}

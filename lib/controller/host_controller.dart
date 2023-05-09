import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/dto/host_request.dart';
import 'package:village/dto/response_dto.dart';
import 'package:village/main.dart';
import 'package:village/model/host/host_repository.dart';
import 'package:village/provider/session_provider.dart';
import 'package:village/view/widgets/basic_snack_bar.dart';
import 'package:village/view/widgets/error_snack_bar.dart';

final hostControllerProvider = Provider<HostContoller>((ref) {
  return HostContoller(ref);
});

class HostContoller {
  final mContext = navigatorKey.currentContext; // 컨트롤러에서 뷰 핸들링
  final Ref ref;

  HostContoller(this.ref);

  Future<void> hostjoin(
    String nickName,
    AddressReqDTO address,
    String businessNum,
  ) async {
    HostReqDto hostReqDto = HostReqDto(
      hostName: nickName,
      nickName: nickName,
      address: address,
      businessNum: businessNum,
    );
    final sessionUser = ref.read(sessionProvider);

    ResponseDTO responseDTO =
        await HostRepository().fetchHostJoin(hostReqDto, sessionUser.jwt!);

    if (responseDTO.code == 1) {
      // CustomShowToast("호스트 신청 성공");
      ScaffoldMessenger.of(mContext!).showSnackBar(BasicSnackBar("호스트 신청 성공"));

      Navigator.popAndPushNamed(mContext!, '/myPage');
    } else {
      // CustomShowToast("호스트 신청 실패");
      ScaffoldMessenger.of(mContext!).showSnackBar(ErrorSnackBar("호스트 신청 실패"));
    }
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:village/core/utils/show_toast.dart';
import 'package:village/dto/reservation_request.dart';
import 'package:village/dto/response_dto.dart';
import 'package:village/main.dart';
import 'package:village/model/reservation/reservation_repository.dart';
import 'package:village/provider/session_provider.dart';

final reservationController = Provider<ReservationController>((ref) {
  return ReservationController(ref);
});

class ReservationController {
  final mContext = navigatorKey.currentContext; // 컨트롤러에서 뷰 핸들링
  final Ref ref;
  ReservationController(this.ref);

  Future<void> reservation(ReservationSaveReqDto saveReqDto) async {
    SessionUser sessionUser = ref.read(sessionProvider);
    // Navigator.pushNamed(mContext!, Move.placeDetailPage);
    ResponseDTO responseDTO = await ReservationRepository()
        .fetchReservation(saveReqDto, sessionUser.jwt!);
    if (responseDTO.code == 1) {
      // ref.read(placeDetailPageProvider.notifier).notifyAdd(responseDTO.data);

      Logger().d(responseDTO.data);
      // 3. 화면 이동
    } else {
      showToast("통신중 장애가 발생했습니다.");
    }
  }
}

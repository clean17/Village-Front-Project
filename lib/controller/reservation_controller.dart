import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:village/core/constants/move.dart';
import 'package:village/core/utils/show_toast.dart';
import 'package:village/dto/reservation_request.dart';
import 'package:village/dto/response_dto.dart';
import 'package:village/main.dart';
import 'package:village/model/reservation/reservation_repository.dart';
import 'package:village/provider/session_provider.dart';
import 'package:village/view/pages/place/detail_page/place_detail_reservation_view_model.dart';
import 'package:village/view/widgets/my_error_motion_toast.dart';


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
      ref.read(placeReservationProvider.notifier).notifyAdd(responseDTO.data);
      _showMyDialog(mContext!, ref);
    } else {
      // 예약 신청 실패
      AlertDialog(
        title: const Text('예약에 실패했습니다.'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(mContext!, 'Cancel'),
            child: const Text('확인'),
          ),
        ],
      );
      MyErrorMotionToast("통신중 장애가 발생했습니다.", "");
      // showToast("통신중 장애가 발생했습니다.");
    }
  }

  Future<void> _showMyDialog(context, ref) async {
    final pm = ref.watch(placeReservationProvider);
    DateFormat dateFormatter = DateFormat('yyyy-MM-dd');
    DateFormat timeFormatter = DateFormat('HH:mm');
    String title = pm?.reservation.place.title;
    String address = pm?.reservation.place.address.address;
    DateTime reservationDate = pm?.reservation.date;
    DateTime startTime = pm?.reservation.startTime;
    DateTime endTime = pm?.reservation.endTime;
    String name = pm?.reservation.user.name;
    int num = pm?.reservation.peopleNum;
    String dateString = dateFormatter.format(reservationDate);
    String startT = timeFormatter.format(startTime);
    String endT = timeFormatter.format(endTime);
    // int cost =
    //     (int.parse(endT.split(':').first) - int.parse(startT.split(':').first)) *
    //         pm.place!.pricePerHour;
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('예약에 성공하셨습니다.'),
          content: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListBody(
                children: <Widget>[
                  Text('장소 : $title'),
                  const SizedBox(
                    height: 5,
                  ),
                  Text('주소 : $address'),
                  const SizedBox(
                    height: 5,
                  ),
                  Text('예약자명 : $name'),
                  const SizedBox(
                    height: 5,
                  ),
                  Text('예약일 : $dateString'),
                  const SizedBox(
                    height: 5,
                  ),
                  Text('예약시간 : $startT - $endT'),
                  const SizedBox(
                    height: 5,
                  ),
                  Text('예약인원 : $num'),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('닫기'),
            ),
            TextButton(
              onPressed: () => {
                Navigator.popAndPushNamed(context, Move.userReservationPage),
              },
              child: const Text('확인하러 가기'),
            ),
          ],
        );
      },
    );
  }
}

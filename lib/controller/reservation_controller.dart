import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

      // 3. 화면 이동
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
      showToast("통신중 장애가 발생했습니다.");
    }
  }
}

Future<void> _showMyDialog(context, ref) async {
  // PickerModel? pickermodel = ref.watch(pickerProvider);
  // PlaceDetailPageModel pm = ref.watch(placeDetailPageProvider);
  // DateTime reservationDate = pickermodel?.reservationDate ?? DateTime.now();
  // DateTime startTime = pickermodel?.startTime ?? DateTime.now();
  // DateTime endTime = pickermodel?.endTime ?? DateTime.now();
  // DateFormat dateFormatter = DateFormat('yyyy-MM-dd');
  // DateFormat timeFormatter = DateFormat('HH:mm');
  // final rc = ref.read(reservationController);

  // String dateString = dateFormatter.format(reservationDate);
  // String startT = timeFormatter.format(startTime);
  // String endT = timeFormatter.format(endTime);
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
              children: const <Widget>[
                // Text('예약일 : $dateString'),
                // Text('예약시간 : $startT - $endT'),
                // Text('예약인원 : ${pickermodel?.maxPeople}'),
                // Text('결제예정금액 : $cost'),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('아니오'),
          ),
          // TextButton(
          //   onPressed: () => {
          //     Navigator.pop(context, 'OK'),
          //     // 컨트롤러 호출
          //     ref.read(reservationController).reservation(ReservationSaveReqDto(
          //           placeId: pm.place!.id,
          //           peopleNum: pickermodel!.maxPeople!,
          //           date: reservationDate,
          //           startTime: startTime,
          //           endTime: endTime,
          //         )),
          //   },
          //   child: const Text('예'),
          // ),
        ],
      );
    },
  );
}

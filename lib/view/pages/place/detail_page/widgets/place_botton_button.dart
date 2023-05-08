import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:village/controller/reservation_controller.dart';
import 'package:village/core/constants/move.dart';
import 'package:village/core/constants/size.dart';
import 'package:village/core/constants/style.dart';
import 'package:village/dto/reservation_request.dart';
import 'package:village/provider/picker_provier.dart';
import 'package:village/provider/session_provider.dart';
import 'package:village/view/pages/host/resister_place_page/widgets/reservation_end_picker.dart';
import 'package:village/view/pages/host/resister_place_page/widgets/reservation_people_picker.dart';
import 'package:village/view/pages/host/resister_place_page/widgets/reservation_start_picker.dart';
import 'package:village/view/pages/main/home_page/widgets/book_mark_alert_dialog.dart';
import 'package:village/view/pages/place/detail_page/place_detail_page_view_model.dart';
import 'package:village/view/pages/place/detail_page/widgets/place_date_picker.dart';
import 'package:village/view/widgets/custom_bottom_button.dart';
import 'package:village/view/widgets/button_icon.dart';

class PlaceCustomBottomButton extends ConsumerWidget {
  const PlaceCustomBottomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // var controller = PrimaryScrollController.of(context);
    PlaceDetailPageModel pm = ref.watch(placeDetailPageProvider);
    PickerViewModel pickervm = ref.read(pickerProvider.notifier);
    PickerModel? pickermodel = ref.watch(pickerProvider);
    final sessionUser = ref.watch(sessionProvider);

    DateTime startTime =
        pickermodel?.startTime ?? DateTime(2023, 5, 10, 10, 00);
    DateTime endTime = pickermodel?.endTime ?? DateTime(2023, 5, 10, 20, 00);
    int maxPeopole = pickermodel?.maxPeople ?? 0;
    double leftPadding = getScreenWidth(context) * 0.13;
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            BottomIcon(
                funPress: () => {
                      // Navigator.pushNamed(context, Move.chatRoomPage)
                      Navigator.pushNamed(context, Move.bootpayPage)
                    },
                icon: Icons.chat_outlined),
            const SizedBox(
              width: 10,
            ),
            const SizedBox(
              width: 10,
            ),
            CustomBottomButton(
                mWeith: getScreenWidth(context) * 0.95,
                text: '예약하기',
                funPress: () {
                  {
                    if (sessionUser.isLogin!) {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return Stack(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(
                                    top: 20,
                                    bottom: 50,
                                    right: 20,
                                    left: leftPadding),
                                height: 370,
                                color: Colors.white,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 15),
                                      child: Row(
                                        children: [
                                          const Text(
                                            '장소 선택  :  ',
                                            style: mblack_text,
                                          ),
                                          Text(
                                            pm.place?.title ?? "",
                                            style: mblack_text,
                                          )
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          '날짜',
                                          style: mblack_text,
                                        ),
                                        Container(
                                            padding: const EdgeInsets.only(
                                              left: 20,
                                            ),
                                            child: PlaceDatePicker(
                                              funtion: pickervm
                                                  .notifyChangeResevationDate,
                                            )),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                      ],
                                    ),
                                    ReservationStartPicker(
                                      funtion: pickervm.notifyChangeStartTime,
                                      text: '예약 시작 시간',
                                    ),
                                    ReservationEndPicker(
                                      funtion: pickervm.notifyChangeEndTime,
                                      text: '예약 종료 시간',
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    ReservationPeoplePicker(
                                      funtion: pickervm.notifyChangeMaxPeople,
                                      text: '예약 인원',
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                  right: 50,
                                  left: 50,
                                  bottom: 10,
                                  child: CustomBottomButton(
                                      mWeith: getScreenHeight(context),
                                      text: "예약신청",
                                      funPress: () {
                                        _showMyDialog(context, ref);
                                      })),
                              Positioned(
                                  right: 20,
                                  top: 20,
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(
                                      Icons.close,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                  ))
                            ],
                          );
                        },
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const BookMarkAlertDialog();
                        },
                      );
                    }
                  }
                }),
          ],
        ),
      ),
    );
  }
}

Future<void> _showMyDialog(context, ref) async {
  PickerModel? pickermodel = ref.watch(pickerProvider);
  PlaceDetailPageModel pm = ref.watch(placeDetailPageProvider);
  DateTime reservationDate = pickermodel?.reservationDate ?? DateTime.now();
  DateTime startTime = pickermodel?.startTime ?? DateTime.now();
  DateTime endTime = pickermodel?.endTime ?? DateTime.now();
  DateFormat dateFormatter = DateFormat('yyyy-MM-dd');
  DateFormat timeFormatter = DateFormat('HH:mm');
  final rc = ref.read(reservationController);

  String dateString = dateFormatter.format(reservationDate);
  String startT = timeFormatter.format(startTime);
  String endT = timeFormatter.format(endTime);
  int cost =
      (int.parse(endT.split(':').first) - int.parse(startT.split(':').first)) *
          pm.place!.pricePerHour;
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('예약 신청을 하시겠습니까 ?'),
        content: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListBody(
              children: <Widget>[
                Text('예약일 : $dateString'),
                Text('예약시간 : $startT - $endT'),
                Text('예약인원 : ${pickermodel?.maxPeople}'),
                Text('결제예정금액 : $cost'),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('아니오'),
          ),
          TextButton(
            onPressed: () => {
              Navigator.pop(context, 'OK'),
              // 컨트롤러 호출
              ref.read(reservationController).reservation(ReservationSaveReqDto(
                    placeId: pm.place!.id,
                    peopleNum: pickermodel!.maxPeople!,
                    date: reservationDate,
                    startTime: startTime,
                    endTime: endTime,
                  )),
            },
            child: const Text('예'),
          ),
        ],
      );
    },
  );
}

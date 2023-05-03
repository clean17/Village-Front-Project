import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/core/constants/move.dart';
import 'package:village/core/constants/size.dart';
import 'package:village/core/constants/style.dart';
import 'package:village/provider/picker_provier.dart';
import 'package:village/view/pages/host/resister_place_page/widgets/people_picker.dart';
import 'package:village/view/pages/host/resister_place_page/widgets/place_time_picker.dart';
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
    PlaceDetailPageModel pm = ref.read(placeDetailPageProvider);
    PickerViewModel pickervm = ref.read(pickerProvider.notifier);
    PickerModel? pickermodel = ref.watch(pickerProvider);
    // var controller = PrimaryScrollController.of(context);
    DateTime startTime =
        pickermodel?.startTime ?? DateTime(2016, 5, 10, 10, 35);
    DateTime endTime = pickermodel?.endTime ?? DateTime(2016, 5, 10, 20, 45);
    int maxPeopole = pickermodel?.maxPeople ?? 0;

    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            BottomIcon(
                funPress: () =>
                    {Navigator.pushNamed(context, Move.chatRoomPage)},
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
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                top: 20, bottom: 50, right: 20, left: 50),
                            height: 350,
                            color: Colors.white,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 15),
                                    child: Row(
                                      children: [
                                        const Text(
                                          '장소 선택  :     ',
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
                                          child: PlaceDatePicker()),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Consumer(
                                        builder: (context, ref, child) {
                                          PlaceDetailPageModel pm = ref
                                              .watch(placeDetailPageProvider);
                                          return pm.resevasionDate != null
                                              ? Text(pm.resevasionDate!)
                                              : const Text('<- 날짜 선택');
                                        },
                                      )
                                    ],
                                  ),
                                  PlaceTimePicker(
                                    funtion: pickervm.notifyChangeStartTime,
                                    text: '예약 시작 시간',
                                    dateTime: startTime,
                                  ),
                                  PlaceTimePicker(
                                    funtion: pickervm.notifyChangeEndTime,
                                    text: '예약 종료 시간',
                                    dateTime: endTime,
                                  ),
                                  PeoplePicker(
                                      funtion: pickervm.notifyChangeMaxPeople,
                                      text: '예약 인원',
                                      num: maxPeopole),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                              right: 50,
                              left: 50,
                              bottom: 10,
                              child: CustomBottomButton(
                                  mWeith: getScreenHeight(context),
                                  text: "예약신청",
                                  funPress: null)),
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
                }),
          ],
        ),
      ),
    );
  }
}

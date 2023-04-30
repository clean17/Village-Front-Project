import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/controller/place_controller.dart';
import 'package:village/core/constants/size.dart';
import 'package:village/dto/place_request.dart';
import 'package:village/provider/picker_provier.dart';
import 'package:village/view/pages/host/resister_place_page/host_resister_place_page_view_model.dart';
import 'package:village/view/pages/host/resister_place_page/widgets/host_resister_body.dart';
import 'package:village/view/pages/host/resister_place_page/widgets/resister_appbar.dart';
import 'package:village/view/pages/map/juso_search_page/juso_search_page_view_model.dart';
import 'package:village/view/widgets/custom_bottom_button.dart';

class HostResisterPlacePage extends ConsumerWidget {
  HostResisterPlacePage({super.key});

  final _formKey = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _detail = TextEditingController();
  final _notice = TextEditingController();
  final _intro = TextEditingController();
  final _tel = TextEditingController();
  final _pricePerHour = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    HostResisterPlacePageModel? hpm = ref.watch(hostResisterPlacePageProvider);
    PickerModel? pickerm = ref.watch(pickerProvider);
    JusoSearchPageModel? pm = ref.watch(jusoSearchPageProvider);
    final x = pm?.addressModel?.documents[0].x;
    final y = pm?.addressModel?.documents[0].y;
    final fullAddress = pm?.address?.address;
    final sigungu = pm?.address?.sigungu;
    final zoneCode = pm?.address?.zonecode;
    AddressReqDTO address = AddressReqDTO(
      address: fullAddress,
      sigungu: sigungu,
      zonecode: zoneCode,
      x: x,
      y: y,
      detailAddress: _detail.text,
    );
    return Scaffold(
      appBar: ResisterAppbar(),
      body: HostResisterBody(
        formkey: _formKey,
        detail: _detail,
        intro: _intro,
        notice: _notice,
        title: _title,
        tel: _tel,
        pricePerHour: _pricePerHour,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // 임시저장은 추후에
            // CustomBottomButton(
            //     mWeith: getScreenWidth(context) * 0.5,
            //     text: '임시저장',
            //     funPress: () async {
            //       // await Future.delayed(const Duration(seconds: 2));
            //       // ref.read(placeControllerProvider).testImage(pm2!);
            //     }),
            CustomBottomButton(
                mWeith: getScreenWidth(context) * 0.5,
                text: '등록',
                funPress: () {
                  if (_formKey.currentState!.validate()) {
                    ref.read(placeControllerProvider).save(
                          // 널 체크 하고 넣어야 할수도?
                          title: _title.text,
                          notice: _notice.text,
                          placeIntroductionInfo: _intro.text,
                          tel: _tel.text,
                          category: hpm!.categoryName!,
                          startTime: json
                              .encode(pickerm!.startTime!.toIso8601String()),
                          endTime:
                              json.encode(pickerm.endTime!.toIso8601String()),
                          inconfirmed: true,
                          maxParking: pickerm.maxParking!,
                          maxPeople: pickerm.maxPeople!,
                          pricePerHour: _pricePerHour.text,
                          address: address,
                          image: hpm.images!,
                          hashtag: hpm.hashtag!,
                          dayOfWeek: hpm.dayOfWeek!,
                          facilityInfo: hpm.facility!,
                        );
                  }
                }),
          ],
        ),
      ),
    );
  }
}

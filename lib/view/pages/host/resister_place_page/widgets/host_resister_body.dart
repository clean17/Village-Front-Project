import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/core/constants/style.dart';
import 'package:village/dto/place_request.dart';
import 'package:village/view/pages/host/resister_place_page/host_resister_place_page_view_model.dart';
import 'package:village/view/pages/host/resister_place_page/widgets/category_table.dart';
import 'package:village/view/pages/host/resister_place_page/widgets/common_form_field.dart';
import 'package:village/view/pages/host/resister_place_page/widgets/date_select.dart';
import 'package:village/view/pages/host/resister_place_page/widgets/hashtag-form-field.dart';
import 'package:village/view/pages/host/resister_place_page/widgets/image_input_box.dart';
import 'package:village/view/pages/host/resister_place_page/widgets/num_form_field.dart';
import 'package:village/view/pages/host/resister_place_page/widgets/parkingPicker.dart';
import 'package:village/view/pages/host/resister_place_page/widgets/people_picker.dart';
import 'package:village/view/pages/host/resister_place_page/widgets/place_time_picker.dart';
import 'package:village/view/pages/host/resister_place_page/widgets/tel_form_field.dart';
import 'package:village/view/pages/map/juso_search_page/juso_search_page.dart';
import 'package:village/view/pages/host/resister_place_page/widgets/facility_table.dart';

class HostResisterBody extends ConsumerWidget {
  const HostResisterBody({
    super.key,
    required this.formkey,
    required this.title,
    required this.detail,
    required this.notice,
    required this.intro,
    required this.tel,
    required this.pricePerHour,
  });

  final formkey;
  final title;
  final detail;
  final notice;
  final intro;
  final tel;
  final pricePerHour;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    HostResisterPlacePageViewModel vm =
        ref.read(hostResisterPlacePageProvider.notifier);
    HostResisterPlacePageModel? pm = ref.watch(hostResisterPlacePageProvider);

    List<File> files = pm?.files ?? [];
    List<HashtagReqDTO> hashtag = pm?.hashtag ?? [];

    return GestureDetector(
      onTap: () => {FocusScope.of(context).unfocus()},
      child: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ImageInputBox(vm: vm, files: files),
                CommonFormField(
                  hintText: '공간명을 입력하세요',
                  prefixText: '제목',
                  controller: title,
                ),
                const JusoSearchPage(),
                CommonFormField(
                  hintText: '상세주소를 입력하세요',
                  prefixText: '상세주소',
                  controller: detail,
                ),
                CommonFormField(
                  hintText: '소개 내용을 입력하세요',
                  prefixText: '장소 소개',
                  controller: intro,
                ),
                CommonFormField(
                  hintText: '유의 사항을 입력하세요',
                  prefixText: '유의 사항',
                  controller: notice,
                ),
                TelFormField(
                    hintText: '010-1234-5678',
                    prefixText: '전화번호',
                    controller: tel),
                HashtagFormField(
                  hintText: '해시태그를 입력하세요',
                  prefixText: '해시태그',
                  hashtag: hashtag,
                  vm: vm,
                ),
                NumFormField(
                  hintText: '시간당 가격을 입력하세요',
                  prefixText: '시간당  가격',
                  controller: pricePerHour,
                ),
                const FacilityTable(),
                const CategoryTable(),
                const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: 15, left: 2),
                      child: Text(
                        '요일선택',
                        style: mblack_text,
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                const DateSelect(),
                Row(
                  children: const [
                    PlaceTimePicker(text: '예약 시작 시간'),
                    PlaceTimePicker(text: '예약 종료 시간'),
                  ],
                ),
                Row(
                  children: const [
                    PeoplePicker(text: '예약 인원'),
                    ParkingPicker(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

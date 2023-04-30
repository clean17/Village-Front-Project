import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/core/constants/move.dart';
import 'package:village/core/utils/show_toast.dart';
import 'package:village/dto/place_request.dart';
import 'package:village/dto/response_dto.dart';
import 'package:village/main.dart';
import 'package:village/model/place/place_repository.dart';
import 'package:village/provider/session_provider.dart';
import 'package:village/view/pages/host/resister_place_page/host_resister_place_page_view_model.dart';

final placeControllerProvider = Provider<PlaceController>((ref) {
  return PlaceController(ref);
});

class PlaceController {
  final mContext = navigatorKey.currentContext; // 컨트롤러에서 뷰 핸들링
  final Ref ref;
  PlaceController(this.ref);

  // Future<void> testImage(HostResisterPlacePageModel pm) async {
  //   List<ImageReqDTO>? test = pm.images;
  //   if (test != null) {
  //     Logger().d('이미지는 있는거 확인');
  //   }
  //   await PlaceRepository().testImage(test![0]);
  // }

  Future<void> save({
    required String title,
    required String tel,
    required String startTime,
    required String endTime,
    required String placeIntroductionInfo,
    required String notice,
    required int maxPeople,
    required int maxParking,
    required String pricePerHour,
    required String category,
    required bool inconfirmed,
    required AddressReqDTO address,
    required List<ImageReqDTO> image,
    required List<DayOfWeekReqDTO> dayOfWeek,
    required List<HashtagReqDTO> hashtag,
    required List<FacilityInfoReqDTO> facilityInfo,
  }) async {
    PlaceSaveReqDTO saveReqDto = PlaceSaveReqDTO(
      title: title,
      tel: tel,
      startTime: startTime,
      endTime: endTime,
      placeIntroductionInfo: placeIntroductionInfo,
      notice: notice,
      maxPeople: maxPeople,
      maxParking: maxParking,
      categoryName: category,
      isConfirmed: inconfirmed,
      pricePerHour: pricePerHour,
      address: address,
      image: image,
      dayOfWeek: dayOfWeek,
      hashtag: hashtag,
      facilityInfo: facilityInfo,
    );
    SessionUser sessionUser = ref.read(sessionProvider);
    ResponseDTO responseDTO =
        await PlaceRepository().fetchSave(saveReqDto, sessionUser.jwt!);
    if (responseDTO.code == 1) {
      ref
          .read(hostResisterPlacePageProvider.notifier)
          .notifyAddPlace(responseDTO.data);

      // 3. 화면 이동
      Navigator.popAndPushNamed(mContext!, Move.placeDetailPage);
    } else {
      showToast(responseDTO.msg!);
    }
  }

  // Future<void> tempSave(
  //   String title,
  //   String placeAddress,
  //   String tel,
  //   String startTime,
  //   String endTime,
  //   String placeIntroductionInfo,
  //   String notice,
  //   int maxPeople,
  //   int pricePerHour,
  //   DayOfWeek dayOfWeek,
  //   Hashtag hashtag,
  //   FacilityInfo facilityInfo,
  //   Category category,
  // ) async {
  //   SaveReqDto saveReqDto = SaveReqDto(
  //     title: title,
  //     placeAddress: placeAddress,
  //     tel: tel,
  //     startTime: startTime,
  //     endTime: endTime,
  //     placeIntroductionInfo: placeIntroductionInfo,
  //     notice: notice,
  //     maxPeople: maxPeople,
  //     pricePerHour: pricePerHour,
  //     dayOfWeek: dayOfWeek,
  //     hashtag: hashtag,
  //     facilityInfo: facilityInfo,
  //     category: category,
  //   );

  //   ResponseDTO responseDTO = await PlaceRepository().fetchSave(saveReqDto);
  //   if (responseDTO.code == 1) {
  //     // ref
  //     //     .read(hostResisterPlacePageProvider.notifier)
  //     //     .notifyAdd(responseDTO.data);

  //     // 3. 화면 이동
  //     // Navigator.popAndPushNamed(mContext!, Move.placeDetailPage);
  //     showToast(responseDTO.msg!);
  //   } else {
  //     showToast(responseDTO.msg!);
  //   }
  // }
}

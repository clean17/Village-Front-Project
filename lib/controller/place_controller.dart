import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:village/core/constants/move.dart';
import 'package:village/core/utils/show_toast.dart';
import 'package:village/dto/place_request.dart';
import 'package:village/dto/response_dto.dart';
import 'package:village/main.dart';
import 'package:village/model/place/place_repository.dart';
import 'package:village/provider/session_provider.dart';
import 'package:village/view/pages/place/detail_page/place_detail_page_view_model.dart';

final placeControllerProvider = Provider<PlaceController>((ref) {
  return PlaceController(ref);
});

class PlaceController {
  final mContext = navigatorKey.currentContext; // 컨트롤러에서 뷰 핸들링
  final Ref ref;
  PlaceController(this.ref);

  // Future<void> testImage(ImageReqDTO iDTO) async {
  //   ResponseDTO responseDTO = await PlaceRepository().testImage(iDTO);
  //   if (responseDTO.code == 1) {
  //     Logger().d(responseDTO.data);
  //   } else {
  //     showToast("통신중 장애가 발생했습니다.");
  //   }
  // }

  Future<void> save({
    required String title,
    required String tel,
    required DateTime startTime,
    required DateTime endTime,
    required String placeIntroductionInfo,
    required String notice,
    required int maxPeople,
    required int maxParking,
    required int pricePerHour,
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
      // 저장하면 상세 보기 프로바이더에 저장하는것 고려
      ref.read(placeDetailPageProvider.notifier).notifyAdd(responseDTO.data);
      Logger().d(responseDTO.data);

      // 3. 화면 이동
      Navigator.popAndPushNamed(mContext!, Move.placeDetailPage);
    } else {
      showToast("통신중 장애가 발생했습니다.");
    }
  }
}

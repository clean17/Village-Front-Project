import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:village/core/utils/show_toast.dart';
import 'package:village/dto/place_request.dart';
import 'package:village/dto/response_dto.dart';
import 'package:village/main.dart';
import 'package:village/model/place/place_repository.dart';
import 'package:village/provider/session_provider.dart';

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
    required DateTime startTime,
    required DateTime endTime,
    required String placeIntroductionInfo,
    required String notice,
    required String maxPeople,
    required String maxParking,
    required String pricePerHour,
    required String category,
    required bool inconfirmed,
    required AddressReqDTO address,
    // required List<ImageReqDTO> image,
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
      // address: address,
      // image: image,
      // dayOfWeek: dayOfWeek,
      // hashtag: hashtag,
      // facilityInfo: facilityInfo,
    );
    Logger().d('등록 버튼 클릭함');
    SessionUser sessionUser = ref.read(sessionProvider);
    ResponseDTO responseDTO =
        await PlaceRepository().fetchSave(saveReqDto, sessionUser.jwt!);
    if (responseDTO.code == 1) {
      // 저장하면 상세 보기 프로바이더에 저장하는것 고려

      // ref
      //     .read(placeDetailPageProvider.notifier)
      //     .notifyInit(responseDTO.data, sessionUser.jwt!);

      // ref.read(placeDetailPageProvider).notifyAdd
      Logger().d(responseDTO.data);

      // 3. 화면 이동
      // Navigator.popAndPushNamed(mContext!, Move.placeDetailPage);
    } else {
      showToast("통신중 장애가 발생했습니다.");
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

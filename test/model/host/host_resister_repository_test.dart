import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:village/dto/place_request.dart';
import 'package:village/dto/response_dto.dart';
import 'package:village/model/place/place_repository.dart';
import 'package:village/provider/session_provider.dart';

void main() async {
  final container = ProviderContainer();
  final ref = container.read(sessionProvider);

  PlaceSaveReqDTO saveReqDTO = PlaceSaveReqDTO(
    title: '제목',
    // address: AddressReqDTO(
    //     address: '주소입력함',
    //     detailAddress: '상세주소',
    //     sigungu: '시군구',
    //     x: "1231,123",
    //     y: '234.34',
    //     zonecode: '23454'),
    categoryName: '연습실',
    // dayOfWeek:
    //     List.generate(4, (index) => DayOfWeekReqDTO(dayOfWeekName: "요일")),
    endTime: DateTime.now(),
    startTime: DateTime.now(),
    // hashtag: List.generate(2, (index) => HashtagReqDTO(hashtagName: '해시태그')),
    // facilityInfo:
    //     List.generate(2, (index) => FacilityInfoReqDTO(facilityName: '편의시설')),
    isConfirmed: true,
    maxParking: "2",
    maxPeople: "2",
    notice: '유의',
    tel: '012-3021-1343',
    placeIntroductionInfo: '소개',
    pricePerHour: "20000",
  );
  ResponseDTO responseDTO =
      await PlaceRepository().fetchSave(saveReqDTO, ref.jwt!);
  Logger().d(responseDTO.data);
}

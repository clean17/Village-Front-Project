import 'package:village/dto/place_request.dart';
import 'package:village/dto/response_dto.dart';
import 'package:village/model/place/place_repository.dart';

void main() async {
  // 이 에러는 일반적으로 앱 실행 시 첫 화면에 접근하는 위젯이나 메소드에서 누락된 바인딩 초기화 코드가 있는 경우에 발생합니다.
  // TestWidgetsFlutterBinding.ensureInitialized();

  // 테스트는 토큰이 당연히 없다는걸 알았으니 직접 넣는다
  String jwt =
      'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJqd3RzdHVkeSIsInJvbGUiOiJIT1NUIiwiaWQiOjIsImV4cCI6MTY4NDI1MzI4OH0.RVeZCQ5wFsywIhUgf0s-U2HXVUr5PG-c9YrW4Gz-DCxgqJ-t3mnl720X7ozGgB00sa8fQGTlq4-leKhLYEwWuA';

//  테스트 중 flutter test test/model/host/host_resister_repository_test.dart
  await save_test(jwt);
  // await image_test();
}

Future<void> save_test(jwt) async {
  PlaceSaveReqDTO saveReqDTO = PlaceSaveReqDTO(
    title: '제목',
    image: List.generate(
        3,
        (index) => ImageReqDTO(
            fileName: 'testImage.jpeg',
            type: 'image/jpeg',
            fileUrl:
                "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")),
    address: AddressReqDTO(
        address: '주소입력함',
        detailAddress: '상세주소',
        sigungu: '시군구',
        x: "1231,123",
        y: '234.34',
        zonecode: '23454'),
    categoryName: '연습실',
    dayOfWeek:
        List.generate(4, (index) => DayOfWeekReqDTO(dayOfWeekName: "요일")),
    endTime: DateTime(2023, 03, 03, 15, 12, 23, 23),
    startTime: DateTime(2023, 03, 03, 12, 12),
    hashtag: List.generate(2, (index) => HashtagReqDTO(hashtagName: '해시태그')),
    facilityInfo:
        List.generate(2, (index) => FacilityInfoReqDTO(facilityName: '편의시설')),
    isConfirmed: true,
    maxParking: 2,
    maxPeople: 2,
    notice: '유의',
    tel: '012-3021-1343',
    placeIntroductionInfo: '소개',
    pricePerHour: 20000,
  );
  ResponseDTO responseDTO = await PlaceRepository().fetchSave(saveReqDTO, jwt);
  // Logger().d(responseDTO.data);
}
// json.encode(DateTime(2023, 03, 03, 12, 12).toIso8601String())
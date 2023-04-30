import 'dart:convert';

import 'package:village/dto/place_request.dart';
import 'package:village/dto/response_dto.dart';
import 'package:village/model/place/place_repository.dart';

void main() async {
  // 이 에러는 일반적으로 앱 실행 시 첫 화면에 접근하는 위젯이나 메소드에서 누락된 바인딩 초기화 코드가 있는 경우에 발생합니다.
  // TestWidgetsFlutterBinding.ensureInitialized();
  // final container = ProviderContainer();
  // final sessionUser = container.read(sessionProvider);
  // String? jwtToken = sessionUser.jwt;

  // 테스트는 토큰이 당연히 없다는걸 알았으니 직접 넣는다
  String jwt =
      'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJqd3RzdHVkeSIsInJvbGUiOiJVU0VSIiwiaWQiOjEsImV4cCI6MTY4MjU5NDc1Mn0.7RtLo8BkR8-xg1ZMxFIviKgJ9dPQDmjn4miXW4xMtacTAccjBRCuSwax0ueSceSbALJ2u6kRADkp7GB842UEhw';

  // 시큐어 스토리지에서 토큰 찾으려는데 플러그인 오류는 뭐야 ?
  // const ss = FlutterSecureStorage();
  // final String? jwtToken = await ss.read(key: 'jwt');
  // Logger().d(jwtToken);

// 테스트 중 flutter test test/model/host/host_resister_repository_test.dart
  PlaceSaveReqDTO saveReqDTO = PlaceSaveReqDTO(
    title: '제목',
    image: List.generate(
        3,
        (index) => ImageReqDTO(
            name: 'testImage.jpeg', type: 'image/jpeg', data: "testestse")),
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
    endTime: json.encode(DateTime(2023, 03, 03, 12, 12).toIso8601String()),
    startTime: json.encode(DateTime(2023, 03, 03, 12, 12).toIso8601String()),
    hashtag: List.generate(2, (index) => HashtagReqDTO(hashtagName: '해시태그')),
    facilityInfo:
        List.generate(2, (index) => FacilityInfoReqDTO(facilityName: '편의시설')),
    isConfirmed: true,
    maxParking: "2",
    maxPeople: "2",
    notice: '유의',
    tel: '012-3021-1343',
    placeIntroductionInfo: '소개',
    pricePerHour: "20000",
  );
  ResponseDTO responseDTO = await PlaceRepository().fetchSave(saveReqDTO, jwt);
  // Logger().d(responseDTO.data);
}

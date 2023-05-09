import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:village/dto/host_request.dart';
import 'package:village/dto/response_dto.dart';
import 'package:village/model/host/host_repository.dart';

void main() async {
  final container = ProviderContainer();

  String jwt =
      'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJqd3RzdHVkeSIsInJvbGUiOiJVU0VSIiwiaWQiOjEsImV4cCI6MTY4NDIwMzc5Mn0.cIOsY37U1u8Zv-LxFAC1pt9t28TVb4blNG6pdpv_ovw5jIIq8sfWuIqYDC4xr5eTWMxg_b8vfvlhKxYHb6P3AQ';
  await fetchHostJoin_test(jwt);
}

//flutter test test/model/host/host_repository_test.dart
Future<void> fetchHostJoin_test(String jwt) async {
  HostReqDto hostReqDto = HostReqDto(
    nickName: "ssar",
    hostName: "ssar",
    address: AddressReqDTO(
        address: '주소입력함',
        detailAddress: '상세주소',
        sigungu: '시군구',
        x: "1231,123",
        y: '234.34',
        zonecode: '23454'),
    businessNum: "123-456-78",
  );
  ResponseDTO responseDTO =
      await HostRepository().fetchHostJoin(hostReqDto, jwt);
  Logger().d("${responseDTO.data}");
  Logger().d("${responseDTO.code}");
  Logger().d("${responseDTO.msg}");
}

// Future<ResponseDTO> fetchHostJoin_test(HostReqDto hostReqDto) async {
//   try {
//     Response response = await dio.post("/host", data: hostReqDto.toJson());
//     Logger().d("${response.data}");
//     ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
//     Logger().d("2");
//     responseDTO.data = Host.fromJson(responseDTO.data);
//     return responseDTO;
//   } catch (e) {
//     return ResponseDTO(code: -1, msg: "호스트 신청 실패");
//   }
// }


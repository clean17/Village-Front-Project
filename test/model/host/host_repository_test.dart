import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:village/core/constants/http.dart';
import 'package:village/dto/host_request.dart';
import 'package:village/dto/response_dto.dart';
import 'package:village/model/host/host.dart';
import 'package:village/model/host/host_repository.dart';

void main() async {
  await fetchHostJoin_test();
}
//flutter test test/model/host/host_repository_test.dart
Future<void> fetchHostJoin_test() async{
  HostReqDto hostReqDto = HostReqDto(nickName: "ssar", address: "부산 어쩌고", businessNum: "123-456-78");
  ResponseDTO responseDTO = await HostRepository().fetchHostJoin(hostReqDto);
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


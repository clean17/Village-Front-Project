import 'package:village/dto/host_request.dart';
import 'package:village/dto/response_dto.dart';
import 'package:village/model/host/host_repository.dart';

void main() async {
  await fetchHostJoin_test();
}

Future<void> fetchHostJoin_test() async{
  HostReqDto hostReqDto = HostReqDto(hostName: "ssar", address: "부산 어쩌고", businessNum: "123-456-78");
  ResponseDTO responseDTO = await HostRepository().fetchHostJoin(hostReqDto);
  print(responseDTO.data);
  print(responseDTO.code);
  print(responseDTO.msg);

}

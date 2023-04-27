import 'package:logger/logger.dart';
import 'package:village/model/address/address_model.dart';
import 'package:village/model/address/address_repository.dart';

void main() async {
  String test = '경북 경산시 와촌면 상암길 85';
  AddressModel? addressModel = await AddressRepository().addressReq(test);

  Logger().d(addressModel.documents[0].x);
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remedi_kopo/remedi_kopo.dart';
import 'package:village/controller/host_controller.dart';
import 'package:village/controller/juso_controller.dart';
import 'package:village/core/constants/style.dart';
import 'package:village/dto/host_request.dart';
import 'package:village/view/pages/map/juso_search_page/juso_search_page_view_model.dart';

class HostApplyForm extends ConsumerStatefulWidget {
  const HostApplyForm({Key? key}) : super(key: key);

  @override
  ConsumerState<HostApplyForm> createState() => _HostApplyFormState();
}

class _HostApplyFormState extends ConsumerState<HostApplyForm> {
  final _formfield = GlobalKey<FormState>();

  final _hostName = TextEditingController();

  final _address = TextEditingController();
  final _detail = TextEditingController();

  final _businessNum = TextEditingController();

  @override
  Widget build(BuildContext context) {
    JusoSearchPageModel? pm = ref.watch(jusoSearchPageProvider);
    final x = pm?.addressModel?.documents[0].x;
    final y = pm?.addressModel?.documents[0].y;
    final fullAddress = pm?.address?.address;
    final sigungu = pm?.address?.sigungu;
    final zoneCode = pm?.address?.zonecode;
    AddressReqDTO address = AddressReqDTO(
      address: fullAddress,
      sigungu: sigungu,
      zonecode: zoneCode,
      x: x,
      y: y,
      detailAddress: _detail.text,
    );

    return Form(
      key: _formfield,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("호스트 신청", style: mplace_title),
          const SizedBox(height: 20),
          TextFormField(
              controller: _hostName,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                  labelText: "이름",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                  hintText: "이름을 입력해주세요."),
              validator: (value) {
                if (value!.isEmpty) {
                  return "이름을 입력해주세요.";
                } else if (_hostName.text.length < 2) {
                  return "이름은 2자 이상입니다.";
                }
                return null;
              }),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(width: 1, color: Colors.grey.shade500),
            ),
            child: AddressText(),
          ),
          const SizedBox(height: 20),
          TextFormField(
              controller: _detail,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                  labelText: "상세주소",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.home),
                  hintText: "상세 주소 입력해주세요."),
              validator: (value) {
                if (value!.isEmpty) {
                  return "나머지 주소를 입력해주세요.";
                }
                return null;
              }),
          const SizedBox(height: 20),
          TextFormField(
              keyboardType: TextInputType.number,
              controller: _businessNum,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15),
                labelText: "사업자 번호",
                border: OutlineInputBorder(),
                hintText: "사업자번호를 입력해주세요",
                prefixIcon: Icon(Icons.phone_iphone),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "사업자 번호를 입력해주세요.";
                } else if (_businessNum.text.length != 10) {
                  return "사업자 번호는 10자리여야합니다.";
                }
                return null;
              }),
          const SizedBox(height: 30),
          InkWell(
            onTap: () async {
              if (_formfield.currentState!.validate()) {
                ref.read(hostControllerProvider).hostjoin(
                    _hostName.text.trim(), address, _businessNum.text.trim());
              }
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(8)),
              child: const Center(
                child: Text(
                  "호스트 신청하기",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget AddressText() {
    return GestureDetector(
      onTap: () {
        HapticFeedback.mediumImpact();
        _addressAPI(context); // 카카오 주소 API
      },
      child: TextFormField(
        controller: _address,
        enabled: false,
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 15),
            labelText: "주소",
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            prefixIcon: Icon(Icons.home),
            hintText: "주소 입력해주세요."),
        validator: (value) {
          if (value!.isEmpty) {
            return "주소를 입력해주세요.";
          }
          return null;
        },
        style: const TextStyle(color: Colors.black87),
      ),
    );
  }

  _addressAPI(context) async {
    KopoModel model = await Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => RemediKopo(),
      ),
    );
    _address.text = '${model.address!} ${model.buildingName!}';
    // 1. 우편주소를 프로바이더에 넣는다.
    ref.read(jusoSearchPageProvider.notifier).notifyAddKopo(model);
    // 2. 도로명주소로 위,경도를 요청후 프로바이더에 넣는다.
    // 2시간동안 await 안 적어서 왜 null 인지 삽질함 ;;
    await ref.read(jusoControllerProvider).addressReq(model.address!);
    // Logger().d(ref.read(jusoSearchPageProvider).addressModel!.documents[0].x);
  }
}

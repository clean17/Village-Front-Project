import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remedi_kopo/remedi_kopo.dart';
import 'package:village/core/constants/style.dart';

class HostApplyForm extends StatefulWidget {
  const HostApplyForm({Key? key}) : super(key: key);

  @override
  State<HostApplyForm> createState() => _HostApplyFormState();
}

class _HostApplyFormState extends State<HostApplyForm> {
  final _formfield = GlobalKey<FormState>();
  final _hostNameController = TextEditingController();
  final _addressController = TextEditingController();
  final _businessNumController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formfield,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("호스트 신청", style: mplace_title),
          SizedBox(height: 20),
          TextFormField(
              controller: _hostNameController,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                  labelText: "이름",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                  hintText: "이름을 입력해주세요."),
              validator: (value) {
                if (value!.isEmpty) {
                  return "이름을 입력해주세요.";
                } else if (_hostNameController.text.length < 2) {
                  return "이름은 2자 이상입니다.";
                }
              }),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(width: 1, color: Colors.grey.shade500),
            ),
            child: AddressText(),
          ),
          SizedBox(height: 20),
          TextFormField(
              // controller: _addressController,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                  labelText: "상세주소",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.home),
                  hintText: "상세 주소 입력해주세요."),
              validator: (value) {
                if (value!.isEmpty) {
                  return "나머지 주소를 입력해주세요.";
                }
              }),
          SizedBox(height: 20),
          TextFormField(
              keyboardType: TextInputType.number,
              controller: _businessNumController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15),
                labelText: "사업자 번호",
                border: OutlineInputBorder(),
                hintText: "사업자번호를 입력해주세요",
                prefixIcon: Icon(Icons.phone_iphone),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "사업자 번호를 입력해주세요.";
                } else if (_businessNumController.text.length == 10) {
                  return "사업자 번호는 10자리여야합니다.";
                }
              }),
          SizedBox(height: 30),
          InkWell(
            onTap: () async {
              if (_formfield.currentState!.validate()) {
                print("호스트 신청 성공");
                // Navigator.pop(context, MaterialPageRoute(builder: (context) => LoginPage(),));
              }
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
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
        _addressAPI(); // 카카오 주소 API
      },
      child: TextFormField(
        controller: _addressController,
        enabled: false,
        decoration: InputDecoration(
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
        },
        style: TextStyle(color: Colors.black87),
      ),
    );
  }

  _addressAPI() async {
    KopoModel model = await Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => RemediKopo(),
      ),
    );
    _addressController.text =
        '${model.zonecode!} ${model.address!} ${model.buildingName!}';
  }
}

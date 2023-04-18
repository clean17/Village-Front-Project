import 'package:flutter/material.dart';
import 'package:village/core/color.dart';

class MyHostApplyPage extends StatelessWidget {
  final _formfield = GlobalKey<FormState>();
  final hostNameController = TextEditingController();
  final addressController = TextEditingController();
  final businessNumController = TextEditingController();

  bool passwordToggle = true;

  MyHostApplyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.brown.shade100,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "호스트 신청",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                ApplyForm(context),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget ApplyForm(BuildContext context) {
    return Form(
      key: _formfield,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
              controller: hostNameController,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                  labelText: "이름",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                  hintText: "이름을 입력해주세요."),
              validator: (value) {
                if (value!.isEmpty) {
                  return "이름을 입력해주세요.";
                } else if (hostNameController.text.length < 2) {
                  return "이름은 2자 이상입니다.";
                }
              }),
          SizedBox(height: 20),
          TextFormField(
              controller: addressController,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                  labelText: "주소",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.home),
                  hintText: "주소 입력해주세요."),
              validator: (value) {
                if (value!.isEmpty) {
                  return "주소를 입력해주세요.";
                }
              }),
          SizedBox(height: 20),
          TextFormField(
              keyboardType: TextInputType.number,
              controller: businessNumController,
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
                } else if (businessNumController.text.length == 10) {
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
                  color: Colors.brown.shade500, borderRadius: BorderRadius.circular(8)),
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
}

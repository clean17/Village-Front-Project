import 'package:flutter/material.dart';
import 'package:village/core/constants/color.dart';
import 'package:village/view/pages/user/my_tel_authorize_page/widgets/my_contry_code_button.dart';


class MyTelAuthorizePage extends StatelessWidget {
  final _formfield = GlobalKey<FormState>();
  final telController = TextEditingController();
  final contryCodeController = TextEditingController();

  MyTelAuthorizePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "휴대폰을 인증해주세요",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                Form(
                  child: Column(
                    key: _formfield,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyContryCodeButton(),
                      SizedBox(height: 20),
                      MyTelForm(),
                      SizedBox(height: 30),
                      NextButton()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyTelForm() {
    return Row(
      children: [
        Container(
          width: 255,
          height: 60,
          child: TextFormField(
            keyboardType: TextInputType.number,
            controller: telController,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 17),
                labelText: "휴대폰 번호",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.phone_android),
                hintText: "하이픈(-)없이 입력"),
          ),
        ),
        Spacer(),
        Container(
          width: 85,
          height: 58,
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8)),
          child: TextButton(
            onPressed: () {},
            child: Text(
              "인증받기",
              style: TextStyle(color: Colors.grey.shade500),
            ),
          ),
        )
      ],
    );
  }

  Widget NextButton() {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: kPrimaryColor, borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Text(
            "다음",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}


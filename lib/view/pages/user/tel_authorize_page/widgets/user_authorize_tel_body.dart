import 'package:flutter/material.dart';
import 'package:village/view/pages/user/tel_authorize_page/widgets/my_contry_code_button.dart';
import 'package:village/view/pages/user/tel_authorize_page/widgets/next_button.dart';
import 'package:village/view/pages/user/tel_authorize_page/widgets/tel_container.dart';

class UserAuthorizeTelBody extends StatefulWidget {

  UserAuthorizeTelBody({Key? key}) : super(key: key);

  @override
  State<UserAuthorizeTelBody> createState() => _UserAuthorizeTelBodyState();
}

class _UserAuthorizeTelBodyState extends State<UserAuthorizeTelBody> {
  final _formfield = GlobalKey<FormState>();
  final telController = TextEditingController();
  final contryCodeController = TextEditingController();

  bool _isCodeSent = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "휴대폰을 인증해주세요",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                Form(
                  child: Column(
                    key: _formfield,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const MyContryCodeButton(),
                      const SizedBox(height: 20),
                      MyTelForm(),
                      if (_isCodeSent) TelContainer(),
                      const SizedBox(height: 20),
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
        SizedBox(
          width: 255,
          height: 60,
          child: TextFormField(
            keyboardType: TextInputType.number,
            controller: telController,
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 17),
                labelText: "휴대폰 번호",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.phone_android),
                hintText: "하이픈(-)없이 입력"),
          ),
        ),
        const Spacer(),
        Container(
          width: 85,
          height: 58,
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8)),
          child: TextButton(
            onPressed: () {
              setState(() {
                _isCodeSent = true;
              });
            },
            child: Text(
              "인증받기",
              style: TextStyle(color: Colors.grey.shade500),
            ),
          ),
        )
      ],
    );
  }
}

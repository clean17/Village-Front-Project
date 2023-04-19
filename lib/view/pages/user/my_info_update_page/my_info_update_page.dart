import 'package:flutter/material.dart';
import 'package:village/core/constants/color.dart';


class MyInfoUpdatePage extends StatelessWidget {
  final _formfield = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordController2 = TextEditingController();
  final accountController = TextEditingController();
  final telController = TextEditingController();

  bool passwordToggle = true;

  MyInfoUpdatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "내 정보 수정",
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
                ProfilePic(),
                SizedBox(height: 30),
                UpdateForm(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget ProfilePic() {
    return SizedBox(
                height: 115,
                width: 115,
                child: Stack(
                  clipBehavior: Clip.none, //overflow 해결
                  fit: StackFit.expand,
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/images/profile.jpg"),
                    ),
                    Positioned(
                      right: -5,
                      bottom: 0,
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.zero
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.grey.shade300),
                          ),
                          onPressed: () {},
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
  }

  Widget UpdateForm(BuildContext context) {
    return Form(
      key: _formfield,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                  labelText: "닉네임",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                  hintText: "닉네임을 입력해주세요."),
              validator: (value) {
                if (value!.isEmpty) {
                  return "닉네임을 입력해주세요.";
                } else if (nameController.text.length < 2) {
                  return "닉네임은 2자 이상입니다.";
                }
              }),
          SizedBox(height: 20),
          TextFormField(
              controller: passwordController,
              obscureText: passwordToggle,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15),
                labelText: "비밀번호",
                border: OutlineInputBorder(),
                hintText: "8자 이상의 비밀번호",
                prefixIcon: Icon(Icons.lock),
                suffixIcon: InkWell(
                  onTap: () {
                    passwordToggle = !passwordToggle;
                  },
                  child: Icon(
                      passwordToggle ? Icons.visibility : Icons.visibility_off),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "비밀번호를 입력해주세요.";
                } else if (passwordController.text.length < 8) {
                  return "비밀번호는 8자 이상입니다.";
                }
              }),
          SizedBox(height: 20),
          TextFormField(
              controller: passwordController2,
              obscureText: passwordToggle,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15),
                labelText: "비밀번호 확인",
                border: OutlineInputBorder(),
                hintText: "비밀번호 확인",
                prefixIcon: Icon(Icons.lock),
                suffixIcon: InkWell(
                  onTap: () {
                    passwordToggle = !passwordToggle;
                  },
                  child: Icon(
                      passwordToggle ? Icons.visibility : Icons.visibility_off),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "비밀번호를 입력해주세요.";
                } else if (passwordController.text.length < 8) {
                  return "비밀번호는 8자 이상입니다.";
                } else if (value != passwordController.text) {
                  return "비밀번호가 다릅니다.";
                }
              }),
          SizedBox(height: 20),
          TextFormField(
              keyboardType: TextInputType.number,
              controller: accountController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15),
                labelText: "계좌번호",
                border: OutlineInputBorder(),
                hintText: "( - ) 없이 입력해주세요",
                prefixIcon: Icon(Icons.monetization_on),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "계좌번호를 입력해주세요.";
                } else if (accountController.text.contains("-")) {
                  return "( - ) 을 제외하고 입력해주세요.";
                }
              }),
          SizedBox(height: 20),
          TextFormField(
              keyboardType: TextInputType.number,
              controller: telController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15),
                labelText: "전화번호",
                border: OutlineInputBorder(),
                hintText: "( - ) 없이 입력해주세요",
                prefixIcon: Icon(Icons.phone_iphone),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "전화번호를 입력해주세요.";
                } else if (telController.text.contains("-")) {
                  return "( - ) 을 제외하고 입력해주세요.";
                }
              }),
          SizedBox(height: 30),
          InkWell(
            onTap: () async {
              if (_formfield.currentState!.validate()) {
                print("회원가입 성공");
                // Navigator.pop(context, MaterialPageRoute(builder: (context) => LoginPage(),));
              }
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: kPrimaryColor, borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: Text(
                  "회원 정보 변경하기",
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

import 'package:flutter/material.dart';
import 'package:village/core/constants/color.dart';
import 'package:village/view/pages/common/login_page/login_page.dart';

class JoinForm extends StatelessWidget {
  final _formfield = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordController2 = TextEditingController();

  bool passwordToggle = true;

  JoinForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 17),
                labelText: "이메일",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
                hintText: "abcd@email.com"),
            validator: (value) {
              bool emailValid = RegExp(
                  r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(value!);
              if (value!.isEmpty) {
                return "이메일을 입력해주세요.";
              } else if (!emailValid) {
                return "이메일 형식에 맞게 입력해주세요.";
              }
            },
          ),
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
          SizedBox(height: 45),
          InkWell(
            onTap: () async {
              if (_formfield.currentState!.validate()) {
                print("회원가입 성공");
                emailController.clear();
                passwordController.clear();
                Navigator.pop(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ));
              }
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: kPrimaryColor, borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: Text(
                  "회원가입",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SizedBox(height: 25),
        ],
      ),
    );
  }
}

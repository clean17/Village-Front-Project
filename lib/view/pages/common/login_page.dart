import 'package:flutter/material.dart';
import 'package:village/core/color.dart';
import 'package:village/view/pages/common/join_page.dart';

class LoginPage extends StatelessWidget {
  final _formfield = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool passwordToggle = true;

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
                  "이메일 로그인",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                LoginForm(),
                AccountAction(context),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget AccountAction(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            "이메일 찾기",
            style: TextStyle(color: Colors.grey.shade600),
          ),
        ),
        Container(
            height: 15, child: VerticalDivider(color: Colors.grey.shade600)),
        TextButton(
          onPressed: () {},
          child: Text(
            "비밀번호 찾기",
            style: TextStyle(color: Colors.grey.shade600),
          ),
        ),
        Container(
            height: 15, child: VerticalDivider(color: Colors.grey.shade600)),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => JoinPage()),
            );
          },
          child: Text(
            "이메일 가입",
            style: TextStyle(color: Colors.grey.shade600),
          ),
        ),
      ],
    );
  }
  Widget LoginForm() {
    return Form(
      key: _formfield,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 17),
                labelText: "이메일",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
                hintText: "abcd@email.com"),
            validator: (value){
              bool emailValid = RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!);
              if(value!.isEmpty){
                return "이메일을 입력해주세요.";
              }
              else if(!emailValid){
                return "이메일 형식에 맞게 입력해주세요.";
              }
            },
          ),
          SizedBox(height: 20),
          TextFormField(
              keyboardType: TextInputType.emailAddress,
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
                  child: Icon(passwordToggle
                      ? Icons.visibility
                      : Icons.visibility_off),
                ),
              ),
              validator: (value){
                if(value!.isEmpty){
                  return "비밀번호를 입력해주세요.";
                }
                else if(passwordController.text.length < 8){
                  return "비밀번호는 8자 이상입니다.";
                }
              }
          ),
          SizedBox(height: 45),
          InkWell(
            onTap: () {
              if(_formfield.currentState!.validate()){
                print("로그인 성공");
                emailController.clear();
                passwordController.clear();
              }
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: Text(
                  "로그인",
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

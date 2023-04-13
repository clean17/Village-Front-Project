import 'package:flutter/material.dart';
import 'package:village/core/color.dart';
import 'package:village/view/pages/common/login_page.dart';
import 'package:village/view/widgets/common/my_button.dart';
import 'package:village/view/widgets/common/square_tile.dart';

class OauthPage extends StatelessWidget {
  const OauthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: size.height * 0.15),
              RichText(
                  text: TextSpan(
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                      children: [
                    TextSpan(
                        text: 'VILLAGE',
                        style: TextStyle(color: kPrimaryColor)),
                    TextSpan(text: '에서 '),
                    TextSpan(text: '\n즐거운 공간을 찾아보세요!'),
                  ])),
              SizedBox(height: size.height * 0.01),
              Image.asset(
                  "assets/images/undraw_Team_collaboration_re_ow29.png"),
              SizedBox(height: size.height * 0.03),
              Text(
                "소셜계정 및 간편로그인",
                style: TextStyle(color: Colors.grey.shade600),
              ),
              SizedBox(height: size.height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SquareTile(
                    imagePath: 'assets/images/KakaoTalk_logo.svg.png',
                    press: () {
                      print("11111");
                    },
                  ),
                  SquareTile(
                    imagePath: 'assets/images/naver_logo.jpg',
                    press: () {
                      print("2222");
                    },
                  ),
                  SquareTile(
                    imagePath: 'assets/images/google_logo.jpg',
                    press: () {
                      print("3333");
                    },
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.03),
              MyButton(press: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
              },),
              SizedBox(height: size.height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "아직 계정이 없으신가요?",
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  SizedBox(width: size.width * 0.01),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "회원가입",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

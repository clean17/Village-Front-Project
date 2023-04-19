import 'package:flutter/material.dart';
import 'package:village/view/pages/user/oauth_page/widgets/square_tile.dart';

class OauthIcon extends StatelessWidget {
  const OauthIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

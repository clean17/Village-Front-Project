import 'package:flutter/material.dart';
import 'package:village/core/constants/move.dart';
import 'package:village/core/constants/size.dart';
import 'package:village/view/widgets/bottom_button.dart';
import 'package:village/view/widgets/button_icon.dart';

class PlaceBottomButton extends StatelessWidget {
  const PlaceBottomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var controller = PrimaryScrollController.of(context);
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          BottonIcon(
              funPress: () => {Navigator.pushNamed(context, Move.chatRoomPage)},
              icon: Icons.chat_outlined),
          const SizedBox(
            width: 10,
          ),
          BottonIcon(
              funPress: () => {
                    // controller.jumpTo(0)
                    // FirebaseMessaging.instance.getToken().then((value) {
                    //   // Get new FCM registration token
                    //   String? token = value;

                    //   // Log and toast
                    //   String msg = 'FCM registration token: $token';
                    //   debugPrint(msg);
                    //   showToast(msg);
                    // }).catchError((error) {
                    //   // Fetching FCM registration token failed
                    //   debugPrint(
                    //       'Fetching FCM registration token failed: $error');
                    // })
                  },
              icon: Icons.chat_outlined),
          const SizedBox(
            width: 10,
          ),
          BottomButton(
            mWeith: getScreenWidth(context) * 0.7,
            text: '예약하기',
          ),
        ],
      ),
    );
  }
}

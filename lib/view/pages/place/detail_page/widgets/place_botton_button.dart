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
    // var controller = PrimaryScrollController.of(context);
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            BottomIcon(
                funPress: () =>
                    {Navigator.pushNamed(context, Move.chatRoomPage)},
                icon: Icons.chat_outlined),
            const SizedBox(
              width: 10,
            ),
            const SizedBox(
              width: 10,
            ),
            BottomButton(
              mWeith: getScreenWidth(context) * 0.95,
              text: '예약하기',
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:village/core/constants/move.dart';
import 'package:village/core/constants/size.dart';
import 'package:village/view/widgets/custom_bottom_button.dart';
import 'package:village/view/widgets/button_icon.dart';

class PlaceCustomBottomButton extends StatelessWidget {
  const PlaceCustomBottomButton({
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
            CustomBottomButton(
                mWeith: getScreenWidth(context) * 0.95,
                text: '예약하기',
                funPress: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 800,
                        color: Colors.amber,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Text('Modal BottomSheet'),
                              ElevatedButton(
                                child: const Text('Close BottomSheet'),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }
}

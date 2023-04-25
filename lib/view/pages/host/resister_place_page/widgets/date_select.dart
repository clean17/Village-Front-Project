import 'package:flutter/material.dart';
import 'package:village/core/constants/color.dart';
import 'package:village/core/constants/size.dart';

class DateSelect extends StatefulWidget {
  const DateSelect({super.key});

  @override
  State<DateSelect> createState() => _DateSelectState();
}

bool isButton1Pressed = false;
bool isButton2Pressed = false;
bool isButton3Pressed = false;
bool isButton4Pressed = false;
bool isButton5Pressed = false;
bool isButton6Pressed = false;
bool isButton7Pressed = false;
bool isButton8Pressed = false;
bool isButton9Pressed = false;
bool isButton10Pressed = false;

class _DateSelectState extends State<DateSelect> {
  @override
  Widget build(BuildContext context) {
    final double dayWeith = getScreenWidth(context) * 0.11;
    final double dayWeith2 = getScreenWidth(context) * 0.277;
    final double dayHeight = getScreenHeight(context) * 0.1;

    return Column(
      children: [
        // Row(
        //   children: [
        //     Container(
        //       width: dayWeith2,
        //       height: dayHeight,
        //       margin: const EdgeInsets.symmetric(horizontal: 3),
        //       child: ElevatedButton(
        //         onPressed: () {
        //           setState(() {
        //             isButton1Pressed = true;
        //             isButton2Pressed = true;
        //             isButton3Pressed = true;
        //             isButton4Pressed = true;
        //             isButton5Pressed = true;
        //             isButton6Pressed = true;
        //             isButton7Pressed = true;
        //             isButton8Pressed = !isButton8Pressed;
        //           });
        //         },
        //         style: ElevatedButton.styleFrom(
        //           foregroundColor: Colors.white,
        //           backgroundColor:
        //               isButton8Pressed ? kAccentColor : Colors.grey[400],
        //         ),
        //         child: const Text('상시'),
        //       ),
        //     ),
        //     Container(
        //       width: dayWeith2,
        //       height: dayHeight,
        //       margin: const EdgeInsets.symmetric(horizontal: 3),
        //       child: ElevatedButton(
        //         onPressed: () {
        //           setState(() {
        //             isButton9Pressed = !isButton9Pressed;
        //             isButton2Pressed = !isButton2Pressed;
        //             isButton3Pressed = !isButton3Pressed;
        //             isButton4Pressed = !isButton4Pressed;
        //             isButton5Pressed = !isButton5Pressed;
        //             isButton6Pressed = !isButton6Pressed;
        //           });
        //         },
        //         style: ElevatedButton.styleFrom(
        //           foregroundColor: Colors.white,
        //           backgroundColor:
        //               isButton9Pressed ? kAccentColor : Colors.grey[400],
        //         ),
        //         child: const Text('월-금'),
        //       ),
        //     ),
        //     Container(
        //       width: dayWeith2,
        //       height: dayHeight,
        //       margin: const EdgeInsets.symmetric(horizontal: 3),
        //       child: ElevatedButton(
        //         onPressed: () {
        //           setState(() {
        //             isButton10Pressed = !isButton10Pressed;
        //             isButton1Pressed = !isButton1Pressed;
        //             isButton7Pressed = !isButton7Pressed;
        //           });
        //         },
        //         style: ElevatedButton.styleFrom(
        //           foregroundColor: Colors.white,
        //           backgroundColor:
        //               isButton10Pressed ? kAccentColor : Colors.grey[400],
        //         ),
        //         child: const Text('토-일'),
        //       ),
        //     ),
        //   ],
        // ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Container(
              width: dayWeith,
              height: dayHeight,
              margin: const EdgeInsets.symmetric(horizontal: 3),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isButton1Pressed = !isButton1Pressed;
                  });
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor:
                      isButton1Pressed ? kAccentColor : Colors.grey[400],
                ),
                child: const Text('일'),
              ),
            ),
            Container(
              width: dayWeith,
              height: dayHeight,
              margin: const EdgeInsets.symmetric(horizontal: 3),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isButton2Pressed = !isButton2Pressed;
                  });
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor:
                      isButton2Pressed ? kAccentColor : Colors.grey[400],
                ),
                child: const Text('월'),
              ),
            ),
            Container(
              width: dayWeith,
              height: dayHeight,
              margin: const EdgeInsets.symmetric(horizontal: 3),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isButton3Pressed = !isButton3Pressed;
                  });
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor:
                      isButton3Pressed ? kAccentColor : Colors.grey[400],
                ),
                child: const Text('화'),
              ),
            ),
            Container(
              width: dayWeith,
              height: dayHeight,
              margin: const EdgeInsets.symmetric(horizontal: 3),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isButton4Pressed = !isButton4Pressed;
                  });
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor:
                      isButton4Pressed ? kAccentColor : Colors.grey[400],
                ),
                child: const Text('수'),
              ),
            ),
            Container(
              width: dayWeith,
              height: dayHeight,
              margin: const EdgeInsets.symmetric(horizontal: 3),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isButton5Pressed = !isButton5Pressed;
                  });
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor:
                      isButton5Pressed ? kAccentColor : Colors.grey[400],
                ),
                child: const Text('목'),
              ),
            ),
            Container(
              width: dayWeith,
              height: dayHeight,
              margin: const EdgeInsets.symmetric(horizontal: 3),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isButton6Pressed = !isButton6Pressed;
                  });
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor:
                      isButton6Pressed ? kAccentColor : Colors.grey[400],
                ),
                child: const Text('금'),
              ),
            ),
            Container(
              width: dayWeith,
              height: dayHeight,
              margin: const EdgeInsets.symmetric(horizontal: 3),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isButton7Pressed = !isButton7Pressed;
                  });
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor:
                      isButton7Pressed ? kAccentColor : Colors.grey[400],
                ),
                child: const Text('토'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

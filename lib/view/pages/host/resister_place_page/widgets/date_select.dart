import 'package:flutter/material.dart';
import 'package:village/core/constants/color.dart';
import 'package:village/core/constants/size.dart';

class DateSelect extends StatefulWidget {
  const DateSelect({super.key});

  @override
  State<DateSelect> createState() => _DateSelectState();
}

class _DateSelectState extends State<DateSelect> {
  @override
  Widget build(BuildContext context) {
    bool isButton1Pressed = false;
    bool isButton2Pressed = false;
    bool isButton3Pressed = false;
    bool isButton4Pressed = false;
    bool isButton5Pressed = false;
    bool isButton6Pressed = false;
    bool isButton7Pressed = false;
    final double dayWeith = getScreenWidth(context) * 0.11;
    final double dayHeight = getScreenHeight(context) * 0.05;
    return Row(
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
    );
  }
}

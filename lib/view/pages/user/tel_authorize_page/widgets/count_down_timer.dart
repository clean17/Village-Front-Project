import 'package:flutter/material.dart';
import 'dart:async';

class CountDownTimer extends StatefulWidget {
  @override
  _CountDownTimerState createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> {
  int _seconds = 60;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        } else {
          _timer!.cancel();
        }
      });
    });
  }

  String get timerText {
    Duration duration = Duration(seconds: _seconds);
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes분 $seconds초";
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      timerText,
      style: TextStyle(
          fontSize: 12, color: Colors.redAccent
      ),
    );
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }
}
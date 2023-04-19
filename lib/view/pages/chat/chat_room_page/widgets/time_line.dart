import 'package:flutter/material.dart';

class TimeLine extends StatelessWidget {
  const TimeLine({Key? key, required this.time}) : super(key: key);

  final time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Container(
        padding: EdgeInsets.all(7), // 컨테이너 자체는 패딩을 가지고 있어
        decoration: BoxDecoration(
          color: Colors.grey[500],
          borderRadius: BorderRadius.circular(17),



        ),
        child: Text(time,
        style: TextStyle(color: Colors.white),),
      ),
    );

  }
}

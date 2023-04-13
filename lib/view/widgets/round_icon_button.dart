import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({Key? key, required this.icon}) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 1, color: Colors.white,),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // 그림자 색상
            spreadRadius: 1, // 그림자 전체 크기를 얼마나 확장시킬 것인지
            blurRadius: 1, // 그림자의 흐림 정도를 설정합니다.
            offset: Offset(0, 1), // 그림자 위치 조정을 위한 오프셋 값
            // 오프셋 설정 ?
          ),
        ],

      ),
      child: Icon(
        icon,
        size: 17,
        color: Colors.white,
      ),
    );
  }
}

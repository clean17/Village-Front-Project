import 'package:flutter/material.dart';
import 'package:village/view/pages/place/detail_page/widgets/division_text.dart';
import 'package:village/view/pages/place/detail_page/widgets/place_hash_tag.dart';

class PlaceIntroduction extends StatelessWidget {
  const PlaceIntroduction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        color: Colors.white,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DivisionText(text: '<공간소개>'),
            const Text(
                "이용안내 \n - 1시간 : 55,000원 (4인기준) \n- 기준 인원 초과시 1인당 5,500원 추가\n- 주차 : 무료 1대\n- 구비 품목 : 행거, 전신거울, 블루투스 스피커, 옷걸이"),
            const SizedBox(
              height: 20,
            ),
            Wrap(
              children: const [
                PlaceHashTag(text: '해시태그'),
                PlaceHashTag(text: '해시태그'),
                PlaceHashTag(text: '해시태그'),
                PlaceHashTag(text: '해시태그'),
              ],
            )
          ],
        ));
  }
}

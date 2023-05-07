import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/view/pages/place/detail_page/place_detail_page_view_model.dart';
import 'package:village/view/pages/place/detail_page/widgets/division_text.dart';
import 'package:village/view/pages/place/detail_page/widgets/place_detail_body.dart';
import 'package:village/view/pages/place/detail_page/widgets/place_hash_tag.dart';

class PlaceIntroduction extends ConsumerWidget {
  const PlaceIntroduction({
    super.key,
  });
  // final GlobalKey oneKey = testKey;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PlaceDetailPageModel pm = ref.watch(placeDetailPageProvider);
    return Container(
        key: indexKeyList[0],
        width: double.infinity,
        color: Colors.white,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DivisionText(text: '<공간소개>'),
            Text(pm.place?.placeIntroductionInfo ??
                "이용안내 \n - 1시간 : 55,000원 (4인기준) \n- 기준 인원 초과시 1인당 5,500원 추가\n- 주차 : 무료 1대\n- 구비 품목 : 행거, 전신거울, 블루투스 스피커, 옷걸이"),
            const SizedBox(
              height: 20,
            ),
            Wrap(
                children: List.generate(
              pm.place?.hashtags.length ?? 0,
              (index) => PlaceHashTag(text: pm.place?.hashtags[index]),
            ))
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/view/pages/place/detail_page/place_detail_page_view_model.dart';

import 'package:village/view/pages/place/detail_page/widgets/division_text.dart';
import 'package:village/view/pages/place/detail_page/widgets/place_detail_body.dart';

class PlaceGuide extends ConsumerWidget {
  const PlaceGuide({
    super.key,
  });
  // GlobalKey twoKey = tabKeyList[1];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PlaceDetailPageModel pm = ref.watch(placeDetailPageProvider);
    return Container(
      key: indexKeyList[1],
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
        DivisionText(text: '<유의사항>'),
        Text(
            "- 무인 렌탈 시스템으로 예약일 오전에 비밀번호를 안내해드립니다 \n- 스튜디오 내에서는 반드시 실내화를 착용 부탁드립니다 \n - 예약시간은 입실, 퇴실, 준비 및 정리시간을 포함한 시간으로 다음 예약자를 위하여 시간 준수 부탁드립니다.\n - 예약시간은 입실, 퇴실, 준비 및 정리시간을 포함한 시간으로 다음 예약자를 위하여 시간 준수 부탁드립니다.\n - 작은가구와 소품은 이용이 가능하며, 다음 예약자를 위하여 원위치로 정리 부탁드립니다.\n - 사용 중 가구 및 소품이 파손되었을 경우 제품가의 100% 비용이 청구될 수 있으니 주의부탁드립니다.\n - 반려동물은 이용이 불가능합니다.\n - 스튜디오 내에 CCTV가 설치되어 있습니다. (임,퇴실시만 확인/방범 및 문제 발생시 확인용으로 사용)\n - 특수영상 및 광고촬영시 사전 문의 부탁드립니다.\n"),
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:village/view/pages/place/detail_page/widgets/division_text.dart';
import 'package:village/view/pages/place/detail_page/widgets/place_detail_body.dart';

class PlaceNotice extends StatelessWidget {
  const PlaceNotice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      key: indexKeyList[4],
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
        DivisionText(text: '<주의 사항>'),
        Text(
            "- 해당 공간 이용 시 빌리오 회원임을 알려주세요.\n- 실제 공간과 사진이 서로 상이할 수 있습니다.\n- 업체 사정으로 인한 요금 변동이 있을 수 있습니다.\n- 기준인원을 초과할 경우 추가 금액이 발생합니다.\n- 공간에 대한 문의사항은 호스트에게 직접 문의해주세요."),
      ]),
    );
  }
}

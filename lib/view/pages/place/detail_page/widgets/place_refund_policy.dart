import 'package:flutter/material.dart';
import 'package:village/view/pages/place/detail_page/widgets/division_text.dart';
import 'package:village/view/pages/place/detail_page/widgets/place_detail_body.dart';

class PlaceRefundPolicy extends StatelessWidget {
  const PlaceRefundPolicy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      key: indexKeyList[5],
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
        DivisionText(text: '<취소 및 환불 규정>'),
        Text(
            '사용 7일 전 총 금액의 100% 환불\n사용 6일 전 총 금액의 100% 환불\n사용 5일 전 총 금액의 100% 환불\n사용 4일 전 총 금액의 50% 환불\n사용 3일 전 총 금액의 30% 환불\n사용 2일 전 총 금액의 10% 환불\n사용 1일 전 환불 불가\n사용 당일 환불 불가\n\n- 승인 없이 예약: 결제 후 2시간 이내 100% 환불 (단, 이용 시간 전까지 가능)\n- 승인 후 예약: 호스트 승인 전까지 100% 환불 (단, 승인 후 예약 취소 불가 능)\n- 제휴점 사정에 의한 취소 시에는 100% 환불됩니다.\n- 예약에 쿠폰을 사용한 경우, 취소 시 쿠폰은 고객님의 계정으로 반환됩니다.\n 월 단위 예약의 경우 퇴실 1달 전 미리 말씀 주셔야 합니다.\n'),
      ]),
    );
  }
}

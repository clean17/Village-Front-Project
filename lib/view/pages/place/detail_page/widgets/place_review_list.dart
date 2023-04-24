import 'package:flutter/material.dart';
import 'package:village/core/constants/size.dart';
import 'package:village/view/pages/place/detail_page/widgets/place_detail_body.dart';

import 'package:village/view/pages/place/detail_page/widgets/place_review_list_box.dart';

class PlaceReviewList extends StatelessWidget {
  const PlaceReviewList({
    super.key,
  });
  // GlobalKey fourKey = tabKeyList[3];
  @override
  Widget build(BuildContext context) {
    return Container(
        key: indexKeyList[7],
        width: getScreenWidth(context),
        height: 205,
        color: Colors.grey.shade200,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: const [
            // 리뷰 필요 데이터 5개.......
            PlaceReviewListBox(),
            PlaceReviewListBox(),
            PlaceReviewListBox(),
          ],
        ));
  }
}

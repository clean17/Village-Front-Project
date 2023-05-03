import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/core/constants/size.dart';
import 'package:village/view/pages/place/detail_page/place_detail_page_view_model.dart';
import 'package:village/view/pages/place/detail_page/widgets/place_detail_body.dart';

import 'package:village/view/pages/place/detail_page/widgets/place_review_list_box.dart';

class PlaceReviewList extends ConsumerWidget {
  const PlaceReviewList({
    super.key,
  });
  // GlobalKey fourKey = tabKeyList[3];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PlaceDetailPageModel pm = ref.watch(placeDetailPageProvider);
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

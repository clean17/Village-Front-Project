import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/core/constants/size.dart';
import 'package:village/view/pages/place/detail_page/place_detail_page_view_model.dart';
import 'package:village/view/pages/place/detail_page/widgets/division_text.dart';
import 'package:village/view/pages/place/detail_page/widgets/place_detail_body.dart';

class PlaceReviewList extends ConsumerWidget {
  const PlaceReviewList({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pm = ref.watch(placeDetailPageProvider);
    int num = pm.place != null ? pm.place!.review!.length : 0;
    int num1 = 0;
    return Container(
        key: indexKeyList[6],
        width: getScreenWidth(context),
        height: 205,
        color: Colors.grey.shade200,
        child: Column(
          children: [
            Row(
              children: const [
                SizedBox(
                  width: 16,
                ),
                DivisionText(text: '유저들의 생생한 리뷰'),
                // ListView(
                //     scrollDirection: Axis.horizontal,
                //     children: List.generate(
                //         num1, (index) => const PlaceReviewListBox()))
              ],
            )
          ],
        ));
  }
}

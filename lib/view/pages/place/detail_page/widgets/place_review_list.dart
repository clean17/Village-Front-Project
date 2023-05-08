import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/core/constants/size.dart';
import 'package:village/core/constants/style.dart';
import 'package:village/view/pages/place/detail_page/place_detail_page_view_model.dart';
import 'package:village/view/pages/place/detail_page/widgets/division_text.dart';
import 'package:village/view/pages/place/detail_page/widgets/place_detail_body.dart';
import 'package:village/view/pages/place/detail_page/widgets/place_review_list_box.dart';

class PlaceReviewList extends ConsumerWidget {
  const PlaceReviewList({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pm = ref.watch(placeDetailPageProvider);
    int num = 0;
    if (pm.place != null) {
      num = pm.place!.review!.isNotEmpty ? pm.place!.review!.length : 0;
    }

    return Container(
        key: indexKeyList[6],
        width: getScreenWidth(context),
        height: 205,
        color: Colors.grey.shade200,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 16,
                ),
                DivisionText(text: '유저들의 생생한 리뷰'),
              ],
            ),
            Expanded(
              child: num != 0
                  ? ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                          num,
                          (index) => PlaceReviewListBox(
                                review: pm.place?.review![index],
                              )))
                  : Container(
                      width: getScreenWidth(context) * 0.7,
                      margin: const EdgeInsets.only(
                        left: 16,
                        bottom: 10,
                      ),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: const Center(
                          child: Text(
                        '아직 리뷰가 없습니다.',
                        style: mgrey_text,
                      )),
                    ),
            )
          ],
        ));
  }
}

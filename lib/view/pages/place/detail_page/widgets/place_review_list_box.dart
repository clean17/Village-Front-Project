import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/core/constants/move.dart';
import 'package:village/core/constants/size.dart';
import 'package:village/core/constants/style.dart';
import 'package:village/view/pages/place/detail_page/place_detail_page_view_model.dart';
import 'package:village/view/pages/place/detail_page/widgets/appbar_widgets/place_info_category.dart';
import 'package:village/view/widgets/rating_star.dart';

class PlaceReviewListBox extends ConsumerWidget {
  const PlaceReviewListBox({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PlaceDetailPageModel pm = ref.read(placeDetailPageProvider);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Move.reviewReadPage);
      },
      child: Container(
        width: getScreenWidth(context) * 0.7,
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Column(children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 75,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage(
                          'assets/download_1.jpg',
                        ),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(12)),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('리뷰 제목'),
                    PlaceInfoCategory(
                      pm: pm,
                      style: mxsmall_grey_text,
                      height: 13,
                    ),
                    Row(
                      children: [RatingStar(), const Text('5')],
                    ),
                  ]),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            maxLines: 3,
            'ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ',
            style: TextStyle(overflow: TextOverflow.ellipsis),
          ),
        ]),
      ),
    );
  }
}

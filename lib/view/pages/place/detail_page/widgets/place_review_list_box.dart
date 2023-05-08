import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/core/constants/move.dart';
import 'package:village/core/constants/size.dart';
import 'package:village/core/constants/style.dart';
import 'package:village/model/place/place.dart';
import 'package:village/view/pages/place/detail_page/widgets/appbar_widgets/place_info_category.dart';
import 'package:village/view/widgets/rating_star.dart';

class PlaceReviewListBox extends ConsumerWidget {
  const PlaceReviewListBox({
    super.key,
    required this.review,
  });

  final Review? review;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Move.reviewReadPage);
      },
      child: Container(
        width: getScreenWidth(context) * 0.7,
        margin: const EdgeInsets.only(
          left: 16,
          bottom: 10,
        ),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Column(children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 75,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: '${review?.image}', // 여기에 이미지 URL을 입력하세요.
                    fit: BoxFit.cover,
                    width: 80,
                    height: 75,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(), // 이미지를 기다리는 동안 표시할 위젯
                    errorWidget: (context, url, error) => Image.asset(
                      'assets/download_2.jpg',
                      fit: BoxFit.cover,
                    ), // 에러가 발생한 경우 표시할 위젯
                  ),
                ),
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
                      style: mxsmall_grey_text,
                      height: 13,
                    ),
                    Row(
                      children: [
                        RatingStar(),
                        Text(review!.starRating.toString())
                      ],
                    ),
                  ]),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            maxLines: 2,
            review?.content ?? "",
            style: const TextStyle(overflow: TextOverflow.ellipsis),
          ),
        ]),
      ),
    );
  }
}

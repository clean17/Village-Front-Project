import 'package:flutter/material.dart';
import 'package:village/core/constants/style.dart';
import 'package:village/view/pages/review/read_page/widgets/thumbs_down.dart';
import 'package:village/view/pages/review/read_page/widgets/thumbs_up.dart';
import 'package:village/view/widgets/rating_star.dart';

class UserReview extends StatelessWidget {
  const UserReview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0), color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              RatingStar(),
              RatingStar(),
              RatingStar(),
              RatingStar(),
              RatingStar(),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 220.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 20.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      "https://picsum.photos/id/${index + 1}/200/300",
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "빌리지 첫 방문인데 너무 좋네요",
            style: mblack_text,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "케임브리지 대학교 출판부는 케임브리지 대학교의 출판 사업을 다루는 출판사이다. 1534년, 헨리 8세에 의해 특허장이 나온 것을 발생하는 세계에서 가장 오래된 출판사이자 세계에서 두 번째로 큰 규모의 대학 출판부이며 성경과 학술지 출판도 다루고 있다.위키백과",
            style: mblack_text,
          ),
          const Divider(),
          const Text(
            '리뷰가 도움이 되었나요 ?',
            style: msmall_grey_text,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              ThumbsUp(),
              const SizedBox(
                width: 6,
              ),
              ThumbsDown(),
            ],
          )
        ]),
      ),
    );
  }
}

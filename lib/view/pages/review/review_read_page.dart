import 'package:flutter/material.dart';
import 'package:village/core/constants/style.dart';
import 'package:village/view/pages/review/widgets/thumbs_down.dart';
import 'package:village/view/pages/review/widgets/thumbs_up.dart';
import 'package:village/view/widgets/rating_star.dart';
import 'package:village/view/widgets/simple_appbar.dart';

class ReviewReadPage extends StatelessWidget {
  const ReviewReadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: simpleAppbar(),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '리뷰',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RatingStar(),
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
                              ThumbsUP(),
                            ],
                          )
                        ]),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 25),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "더원 파티룸",
                            style: mlarge_black_text,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: Colors.grey[200]),
                            child: const Text(
                              "케임브리지 대학교 출판부는 케임브리지 대학교의 출판 사업을 다루는 출판사이다. 1534년, 헨리 8세에 의해 특허장이 나온 것을 발생하는 세계에서 가장 오래된 출판사이자 세계에서",
                              style: mblack_text,
                            ),
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 10,
                          ),
                        ]),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:village/core/constants/style.dart';

class HostReply extends StatelessWidget {
  const HostReply({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 25),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0), color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
    );
  }
}

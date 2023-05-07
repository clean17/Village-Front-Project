import 'package:flutter/material.dart';
import 'package:village/core/constants/style.dart';
import 'package:village/view/pages/place/detail_page/widgets/place_detail_body.dart';

class PlaceRecomend extends StatelessWidget {
  const PlaceRecomend({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      key: indexKeyList[7],
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          "이 공간과 비슷한 곳 추천",
          style: mxlarge_black_text,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 200.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(right: 20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    "https://picsum.photos/id/${index + 1}/150/150",
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ]),
    );
  }
}

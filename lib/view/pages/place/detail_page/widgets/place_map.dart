import 'package:flutter/material.dart';
import 'package:village/core/constants/move.dart';
import 'package:village/core/constants/size.dart';
import 'package:village/view/pages/place/detail_page/place_detail_page.dart';

import 'package:village/view/pages/place/detail_page/widgets/division_text.dart';
import 'package:village/view/pages/place/detail_page/widgets/place_map_detail_page.dart';

class PlaceMap extends StatelessWidget {
  const PlaceMap({
    super.key,
  });
  // GlobalKey threeKey = tabKeyList[2];
  @override
  Widget build(BuildContext context) {
    return Container(
      key: threeKey,
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const DivisionText(text: '<공간위치>'),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, Move.mapNearbyPlacePage),
          child: SizedBox(
            width: getScreenWidth(context),
            height: 200,
            child: const PlaceMapDetailPage(),
          ),
        ),
      ]),
    );
  }
}

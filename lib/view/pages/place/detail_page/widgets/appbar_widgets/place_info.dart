import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/controller/place_controller.dart';
import 'package:village/core/constants/style.dart';
import 'package:village/view/pages/place/detail_page/place_detail_page_view_model.dart';
import 'package:village/view/pages/place/detail_page/widgets/appbar_widgets/place_info_category.dart';

class PlaceInfo extends ConsumerWidget {
  const PlaceInfo({
    required this.pm,
    super.key,
  });

  final pm;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pm = ref.watch(placeDetailPageProvider);
    double rating = 0.0;
    if (pm.place?.review != null) {
      double temp = 0.0;
      for (var e in pm.place!.review!) {
        temp += e.starRating;
        rating = temp / pm.place!.review!.length;
      }
    }
    return Padding(
      padding: const EdgeInsets.only(
        right: 16.0,
        left: 16.0,
        top: 25.0,
      ),
      child: Container(
        color: Colors.white,
        child: Column(children: [
          // 지역, 카테고리
          PlaceInfoCategory(
            pm: pm,
          ),
          // 타이틀
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  pm.place?.title ?? ' ',
                  style: mplace_title,
                )),
          ),
          // 리뷰 별점
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Row(children: [
              const Icon(Icons.star, color: Colors.amber),
              Text(
                "$rating (${pm.place?.review?.length ?? 0})",
                style: const TextStyle(fontSize: 16),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.black54,
                size: 16,
              ),
              const Icon(
                Icons.map_outlined,
                color: Colors.red,
                size: 16,
              ),
              GestureDetector(
                onTap: () {
                  if (pm.place != null) {
                    ref.read(placeControllerProvider).showMap(pm.place!.id);
                  }
                },
                child: const Text(
                  "위치보기",
                  style: TextStyle(fontSize: 16, color: Colors.red),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.red,
                size: 16,
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}

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
    PlaceDetailPageModel pm = ref.watch(placeDetailPageProvider);
    return Padding(
      padding: const EdgeInsets.only(
        right: 16.0,
        left: 16.0,
        top: 25.0,
      ),
      child: Container(
        color: Colors.white,
        child: Column(children: [
          PlaceInfoCategory(
            pm: pm,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  pm.place?.title ?? ' ',
                  style: mplace_title,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Row(children: [
              const Icon(Icons.star, color: Colors.amber),
              const Text(
                "5.0(1) 리뷰 데이터 가져와야함",
                style: TextStyle(fontSize: 16),
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

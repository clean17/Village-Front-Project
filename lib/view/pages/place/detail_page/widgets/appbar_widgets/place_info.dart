import 'package:flutter/material.dart';
import 'package:village/core/constants/style.dart';
import 'package:village/view/pages/place/detail_page/widgets/appbar_widgets/place_info_category.dart';

class PlaceInfo extends StatelessWidget {
  const PlaceInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 16.0,
        left: 16.0,
        top: 25.0,
      ),
      child: Container(
        color: Colors.white,
        child: Column(children: [
          PlaceInfoCategory(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "스튜디오 르온드",
                  style: mplace_title,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Row(children: const [
              Icon(Icons.star, color: Colors.amber),
              Text(
                "5.0(1)",
                style: TextStyle(fontSize: 16),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.black54,
                size: 16,
              ),
              Icon(
                Icons.map_outlined,
                color: Colors.red,
                size: 16,
              ),
              Text(
                "위치보기",
                style: TextStyle(fontSize: 16, color: Colors.red),
              ),
              Icon(
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

import 'package:flutter/material.dart';
import 'package:village/core/constants/color.dart';
import 'package:village/core/constants/style.dart';
import 'package:village/dummy/home_page_data.dart';
import 'package:village/view/pages/main/home_page/widgets/image_carousel.dart';
import 'package:village/view/pages/main/home_page/widgets/place_card.dart';

class PlaceContainer extends StatelessWidget {
  const PlaceContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 20),
        clipBehavior: Clip.hardEdge,
        height: 280,
        width: 340,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade400),
        ),
        child: Column(
          children: [
            const Expanded(
              flex: 6,
              child: ImageCarousel(),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: PlaceCard(
                  title: mainData[0]["title"],
                  max_people: mainData[0]["max_people"],
                  parking: mainData[0]["parking"],
                  address: mainData[0]["address"],
                  hashtag: mainData[0]["hashtag"],
                  star_rating: mainData[0]["star_rating"],
                  riview: mainData[0]["riview"],
                  price_per_hour: mainData[0]["price_per_hour"],
                  press: () {},
                ),
              ),
            ),
          ],
        ));
  }
}

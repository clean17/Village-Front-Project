import 'package:flutter/material.dart';
import 'package:village/core/color.dart';
import 'package:village/core/style.dart';
import 'package:village/dummy/home_page_data.dart';

class PlaceContainer extends StatelessWidget {
  const PlaceContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 20),
        clipBehavior: Clip.hardEdge,
        height: 280,
        width: 340,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade400),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: ImageCarousel(),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: PlaceCard(title: mainData[0]["title"],
                  max_people: mainData[0]["max_people"],
                  parking: mainData[0]["parking"],
                  address: mainData[0]["address"],
                  hashtag: mainData[0]["hashtag"],
                  star_rating: mainData[0]["star_rating"],
                  riview: mainData[0]["riview"],
                  price_per_hour: mainData[0]["price_per_hour"],
                  press: (){},),
              ),
            ),
          ],
        ));
  }
}

class PlaceCard extends StatelessWidget {
  const PlaceCard({
    super.key,
    required this.title,
    required this.max_people,
    required this.parking,
    required this.address,
    required this.hashtag,
    required this.star_rating,
    required this.riview,
    required this.price_per_hour,
    required this.press,
  });

  final String title,
      max_people,
      parking,
      address,
      hashtag,
      star_rating,
      riview,
      price_per_hour;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.symmetric(
                    horizontal: 2,
                    vertical: 1,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: [
                      Icon(Icons.face, size: 15),
                      Text(
                        max_people,
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 2,
                    vertical: 1,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.shade200),
                  child: Row(
                    children: [
                      Icon(Icons.directions_car, size: 15),
                      Text(
                        parking,
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: Text(
                address,
                style: msmall_grey_text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 3),
              child: Text(
                hashtag,
                style: TextStyle(fontSize: 14, color: kPrimaryLightColor),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.star, color: Colors.amber),
                Text(
                  star_rating,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  riview,
                  style: TextStyle(fontSize: 12),
                ),
                Text(price_per_hour,
                    style: TextStyle(fontWeight: FontWeight.bold))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({
    super.key,
  });

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        PageView.builder(
          itemCount: 3,
          onPageChanged: (value) {
            setState(() {
              _currentPage = value;
            });
          },
          itemBuilder: (context, index) {
            return Image.asset(
              mainImage[index],
              fit: BoxFit.cover,
            );
          },
        ),
        Positioned(
          bottom: 16,
          // right: 16,
          child: Row(
            children: List.generate(
                mainImage.length,
                    (index) =>
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: IndicatorDot(isActive: index == _currentPage),
                    )),
          ),
        ),
      ],
    );
  }
}

class IndicatorDot extends StatelessWidget {
  const IndicatorDot({
    super.key,
    required this.isActive,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: 8,
      decoration: BoxDecoration(
          color: isActive ? kPrimaryColor : Colors.white,
          borderRadius: BorderRadius.circular(12)),
    );
  }
}

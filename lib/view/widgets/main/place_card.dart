import 'package:flutter/material.dart';
import 'package:village/core/color.dart';
import 'package:village/core/style.dart';

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
                Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
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
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Spacer(),
                InkWell(
                  onTap: (){},
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 2,
                      vertical: 1,
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.bookmark_border, size: 18),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

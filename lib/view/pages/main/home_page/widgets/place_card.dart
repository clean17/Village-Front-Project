import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:village/core/constants/color.dart';
import 'package:village/core/constants/style.dart';
import 'package:village/model/place/place_List.dart';
import 'package:village/view/widgets/custom_book_mark_icon.dart';

class PlaceCard extends StatelessWidget {
  const PlaceCard({
    super.key,
    required this.title,
    required this.max_people,
    required this.max_parking,
    required this.address,
    required this.hashtag,
    required this.star_rating,
    required this.review_count,
    required this.price_per_hour,
  });

  final String title, address;
  final int max_people, review_count, price_per_hour, max_parking;
  final double star_rating;

  final List<Hashtag> hashtag;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(
                horizontal: 2,
                vertical: 1,
              ),
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: [
                  const Icon(Icons.face, size: 15),
                  Text(
                    max_people.toString(),
                    style: const TextStyle(fontSize: 15),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 2,
                vertical: 1,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey.shade200),
              child: Row(
                children: [
                  const Icon(Icons.directions_car, size: 15),
                  Text(
                    max_parking.toString(),
                    style: const TextStyle(fontSize: 15),
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
        SizedBox(
          height: 25, // 수정 가능한 높이 값
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: hashtag.length,
            itemBuilder: (BuildContext context, int index) {
              return Text(
                "#${hashtag[index].hashtagName}   ",
                style: const TextStyle(fontSize: 14, color: kAccentColor),
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(Icons.star, color: Colors.amber),
            Text(
              star_rating.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "(${review_count.toString()})",
              style: const TextStyle(fontSize: 12),
            ),
            const SizedBox(
              width: 30,
            ),
            Text("${NumberFormat("#,###", "en_US").format(price_per_hour)}원",
                style: const TextStyle(fontWeight: FontWeight.w500)),
            const Spacer(),
            const CustomBookMarkIcon(),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/view/pages/main/home_page/widgets/image_carousel.dart';
import 'package:village/view/pages/main/home_page/widgets/place_card.dart';

class PlaceContainer extends ConsumerWidget {
  const PlaceContainer({
    Key? key,
    required this.place,
  }) : super(key: key);

  final place;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            Expanded(
              flex: 6,
              child: ImageCarousel(images: place?.fileUrls),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: PlaceCard(
                  title: place.title ?? "",
                  max_people: place.maxPeople ?? 0,
                  max_parking: place.maxParking ?? 0,
                  address: place.address.sigungu ?? "",
                  hashtag: place.hashtags ?? [],
                  star_rating: place.review?.starRating ?? 0,
                  review_count: place.review?.reviewCount ?? 0,
                  price_per_hour: place.pricePerHour ?? 0,
                ),
              ),
            ),
          ],
        ));
  }
}

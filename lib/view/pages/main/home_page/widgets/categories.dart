import 'package:flutter/material.dart';
import 'package:village/view/pages/main/home_page/widgets/category_card.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/studying.png", "text": "스터디룸"},
      {"icon": "assets/icons/meeting.png", "text": "공유오피스"},
      {"icon": "assets/icons/studio.png", "text": "연습실"},
    ];
    return Column(
      children: [
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...List.generate(
              categories.length,
              (index) => CategoryCard(
                  icon: categories[index]["icon"],
                  text: categories[index]["text"],
                  press: () {}),
            )
          ],
        ),
      ],
    );
  }
}

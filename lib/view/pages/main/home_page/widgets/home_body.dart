import 'package:flutter/material.dart';
import 'package:village/view/pages/main/home_page/widgets/categories.dart';
import 'package:village/view/pages/main/home_page/widgets/home_title.dart';
import 'package:village/view/pages/main/home_page/widgets/place_container.dart';
import 'package:village/view/pages/main/home_page/widgets/recommend_card.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeTitle("예약할 공간을 찾고있나요? 👀"),
                  Categories(),
                  SizedBox(height: 50),
                  HomeTitle("VILLAGE가 추천하는 기획전"),
                  SizedBox(height: 30),
                  RecommendCard(),
                  SizedBox(height: 50),
                  HomeTitle("스토리와 테마가 있는 \n공간을 추천드려요"),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ]),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: PlaceContainer(),
              );
            },
            childCount: 5,
          ),
        ),
      ],
    );
  }
}

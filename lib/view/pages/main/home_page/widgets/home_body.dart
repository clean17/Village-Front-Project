import 'package:flutter/material.dart';
import 'package:village/core/constants/move.dart';
import 'package:village/view/pages/main/home_page/widgets/categories.dart';
import 'package:village/view/pages/main/home_page/widgets/home_title.dart';
import 'package:village/view/pages/main/home_page/widgets/place_container.dart';
import 'package:village/view/pages/main/home_page/widgets/recommend_card.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(height: 5, color: Colors.grey.shade300),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white
              ),
              child: Column(
                children: [
                  HomeTitle("예약할 공간을 찾고있나요? 👀"),
                  Categories(),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(height: 5, color: Colors.grey.shade300),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 30),
              decoration: BoxDecoration(
                  color: Colors.white
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 18),
                      HomeTitle("VILLAGE가 추천하는 기획전"),
                    ],
                  ),
                  SizedBox(height: 25),
                  RecommendCard(),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(height: 5, color: Colors.grey.shade300,),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white
              ),
              child: HomeTitle("스토리와 테마가 있는 공간 추천"),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, Move.placeDetailPage),
                      child: const PlaceContainer()),
                );
              },
              childCount: 5,
            ),
          )
        ],
      ),
    );
  }
}

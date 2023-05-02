import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/controller/place_controller.dart';
import 'package:village/view/pages/main/home_page/home_page_view_model.dart';
import 'package:village/view/pages/main/home_page/widgets/categories.dart';
import 'package:village/view/pages/main/home_page/widgets/home_title.dart';
import 'package:village/view/pages/main/home_page/widgets/place_container.dart';
import 'package:village/view/pages/main/home_page/widgets/recommend_card.dart';

class HomeBody extends ConsumerWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    HomePageModel? pm = ref.watch(homePageProvider);
    return Container(
      color: Colors.white,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                children: const [
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
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  Row(
                    children: const [
                      SizedBox(width: 18),
                      HomeTitle("VILLAGE가 추천하는 기획전"),
                    ],
                  ),
                  const SizedBox(height: 25),
                  const RecommendCard(),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 5,
              color: Colors.grey.shade300,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              decoration: const BoxDecoration(color: Colors.white),
              child: const HomeTitle("스토리와 테마가 있는 공간 추천"),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: pm?.placeList.length ?? 0,
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                      onTap: () => ref
                          .read(placeControllerProvider)
                          .detail(pm!.placeList[index].id),
                      child: PlaceContainer(place: pm?.placeList[index])),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

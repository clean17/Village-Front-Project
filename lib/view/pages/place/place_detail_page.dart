import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/view/widgets/bottom_button.dart';
import 'package:village/view/widgets/button_icon.dart';
import 'package:village/view/pages/place/widgets/place_info.dart';
import 'package:village/view/widgets/place_appbar.dart';

class PlaceDetailPage extends ConsumerWidget {
  const PlaceDetailPage({super.key});

  // 스크롤 상태에 따른 상단 앱바 검은색으로 바꿔야함
  // late ScrollController _scrollController;
  // bool _isAppBarTransparent = true;

  //   void _onScroll() {
  //   if (_scrollController.offset >= 50 && _isAppBarTransparent) {
  //       _isAppBarTransparent = false;
  //   } else if (_scrollController.offset < 50 && !_isAppBarTransparent) {
  //       _isAppBarTransparent = true;
  //   }
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double mWeith = MediaQuery.of(context).size.width;

    return Scaffold(
      // extendBodyBehindAppBar: true,
      // backgroundColor: Colors.transparent,
      appBar: placeAppbar(),
      body: Stack(
        children: [
          NestedScrollView(
            body: _fourBuild(),
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                // placeSliverAppbar(),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [placeInfo()],
                  ),
                ),
              ];
            },
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Container(
                color: Colors.white,
                child: Row(
                  children: [
                    const BottonIcon(icon: Icons.chat_outlined),
                    const SizedBox(
                      width: 10,
                    ),
                    BottomButton(
                      mWeith: mWeith,
                      text: '예약하기',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _fourBuild() {
    return Column(
      children: [
        const PlaceAnchor(),
        Expanded(
          child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("<공간소개>"),
                    const Text("이용안내"),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          height: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.grey[300]),
                          child: const Center(
                              child: Text(
                            "#해시태그1",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          height: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.grey[300]),
                          child: const Center(
                              child: Text(
                            "#해시태그1",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("<유의사항>"),
                    const Text("유의사항 블라블라"),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("<편의시설>"),
                    const Text("편의시설 블라블라"),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("<공간위치>"),
                    Container(
                      width: 400,
                      height: 200,
                      color: Colors.brown,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("<환불규정>"),
                    const Text("환불규정 블라블라"),
                    Container(
                      width: double.infinity,
                      height: 300,
                      color: Colors.green,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "이 공간과 비슷한 곳 추천",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 220.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 20.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                "https://picsum.photos/id/${index + 1}/200/300",
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class PlaceAnchor extends StatelessWidget {
  const PlaceAnchor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Text(
            "공간소개",
            style: TextStyle(fontSize: 16),
          ),
          Text(
            "이용안내",
            style: TextStyle(fontSize: 16),
          ),
          Text(
            "공간위치",
            style: TextStyle(fontSize: 16),
          ),
          Text(
            "리뷰",
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

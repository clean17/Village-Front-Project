import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/view/widgets/place/place_info.dart';
import 'package:village/view/widgets/place/place_sliver-appbar.dart';

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
    return Scaffold(
      // extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      // appBar: placeAppbar(),
      body: Stack(
        children: [
          NestedScrollView(
            body: _fourBuild(),
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                placeSliverAppbar(),
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
            child: Row(
              children: [
                ElevatedButton(
                  style: const ButtonStyle(),
                  onPressed: () {},
                  child: const Text('예약하기'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _fourBuild() {
    return ListView(
      children: [
        Column(
          children: [
            SizedBox(
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
            ),
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
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}

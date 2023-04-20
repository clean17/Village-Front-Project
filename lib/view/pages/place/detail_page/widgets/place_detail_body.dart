import 'package:flutter/material.dart';
import 'package:village/core/constants/move.dart';
import 'package:village/core/constants/size.dart';
import 'package:village/view/pages/place/detail_page/widgets/place_anchor.dart';
import 'package:village/view/pages/place/detail_page/widgets/place_info.dart';
import 'package:village/view/widgets/bottom_button.dart';
import 'package:village/view/widgets/button_icon.dart';

class PlaceDetailBody extends StatelessWidget {
  const PlaceDetailBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        NestedScrollView(
          body: Column(
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                height: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: Colors.grey[300]),
                                child: const Center(
                                    child: Text(
                                  "#해시태그1",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                height: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: Colors.grey[300]),
                                child: const Center(
                                    child: Text(
                                  "#해시태그1",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
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
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
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
          ),
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
                  BottonIcon(
                      funPress: () =>
                          {Navigator.pushNamed(context, Move.chatRoomPage)},
                      icon: Icons.chat_outlined),
                  const SizedBox(
                    width: 10,
                  ),
                  BottomButton(
                    mWeith: getScreenWidth(context),
                    text: '예약하기',
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

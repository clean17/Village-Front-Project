import 'package:flutter/material.dart';
import 'package:village/view/pages/place/detail_page/widgets/appbar_widgets/place_info.dart';
import 'package:village/view/pages/place/detail_page/widgets/appbar_widgets/place_sliver_appbar.dart';
import 'package:village/view/pages/place/detail_page/widgets/appbar_widgets/place_tabbar.dart';
import 'package:village/view/pages/place/detail_page/widgets/division_text.dart';
import 'package:village/view/pages/place/detail_page/widgets/place_botton_button.dart';
import 'package:village/view/pages/place/detail_page/widgets/place_facilies.dart';
import 'package:village/view/pages/place/detail_page/widgets/place_guide.dart';
import 'package:village/view/pages/place/detail_page/widgets/place_introduction.dart';
import 'package:village/view/pages/place/detail_page/widgets/place_map.dart';
import 'package:village/view/pages/place/detail_page/widgets/place_notice.dart';
import 'package:village/view/pages/place/detail_page/widgets/place_recomend.dart';
import 'package:village/view/pages/place/detail_page/widgets/place_refund_policy.dart';
import 'package:village/view/pages/place/detail_page/widgets/place_review_list.dart';

class PlaceDetailBody extends StatefulWidget {
  const PlaceDetailBody({
    super.key,
  });

  @override
  State<PlaceDetailBody> createState() => _PlaceDetailBodyState();
}

class _PlaceDetailBodyState extends State<PlaceDetailBody>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;

  List<String> facilities = [
    '화장실',
    '냉장고',
    '정수기',
    '주차장',
    '화장실',
    '냉장고',
    '정수기',
    '주차장',
    '화장실',
    '냉장고',
    '정수기',
    '주차장'
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    setState(() {
      _isScrolled = _scrollController.offset >= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        NestedScrollView(
          // controller: _scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              _isScrolled
                  ? const PlaceSliverAppbar(
                      appbarColor: Colors.black,
                      statusbarColor: Brightness.dark,
                    )
                  : const PlaceSliverAppbar(),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    // 데이터 넣어야함 ?
                    const PlaceInfo(),
                  ],
                ),
              ),
              // 스크롤 이동
              const PlaceTabbar(),
            ];
          },
          body: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(1),
                      color: Colors.grey.shade200,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const PlaceIntroduction(),
                          const SizedBox(
                            height: 10,
                          ),
                          const PlaceGuide(),
                          const SizedBox(
                            height: 10,
                          ),
                          PlaceFacilties(facilities: facilities),
                          const SizedBox(
                            height: 10,
                          ),
                          const PlaceMap(),
                          const SizedBox(
                            height: 10,
                          ),
                          const PlaceNotice(),
                          const SizedBox(
                            height: 10,
                          ),
                          const PlaceRefundPolicy(),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: const [
                              SizedBox(
                                width: 16,
                              ),
                              DivisionText(text: '유저들의 생생한 리뷰'),
                            ],
                          ),
                          const PlaceReviewList(),
                          const PlaceRecomend(),
                          const SizedBox(
                            height: 10,
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
        ),
        const Positioned(
          bottom: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: PlaceBottomButton(),
          ),
        ),
      ],
    );
  }
}

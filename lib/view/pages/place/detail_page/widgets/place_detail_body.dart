import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/dummy/facilities.dart';
import 'package:village/view/pages/place/detail_page/place_detail_page_view_model.dart';
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

class PlaceDetailBody extends ConsumerWidget {
  const PlaceDetailBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PlaceDetailPageViewModel vm = ref.watch(placeDetailPageProvider.notifier);
    var scrollController1 = ScrollController();
    scrollController1.addListener(() {
      if (scrollController1.position.pixels > 180) {
        // print(scrollController1.position.pixels);
        vm.changeScrolled(true);
      }
      if (scrollController1.position.pixels <= 180) {
        vm.changeScrolled(false);
      }
      print(ref.read(placeDetailPageProvider).scrolled);
    });
    return Stack(
      children: [
        NestedScrollView(
          controller: scrollController1,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              ref.watch(placeDetailPageProvider).scrolled
                  ? const PlaceSliverAppbar(
                      appbarColor: Colors.black,
                      statusbarColor: Brightness.dark,
                      actionColor: Colors.black,
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
              PlaceTabbar(),
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
                          reviewTitle(),
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
          left: 0,
          right: 0,
          child: PlaceBottomButton(),
        ),
      ],
    );
  }

  Row reviewTitle() {
    return Row(
      children: const [
        SizedBox(
          width: 16,
        ),
        DivisionText(text: '유저들의 생생한 리뷰'),
      ],
    );
  }
}

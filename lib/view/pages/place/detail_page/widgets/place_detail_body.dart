import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/view/pages/place/detail_page/place_detail_page_view_model.dart';
import 'package:village/view/pages/place/detail_page/widgets/appbar_widgets/place_info.dart';
import 'package:village/view/pages/place/detail_page/widgets/appbar_widgets/place_sliver_appbar.dart';
import 'package:village/view/pages/place/detail_page/widgets/appbar_widgets/place_tabbar.dart';
import 'package:village/view/pages/place/detail_page/widgets/place_botton_button.dart';
import 'package:village/view/pages/place/detail_page/widgets/place_facilies.dart';
import 'package:village/view/pages/place/detail_page/widgets/place_guide.dart';
import 'package:village/view/pages/place/detail_page/widgets/place_introduction.dart';
import 'package:village/view/pages/place/detail_page/widgets/place_map.dart';
import 'package:village/view/pages/place/detail_page/widgets/place_notice.dart';
import 'package:village/view/pages/place/detail_page/widgets/place_recomend.dart';
import 'package:village/view/pages/place/detail_page/widgets/place_refund_policy.dart';
import 'package:village/view/pages/place/detail_page/widgets/place_review_list.dart';

List<GlobalKey> indexKeyList = List.generate(9, (index) => GlobalKey());

class PlaceDetailBody extends ConsumerWidget {
  PlaceDetailBody({
    super.key,
  });
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.read(placeDetailPageProvider.notifier);
    final pm = ref.watch(placeDetailPageProvider);
    List<Widget> widgetList = [
      const PlaceIntroduction(),
      const SizedBox(
        height: 5,
      ),
      const PlaceGuide(),
      const SizedBox(
        height: 5,
      ),
      const PlaceFacilties(),
      const SizedBox(
        height: 5,
      ),
      const PlaceMap(),
      const SizedBox(
        height: 5,
      ),
      const PlaceNotice(),
      const SizedBox(
        height: 5,
      ),
      const PlaceRefundPolicy(),
      const PlaceReviewList(),
      const PlaceRecomend(),
      const SizedBox(
        height: 50,
      ),
    ];

    var scrollController1 = ScrollController();
    scrollController1.addListener(() {
      if (scrollController1.position.pixels > 180) {
        vm.changeScrolled(true);
      }
      if (scrollController1.position.pixels <= 180) {
        vm.changeScrolled(false);
      }
    });
    return Stack(
      children: [
        NestedScrollView(
          controller: scrollController1,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              pm.isscrolled
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
                    PlaceInfo(pm: pm),
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
                child: ListView.builder(
                  // controller: scrollController1,
                  itemCount: widgetList.length,
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.all(1),
                    color: Colors.grey.shade200,
                    width: double.infinity,
                    child: Column(
                      // 위젯 리스트 위에 있습니다.
                      children: [widgetList[index]],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Positioned(
          bottom: 0,
          child: PlaceCustomBottomButton(),
        ),
      ],
    );
  }
}

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

List<GlobalKey> indexKeyList = List.generate(9, (index) => GlobalKey());

// double calculateHeight(int index) {
//   double totalHeight = 0;
//   for (int i = 0; i <= index; i++) {
//     final BuildContext? context = indexKeyList[i].currentContext;
//     if (context != null) {
//       final RenderBox renderBox = context.findRenderObject() as RenderBox;
//       final double widgetHeight = renderBox.size.height;
//       totalHeight += widgetHeight;
//     }
//   }
//   return totalHeight;
// }

// void _scrollToIndex(BuildContext context, int index) {
//   final RenderObject? renderObject =
//       indexKeyList[index].currentContext?.findRenderObject();
//   if (renderObject != null) {
//     Scrollable.ensureVisible(
//       context,
//       alignment: 0.5,
//       duration: const Duration(seconds: 1),
//     );
//   }
// }

class PlaceDetailBody extends ConsumerWidget {
  PlaceDetailBody({
    super.key,
  });
  final ScrollController _scrollController = ScrollController();

  List<Widget> widgetList = [
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
      key: indexKeyList[6],
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
      height: 50,
    ),
  ];

  // final ItemScrollController itemScrollController = ItemScrollController();
  // final ItemPositionsListener itemPositionsListener =
  //     ItemPositionsListener.create();
  // final scrollDuration = const Duration(milliseconds: 500);
  // double alignment = 0;

  // void scrollTo(int index) => itemScrollController.scrollTo(
  //     index: index,
  //     duration: scrollDuration,
  //     curve: Curves.easeInOutCubic,
  //     alignment: alignment);

  // Widget list() => ScrollablePositionedList.builder(
  //       itemCount: widgetList.length,
  //       itemBuilder: (context, index) => widgetList[index],
  //       itemScrollController: itemScrollController,
  //       itemPositionsListener: itemPositionsListener,
  //       // scrollDirection: orientation == Orientation.portrait
  //       //     ? Axis.vertical
  //       //     : Axis.horizontal,
  //     );
  // void scrollToIndex(double index) {
  //   const double itemHeight = 50.0;
  //   _scrollController.animateTo(
  //     index * itemHeight,
  //     duration: const Duration(milliseconds: 300),
  //     curve: Curves.easeInOut,
  //   );
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PlaceDetailPageViewModel vm = ref.watch(placeDetailPageProvider.notifier);
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
              ref.watch(placeDetailPageProvider).isscrolled
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

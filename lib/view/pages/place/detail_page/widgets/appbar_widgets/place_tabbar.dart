import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/core/constants/style.dart';

import 'package:village/view/pages/place/detail_page/place_detail_page_view_model.dart';

class PlaceTabbar extends ConsumerWidget {
  const PlaceTabbar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PlaceDetailPageViewModel? pm = ref.read(placeDetailPageProvider.notifier);
    return SliverPersistentHeader(
      pinned: true,
      floating: false,
      delegate: MySliverPersistentHeaderDelegate(
        minHeight: 50.0,
        maxHeight: 50.0,
        child: Container(
          color: Colors.white,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    // double totalHeight = calculateHeight(1);
                    // scrollToIndex(totalHeight);
                  },
                  child: const Text(
                    "공간소개",
                    style: mblack_text,
                  ),
                ),
                GestureDetector(
                  // onTap: ,
                  child: const Text(
                    "이용안내",
                    style: mblack_text,
                  ),
                ),
                GestureDetector(
                  // onTap: ,
                  child: const Text(
                    "공간위치",
                    style: mblack_text,
                  ),
                ),
                GestureDetector(
                  // onTap: ,
                  child: const Text(
                    "리뷰",
                    style: mblack_text,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  MySliverPersistentHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight; // 스크롤 내려서 가장 위로 올라갔을때 최대로 늘어나는 길이

  @override
  double get minExtent => minHeight; // 최소크기 / pinned: true 일때만 유효

  @override
  bool shouldRebuild(covariant MySliverPersistentHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

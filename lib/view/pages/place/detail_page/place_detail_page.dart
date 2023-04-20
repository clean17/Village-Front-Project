import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/view/pages/place/detail_page/widgets/place_detail_body.dart';
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
    return Scaffold(
      // extendBodyBehindAppBar: true,
      // backgroundColor: Colors.transparent,
      appBar: placeAppbar(),
      body: const PlaceDetailBody(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/view/widgets/place/place_info.dart';

class PlaceDetailPage extends StatefulWidget {
  PlaceDetailPage({super.key});

  final ScrollController _scrollController = ScrollController();
  final bool _isAppBarPinned = false;

  // 스크롤이 내려오면 상단 앱바 고정 + 색깔 바꾸는 코드로 바꿔야함
  // 슬리버 앱바를 없애고 다시 그려야 하는데...
  // late ScrollController _scrollController;
  final bool _isAppBarTransparent = true;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

  // @override
  // void initState() {
  //   _scrollController.addListener(_onScroll);
  // }

  // @override
  // void dispose() {
  //   _scrollController.dispose();
  // }

  // void _onScroll() {
  //   if (_scrollController.offset >= 200 && !_isAppBarPinned) {
  //     setState(() {
  //       _isAppBarPinned = true;
  //     });
  //   } else if (_scrollController.offset < 200 && _isAppBarPinned) {
  //     setState(() {
  //       _isAppBarPinned = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      // appBar: placeAppbar(),
      body: NestedScrollView(
        body: _fourBuild(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new),
                onPressed: () {},
                color: Colors.black,
              ),
              actions: const [
                Icon(Icons.link),
                SizedBox(
                  width: 20,
                ),
                Icon(Icons.security_sharp),
                SizedBox(
                  width: 15,
                ),
              ],
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              pinned: true,
              expandedHeight: 250.0,
              flexibleSpace: FlexibleSpaceBar(
                background: PageView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Image.network(
                      "https://picsum.photos/id/${index + 1}/200/300",
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  placeInfo()
                  // Expanded(child: ProfileTap()),
                ],
              ),
            ),
            // SliverPersistentHeader(
            //   pinned: true,
            //   floating: false,
            //   delegate: MySliverPersistentHeaderDelegate(
            //     minHeight: 50.0,
            //     maxHeight: 50.0,
            //     child: Container(
            //       color: Colors.white,
            //       child: const Center(
            //         child: Text(
            //           '앵커',
            //           style: TextStyle(color: Colors.black, fontSize: 20),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ];
        },
      ),
    );
  }

  Widget _fourBuild() {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text("앵커1"),
              Text("앵커2"),
              Text("앵커3"),
            ],
          ),
        ),
        Expanded(
          child: GridView.builder(
              itemCount: 42,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
              itemBuilder: (context, index) {
                // print("실행 : ${index+1}"); // 이걸로 확인해보면 캐싱을 설정하지 않아서 뷰홀더에 15장만 다운받음
                // 캐싱을 사용하지 않아서 15장을 초과하는 순서는 버리고 다시 다운받는 행위를 반복함
                // return Image.network("http://picsum.photos/id/${index+1}/200/200");
                return Image.network(
                  "https://picsum.photos/id/${index + 1}/200/300",
                  fit: BoxFit.cover,
                );
              }),
        ),
      ],
    );
  }
}

// class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
//   MySliverPersistentHeaderDelegate({
//     required this.minHeight,
//     required this.maxHeight,
//     required this.child,
//   });

//   final double minHeight;
//   final double maxHeight;
//   final Widget child;

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return SizedBox.expand(child: child);
//   }

//   @override
//   double get maxExtent => maxHeight; // 스크롤 내려서 가장 위로 올라갔을때 최대로 늘어나는 길이

//   @override
//   double get minExtent => minHeight; // 최소크기 / pinned: true 일때만 유효

//   @override
//   bool shouldRebuild(covariant MySliverPersistentHeaderDelegate oldDelegate) {
//     return maxHeight != oldDelegate.maxHeight ||
//         minHeight != oldDelegate.minHeight ||
//         child != oldDelegate.child;
//   }
// }



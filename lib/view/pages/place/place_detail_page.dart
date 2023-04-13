import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlaceDetailPage extends ConsumerWidget {
  const PlaceDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {},
          color: Colors.white,
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
      ),
      body: NestedScrollView(
        // 리스트 안에 동적인 리스트가 있을때 사용
        body: _fourBuild(), // 동적인 리스트
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 250,
              flexibleSpace: FlexibleSpaceBar(
                background: Scaffold(
                  extendBodyBehindAppBar: true,
                  body: PageView.builder(
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
            ),
          ];
        },
      ),
    );
  }

  Widget _fourBuild() {
    return Container(
      child: Column(children: [
        Row(
          children: const [Text("마포구"), Text("촬영스튜디오")],
        ),
        const Text("스튜디오 르온드"),
        Row(children: const [
          Icon(Icons.star),
          Text("5.0"),
          Text("위치보기"),
        ]),
      ]),
    );
  }
}

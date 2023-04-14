import 'package:flutter/material.dart%20';

class MyDd extends StatelessWidget {
  const MyDd({Key? key}) : super(key: key);

  @override
  Widget firstbuild(BuildContext context) {
    return Scaffold(
        body: Stack(
      // 스택을 먼저 선언
      children: [
        buildPageView(),
        buildPositioned(),
      ],
    ));
  }

  PageView buildPageView() {
    // 그림을 바닥에 깔고
    return PageView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Image.network(
          "https://picsum.photos/id/${index + 1}/200/300",
          fit: BoxFit.cover,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

Positioned buildPositioned() {
  // 앱바를 위로 띄움
  return Positioned(
    top: 0,
    left: 0,
    right: 0,
    child: AppBar(
      backgroundColor: Colors.transparent, // AppBar 배경 투명하게
      title: const Text("Around"),
      leading: const Icon(Icons.menu),
      elevation: 0, // 그림자 효과, 0 이면 제거
    ),
  );
}

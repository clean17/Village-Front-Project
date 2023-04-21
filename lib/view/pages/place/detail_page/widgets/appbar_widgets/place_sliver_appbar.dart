import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlaceSliverAppbar extends StatelessWidget {
  const PlaceSliverAppbar(
      {super.key,
      this.appbarColor = Colors.white,
      this.statusbarColor = Brightness.light});
  final statusbarColor;
  final appbarColor;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new),
        onPressed: () {},
        color: appbarColor,
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
      systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
        // statusBarBrightness: Brightness.light,
        statusBarIconBrightness: statusbarColor, // 최상단
      ),
      backgroundColor: Colors.white,
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
    );
  }
}

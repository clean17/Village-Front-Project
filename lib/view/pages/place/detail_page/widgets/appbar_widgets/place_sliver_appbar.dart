import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:village/view/widgets/custom_book_mark_icon.dart';
import 'package:village/view/widgets/custom_link_icon.dart';

class PlaceSliverAppbar extends StatelessWidget {
  const PlaceSliverAppbar(
      {super.key,
      this.appbarColor = Colors.white,
      this.statusbarColor = Brightness.light,
      this.actionColor = Colors.white});
  final statusbarColor;
  final appbarColor;
  final actionColor;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new),
        onPressed: () {},
        color: appbarColor,
      ),
      actions: [
        CustomLinkIcon(color: actionColor),
        const SizedBox(
          width: 20,
        ),
        CustomBookMarkIcon(
          color: actionColor,
          size: 26,
        ),
        const SizedBox(
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

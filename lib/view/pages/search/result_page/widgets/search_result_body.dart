import 'package:flutter/material.dart';
import 'package:village/core/constants/color.dart';
import 'package:village/core/constants/move.dart';
import 'package:village/core/constants/style.dart';
import 'package:village/view/pages/main/home_page/widgets/place_container.dart';
import 'package:village/view/widgets/custom_text_button.dart';

class SearchResultBody extends StatelessWidget {
  const SearchResultBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          // pinned: true,
          snap: true,
          floating: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: const Text(
            textAlign: TextAlign.left,
            "7건 검색 결과",
            style: mblack_text,
          ),
          leadingWidth: 15,
          actions: [
            CustomTextButton(
              color: kPrimaryColor,
              text: '필터링',
              funPress: () {
                Navigator.pushNamed(context, Move.searchFilterPage);
              },
            ),
          ],
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, Move.placeDetailPage),
                    child: const PlaceContainer()),
              );
            },
            childCount: 5,
          ),
        )
      ],
    );
  }
}

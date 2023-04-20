import 'package:flutter/material.dart';
import 'package:village/core/constants/color.dart';
import 'package:village/core/constants/move.dart';
import 'package:village/view/pages/main/home_page/widgets/place_container.dart';
import 'package:village/view/widgets/custom_text_button.dart';

class PlaceCategoryBody extends StatelessWidget {
  const PlaceCategoryBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          snap: true,
          floating: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          actions: [
            CustomTextButton(
              color: kPrimaryColor,
              text: '지역검색',
              funPress: () {
                Navigator.pushNamed(context, Move.searchFilterPage);
              },
            ),
            CustomTextButton(
              color: kPrimaryColor,
              text: '필터링',
              funPress: () {
                Navigator.pushNamed(context, Move.searchFilterPage);
              },
            ),
          ],
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return const Card(
                child: PlaceContainer(),
              );
            },
            childCount: 20,
          ),
        ),
      ],
    );
  }
}

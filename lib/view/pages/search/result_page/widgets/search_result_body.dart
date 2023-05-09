import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/controller/place_controller.dart';
import 'package:village/core/constants/color.dart';
import 'package:village/core/constants/style.dart';
import 'package:village/view/pages/main/home_page/widgets/place_container.dart';
import 'package:village/view/pages/search/filter_page/search_filter_page.dart';
import 'package:village/view/widgets/custom_text_button.dart';

class SearchResultBody extends ConsumerWidget {
  const SearchResultBody({
    super.key,
    required this.pm,
  });

  final pm;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          snap: true,
          floating: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            textAlign: TextAlign.left,
            "   ${pm?.searchList?.length ?? 0}건 검색 결과",
            style: mblack_text,
          ),
          leadingWidth: 15,
          actions: [
            CustomTextButton(
              color: kPrimaryColor,
              text: '필터링',
              funPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchFilterPage(
                              num: 1,
                            )));
              },
            ),
          ],
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                    onTap: () => ref
                        .read(placeControllerProvider)
                        .detail(pm!.searchList?[index].id ?? 1),
                    child: PlaceContainer(place: pm?.searchList?[index] ?? 0)),
              );
            },
            childCount: pm?.searchList?.length ?? 0,
          ),
        )
      ],
    );
  }
}

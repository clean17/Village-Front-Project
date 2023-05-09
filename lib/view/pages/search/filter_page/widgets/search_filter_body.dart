import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/controller/search_controller.dart';
import 'package:village/core/constants/color.dart';
import 'package:village/core/constants/style.dart';
import 'package:village/view/pages/search/result_page/search_result_page_view_model.dart';
import 'package:village/view/widgets/custom_bottom_button.dart';

enum StringFiilter { highCost, lowCost, highRate }

class SearchFilterBody extends ConsumerStatefulWidget {
  const SearchFilterBody({super.key, required this.num});

  final num;
  @override
  ConsumerState<SearchFilterBody> createState() => _SearchFilterBodyState();
}

class _SearchFilterBodyState extends ConsumerState<SearchFilterBody> {
  StringFiilter _StringFiilter = StringFiilter.highCost;

  @override
  Widget build(BuildContext context) {
    final vm = ref.read(searchResultPageProvider.notifier);
    final pm = ref.watch(searchResultPageProvider);
    return Column(children: [
      Container(
        margin: const EdgeInsets.only(left: 25, bottom: 10, top: 10),
        alignment: Alignment.centerLeft,
        child: const Text(
          '정렬',
          style: mlarge_black_text,
        ),
      ),
      RadioListTile(
        title: const Text("높은 가격순"),
        activeColor: kPrimaryColor,
        value: StringFiilter.highCost,
        groupValue: _StringFiilter,
        onChanged: (StringFiilter? value) {
          setState(() {
            _StringFiilter = value!;
            vm.notifyFilter(0);
          });
        },
      ),
      RadioListTile(
        title: const Text("낮은 가격순"),
        activeColor: kPrimaryColor,
        value: StringFiilter.lowCost,
        groupValue: _StringFiilter,
        onChanged: (StringFiilter? value) {
          setState(() {
            _StringFiilter = value!;
            vm.notifyFilter(1);
          });
        },
      ),
      RadioListTile(
        title: const Text("리뷰평점순"),
        activeColor: kPrimaryColor,
        value: StringFiilter.highRate,
        groupValue: _StringFiilter,
        onChanged: (StringFiilter? value) {
          setState(() {
            _StringFiilter = value!;
            vm.notifyFilter(2);
          });
        },
      ),
      const Spacer(),
      CustomBottomButton(
          mWeith: double.infinity,
          text: '결과보기',
          funPress: () {
            String category = pm?.keyword ?? "";
            int num = pm?.filterNum ?? 0;
            num == 0
                ? ref
                    .read(searchControllerProvider)
                    .searchCategoryFiltering(category, num)
                : ref
                    .read(searchControllerProvider)
                    .searchKeywordFiltering(category, num);
          }),
    ]);
  }
}

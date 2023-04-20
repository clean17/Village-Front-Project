import 'package:flutter/material.dart';
import 'package:village/core/constants/color.dart';
import 'package:village/core/constants/style.dart';
import 'package:village/view/widgets/bottom_button.dart';

enum StringFiilter { highCost, lowCost, highRate }

class SearchFilterBody extends StatefulWidget {
  const SearchFilterBody({super.key});

  @override
  State<SearchFilterBody> createState() => _SearchFilterBodyState();
}

class _SearchFilterBodyState extends State<SearchFilterBody> {
  StringFiilter _StringFiilter = StringFiilter.highCost;

  @override
  Widget build(BuildContext context) {
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
          });
        },
      ),
      const Spacer(),
      const BottomButton(mWeith: double.infinity, text: '7건 결과보기'),
    ]);
  }
}

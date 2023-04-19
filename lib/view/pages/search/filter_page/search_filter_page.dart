import 'package:flutter/material.dart';
import 'package:village/core/constants/color.dart';
import 'package:village/core/constants/style.dart';
import 'package:village/view/widgets/bottom_button.dart';
import 'package:village/view/widgets/simple_close_appbar.dart';

class SearchFilterPage extends StatefulWidget {
  const SearchFilterPage({super.key});

  @override
  State<SearchFilterPage> createState() => _SearchFilterPageState();
}

enum StringFiilter { highCost, lowCost, highRate }

class _SearchFilterPageState extends State<SearchFilterPage> {
  StringFiilter _StringFiilter = StringFiilter.highCost; // 라디오 버튼의 선택 초기화

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleCloseAppbar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
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
        ]),
      ),
    );
  }
}

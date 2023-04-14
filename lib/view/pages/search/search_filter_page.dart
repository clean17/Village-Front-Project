import 'package:flutter/material.dart';
import 'package:village/core/color.dart';
import 'package:village/core/style.dart';
import 'package:village/view/widgets/bottom_button.dart';
import 'package:village/view/widgets/simple_close_appbar.dart';

class SearchFilterPage extends StatefulWidget {
  const SearchFilterPage({super.key});

  @override
  State<SearchFilterPage> createState() => _SearchFilterPageState();
}

enum String { highCost, lowCost, highRate }

class _SearchFilterPageState extends State<SearchFilterPage> {
  String _string = String.highCost; // 라디오 버튼의 선택 초기화

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
            value: String.highCost,
            groupValue: _string,
            onChanged: (String? value) {
              setState(() {
                _string = value!;
              });
            },
          ),
          RadioListTile(
            title: const Text("낮은 가격순"),
            activeColor: kPrimaryColor,
            value: String.lowCost,
            groupValue: _string,
            onChanged: (String? value) {
              setState(() {
                _string = value!;
              });
            },
          ),
          RadioListTile(
            title: const Text("리뷰평점순"),
            activeColor: kPrimaryColor,
            value: String.highRate,
            groupValue: _string,
            onChanged: (String? value) {
              setState(() {
                _string = value!;
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

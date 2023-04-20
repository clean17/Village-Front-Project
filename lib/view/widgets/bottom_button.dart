import 'package:flutter/material.dart';
import 'package:village/core/constants/color.dart';
import 'package:village/view/pages/search/result_page/search_result_page.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key,
    required this.mWeith,
    required this.text,
  });

  final double mWeith;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor, minimumSize: Size(mWeith * 0.8, 40)),
      onPressed: () {
        Navigator.pop(context);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const SearchResultPage()),
        );
      },
      child: Text(
        text,
        style: const TextStyle(),
      ),
    );
  }
}

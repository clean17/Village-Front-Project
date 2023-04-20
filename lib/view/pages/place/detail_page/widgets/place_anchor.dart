import 'package:flutter/material.dart';

class PlaceAnchor extends StatelessWidget {
  const PlaceAnchor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Text(
            "공간소개",
            style: TextStyle(fontSize: 16),
          ),
          Text(
            "이용안내",
            style: TextStyle(fontSize: 16),
          ),
          Text(
            "공간위치",
            style: TextStyle(fontSize: 16),
          ),
          Text(
            "리뷰",
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

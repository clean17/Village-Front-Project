import 'package:flutter/material.dart';
import 'package:village/core/constants/style.dart';

class PlaceInfoCategory extends StatelessWidget {
  var style;
  double height;

  PlaceInfoCategory({
    super.key,
    this.style = mgrey_text,
    this.height = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "마포구",
          style: style,
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 1,
              height: height,
              color: Colors.black54,
            ),
          ),
        ),
        Text(
          "촬영스튜디오, 렌탈스튜디오",
          style: style,
        ),
      ],
    );
  }
}

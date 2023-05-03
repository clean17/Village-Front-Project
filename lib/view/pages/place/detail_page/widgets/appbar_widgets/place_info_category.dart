import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/core/constants/style.dart';

class PlaceInfoCategory extends ConsumerWidget {
  var style;
  double height;
  final pm;

  PlaceInfoCategory({
    super.key,
    this.style = mgrey_text,
    this.height = 16,
    required this.pm,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Text(
          pm.place?.address.sigungu ?? ' ',
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
          pm.place?.categoryName ?? '카테고리 네임을 api 필요',
          style: style,
        ),
      ],
    );
  }
}

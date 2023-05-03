import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/core/constants/style.dart';
import 'package:village/view/pages/place/detail_page/place_detail_page_view_model.dart';

class DivisionText extends ConsumerWidget {
  const DivisionText({
    super.key,
    required this.text,
  });
  final text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PlaceDetailPageModel pm = ref.watch(placeDetailPageProvider);
    return Column(
      children: [
        Text(
          text,
          style: mlarge_black_text,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

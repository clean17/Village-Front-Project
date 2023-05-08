import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/core/constants/style.dart';

class DivisionText extends ConsumerWidget {
  const DivisionText({
    super.key,
    required this.text,
  });
  final text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

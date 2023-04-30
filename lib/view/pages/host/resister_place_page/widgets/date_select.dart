import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/core/constants/size.dart';
import 'package:village/view/pages/host/resister_place_page/widgets/day_widget.dart';

class DateSelect extends ConsumerWidget {
  const DateSelect({
    super.key,
    required this.vm,
    required this.dayOfWeek,
  });

  final dayOfWeek;
  final vm;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double dayWeith = getScreenWidth(context) * 0.11;
    final double dayWeith2 = getScreenWidth(context) * 0.277;
    final double dayHeight = getScreenHeight(context) * 0.1;
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            DayWidget(
              dayWeith: dayWeith,
              dayHeight: dayHeight,
              dayOfWeek: dayOfWeek,
              vm: vm,
              text: '일',
            ),
            DayWidget(
              dayWeith: dayWeith,
              dayHeight: dayHeight,
              dayOfWeek: dayOfWeek,
              vm: vm,
              text: '월',
            ),
            DayWidget(
              dayWeith: dayWeith,
              dayHeight: dayHeight,
              dayOfWeek: dayOfWeek,
              vm: vm,
              text: '화',
            ),
            DayWidget(
              dayWeith: dayWeith,
              dayHeight: dayHeight,
              dayOfWeek: dayOfWeek,
              vm: vm,
              text: '수',
            ),
            DayWidget(
              dayWeith: dayWeith,
              dayHeight: dayHeight,
              dayOfWeek: dayOfWeek,
              vm: vm,
              text: '목',
            ),
            DayWidget(
              dayWeith: dayWeith,
              dayHeight: dayHeight,
              dayOfWeek: dayOfWeek,
              vm: vm,
              text: '금',
            ),
            DayWidget(
              dayWeith: dayWeith,
              dayHeight: dayHeight,
              dayOfWeek: dayOfWeek,
              vm: vm,
              text: '토',
            ),
          ],
        ),
      ],
    );
  }
}

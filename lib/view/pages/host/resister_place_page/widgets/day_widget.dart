import 'package:flutter/material.dart';
import 'package:village/core/constants/color.dart';
import 'package:village/dto/place_request.dart';

class DayWidget extends StatelessWidget {
  const DayWidget({
    super.key,
    required this.dayWeith,
    required this.dayHeight,
    required this.dayOfWeek,
    required this.vm,
    required this.text,
  });

  final double dayWeith;
  final double dayHeight;
  final dayOfWeek;
  final vm;
  final text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: dayWeith,
      height: dayHeight,
      margin: const EdgeInsets.symmetric(horizontal: 3),
      child: ElevatedButton(
        onPressed: () {
          if (dayOfWeek.any((e) => e.dayOfWeekName == text)) {
            dayOfWeek.removeWhere((e) => (e.dayOfWeekName == text));
            vm.notifyChangeDayOfWeek(dayOfWeek);
          } else {
            DayOfWeekReqDTO dowDTO = DayOfWeekReqDTO(dayOfWeekName: text);
            dayOfWeek.add(dowDTO);
            vm.notifyChangeDayOfWeek(dayOfWeek);
          }
        },
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: dayOfWeek.any((e) => e.dayOfWeekName == text)
                ? kAccentColor
                : Colors.grey[400]),
        child: Text(text),
      ),
    );
  }
}

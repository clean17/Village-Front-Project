import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/core/constants/color.dart';
import 'package:village/provider/picker_provier.dart';

class ReservationEndPicker extends ConsumerWidget {
  const ReservationEndPicker({
    super.key,
    required this.text,
    required this.funtion,
  });

  final String text;
  final funtion;

  void _showDialog(Widget child, context) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 216,
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              color: CupertinoColors.systemBackground.resolveFrom(context),
              child: SafeArea(
                top: false,
                child: child,
              ),
            ));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PickerModel? pickermodel = ref.watch(pickerProvider);
    DateTime endTime = pickermodel?.endTime ?? DateTime(2016, 5, 10, 05, 20);
    return CupertinoPageScaffold(
      backgroundColor: Colors.white,
      child: DefaultTextStyle(
        style: TextStyle(
          color: CupertinoColors.label.resolveFrom(context),
          fontSize: 16.0,
        ),
        child: Row(
          children: [
            Text(text),
            CupertinoButton(
              onPressed: () => _showDialog(
                CupertinoDatePicker(
                  initialDateTime: endTime,
                  mode: CupertinoDatePickerMode.time,
                  use24hFormat: true,
                  minuteInterval: 10, // 10분 단위로 설정
                  onDateTimeChanged: (DateTime newTime) {
                    funtion(newTime);
                  },
                ),
                context,
              ),
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kPickColor,
                ),
                child: Text(
                  '${endTime.hour}:${endTime.minute.toString().padLeft(2, '0')}',
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

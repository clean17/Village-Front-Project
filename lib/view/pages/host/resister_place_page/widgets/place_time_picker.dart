import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:village/core/constants/color.dart';

class PlaceTimePicker extends StatefulWidget {
  const PlaceTimePicker({super.key, required this.text});

  final String text;

  @override
  State<PlaceTimePicker> createState() => _PlaceTimePickerState();
}

class _PlaceTimePickerState extends State<PlaceTimePicker> {
  late String text;
  @override
  void initState() {
    text = widget.text;
    super.initState();
  }

  DateTime time = DateTime(2016, 5, 10, 22, 35);
  void _showDialog(Widget child) {
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
  Widget build(BuildContext context) {
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
                  initialDateTime: time,
                  mode: CupertinoDatePickerMode.time,
                  use24hFormat: true,
                  onDateTimeChanged: (DateTime newTime) {
                    setState(() => time = newTime);
                  },
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kPickColor,
                ),
                child: Text(
                  '${time.hour}:${time.minute}',
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

// This class simply decorates a row of widgets.

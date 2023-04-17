import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  // This function displays a CupertinoModalPopup with a reasonable fixed height
  // which hosts CupertinoDatePicker.
  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 216,
              padding: const EdgeInsets.only(top: 6.0),
              // The Bottom margin is provided to align the popup above the system
              // navigation bar.
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              // Provide a background color for the popup.
              color: CupertinoColors.systemBackground.resolveFrom(context),
              // Use a SafeArea widget to avoid system overlaps.
              child: SafeArea(
                top: false,
                child: child,
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: DefaultTextStyle(
        style: TextStyle(
          color: CupertinoColors.label.resolveFrom(context),
          fontSize: 18.0,
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
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: Colors.black38)),
                child: Text(
                  '${time.hour}:${time.minute}',
                  style: const TextStyle(
                    fontSize: 20.0,
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

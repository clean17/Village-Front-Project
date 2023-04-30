import 'package:flutter/cupertino.dart';
import 'package:village/core/constants/color.dart';

const double _kItemExtent = 32.0;
List<String> stringList = List.generate(50, (index) => (index + 1).toString());

class PeoplePicker extends StatefulWidget {
  const PeoplePicker({super.key, required this.text});
  final text;

  @override
  State<PeoplePicker> createState() => _PeoplePickerState();
}

class _PeoplePickerState extends State<PeoplePicker> {
  int _selectedFruit = 0;

  // This shows a CupertinoModalPopup with a reasonable fixed height which hosts CupertinoPicker.
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
    return DefaultTextStyle(
      style: TextStyle(
        color: CupertinoColors.label.resolveFrom(context),
        fontSize: 16.0,
      ),
      child: Row(
        children: [
          Text(widget.text),
          const SizedBox(
            width: 10,
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            // Display a CupertinoPicker with list of fruits.
            onPressed: () => _showDialog(
              CupertinoPicker(
                magnification: 1.22,
                squeeze: 1.2,
                useMagnifier: true,
                itemExtent: _kItemExtent,
                // This is called when selected item is changed.
                onSelectedItemChanged: (int selectedItem) {
                  setState(() {
                    _selectedFruit = selectedItem;
                  });
                },
                children: List<Widget>.generate(stringList.length, (int index) {
                  return Center(
                    child: Text(
                      stringList[index],
                    ),
                  );
                }),
              ),
            ),
            // This displays the selected fruit name.
            child: Container(
              width: 30,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kPickColor,
              ),
              child: Center(
                child: Text(
                  stringList[_selectedFruit],
                  style: const TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

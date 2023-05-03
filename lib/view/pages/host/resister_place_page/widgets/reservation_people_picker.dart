import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/core/constants/color.dart';
import 'package:village/provider/picker_provier.dart';

const double _kItemExtent = 32.0;
List<String> stringList = List.generate(30, (index) => (index + 1).toString());

class ReservationPeoplePicker extends ConsumerWidget {
  const ReservationPeoplePicker({
    super.key,
    required this.text,
    required this.funtion,
  });
  final funtion;
  final text;

  // int _selectedNum = 0;

  // This shows a CupertinoModalPopup with a reasonable fixed height which hosts CupertinoPicker.
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
    int maxPeopole2 = pickermodel?.maxPeople ?? 0;
    return DefaultTextStyle(
      style: TextStyle(
        color: CupertinoColors.label.resolveFrom(context),
        fontSize: 16.0,
      ),
      child: Row(
        children: [
          Text(text),
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
                    funtion(selectedItem + 1);
                  },
                  children:
                      List<Widget>.generate(stringList.length, (int index) {
                    return Center(
                      child: Text(
                        stringList[index],
                      ),
                    );
                  }),
                ),
                context),
            // This displays the selected fruit name.
            child: Container(
              width: 40,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kPickColor,
              ),
              child: Center(
                child: Text(
                  maxPeopole2.toString(),
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

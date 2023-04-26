import 'package:flutter/material.dart';

class PlaceDatePicker extends StatefulWidget {
  PlaceDatePicker({super.key, this.restorationId});

  final String? restorationId;
  late DateTime input;

  @override
  State<PlaceDatePicker> createState() => _PlaceDatePickerState();
}

/// RestorationProperty objects can be used because of RestorationMixin.
class _PlaceDatePickerState extends State<PlaceDatePicker>
    with RestorationMixin {
  // In this example, the restoration ID for the mixin is passed in through
  // the [StatefulWidget]'s constructor.
  @override
  String? get restorationId => widget.restorationId;

  final RestorableDateTime _selectedDate = RestorableDateTime(DateTime.now());
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(2021),
          lastDate: DateTime(2024),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        widget.input = newSelectedDate;
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //   content: Text(
        //       'Selected: ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}'),
        // ));
      });
      // Consumer(
      //   builder: (context, ref, child) {
      //     PlaceDetailPageViewModel vm =
      //         ref.read(placeDetailPageProvider.notifier);
      //     vm.reservationDate(newSelectedDate);
      //     PlaceDetailPageModel pm = ref.watch(placeDetailPageProvider);
      //     return pm != null
      //         ? DateFormat('MM/dd/yyyy').format(pm.resevasionDate.toString())
      //         : null;
      //   },
      // );
    }
  }

  //
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        _restorableDatePickerRouteFuture.present();
      },
      child: const Text('날짜 선택'),
    );
  }
}

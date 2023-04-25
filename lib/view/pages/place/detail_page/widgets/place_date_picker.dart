import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:village/view/pages/place/detail_page/place_detail_page_view_model.dart';

class PlaceDatePicker extends StatefulWidget {
  PlaceDatePicker({super.key, this.restorationId});

  final String? restorationId;
  DateTime input = DateTime.now();
  String formatString = DateFormat('yyyy-MM-dd').format(DateTime.now());

  @override
  State<PlaceDatePicker> createState() => _PlaceDatePickerState();
}

class _PlaceDatePickerState extends State<PlaceDatePicker>
    with RestorationMixin {
  @override
  String? get restorationId => widget.restorationId;

  // 오늘 날짜 선택되어 있음
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

  // 달력 생성
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

  // 선택했던 날짜
  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  // 날짜 선택
  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        widget.input = newSelectedDate;
        widget.formatString = DateFormat('yyyy-MM-dd').format(widget.input);
      });
      final myWidget = MyWidget(widget.formatString);
      Builder(builder: (context) => myWidget);
    }
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {
          _restorableDatePickerRouteFuture.present();
        },
        child: Row(
          children: [
            Text(widget.formatString),
            MyWidget(widget.formatString),
          ],
        ));
  }
}

class MyWidget extends ConsumerWidget {
  final String text;
  late WidgetRef ref;

  MyWidget(this.text, {super.key});

  // @override
  // Widget build(BuildContext context, WidgetRef ref) {
  //   PlaceDetailPageViewModel vm = ref.read(placeDetailPageProvider.notifier);
  //   vm.reservationDate(text);
  //   Logger().d('변경 1 ');
  //   return const SizedBox.shrink();
  // }
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    this.ref = ref;
    return const SizedBox.shrink();
  }

  @override
  void didChangeDependencies(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Logger().d('reservationDate 호출됨');
      final vm = ref.read(placeDetailPageProvider.notifier);
      vm.reservationDate(text);
    });
  }
}

import 'package:flutter/material.dart';
import 'package:village/core/constants/style.dart';
import 'package:village/model/facility/facility.dart';

class FacilityTable extends StatefulWidget {
  const FacilityTable({super.key});

  @override
  State<FacilityTable> createState() => _FacilityTableState();
}

class _FacilityTableState extends State<FacilityTable> {
  static List<String> facilities = ['화장실', '편의시설 추가', '주차장'];
  static int numItems = facilities.length;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);

  bool favorite = false;
  final List<String> _filters = <String>[];

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Theme(
      data: ThemeData(
        colorSchemeSeed: const Color(0xff6750a4),
        useMaterial3: true,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Align(
                alignment: Alignment.centerLeft,
                child: Text('편의 시설을 선택하세요', style: mblack_text)),
            const SizedBox(height: 5.0),
            Wrap(
              spacing: 5.0,
              children: Facility.values.map((Facility exercise) {
                return FilterChip(
                  label: Text(exercise.name),
                  selected: _filters.contains(exercise.name),
                  onSelected: (bool value) {
                    setState(() {
                      if (value) {
                        if (!_filters.contains(exercise.name)) {
                          _filters.add(exercise.name);
                        }
                      } else {
                        _filters.removeWhere((String name) {
                          return name == exercise.name;
                        });
                      }
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}

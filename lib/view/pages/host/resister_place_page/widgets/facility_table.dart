import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/core/constants/style.dart';
import 'package:village/dto/place_request.dart';
import 'package:village/model/facility/facility.dart';

class FacilityTable extends ConsumerWidget {
  FacilityTable({
    super.key,
    required this.vm,
    required this.facility,
  });

  final vm;
  final facility;

  final List<String> _filters = <String>[];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    for (var element in facility) {
      _filters.add(element.facilityName);
    }
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
            const Text('편의 시설을 선택하세요', style: mblack_text),
            const SizedBox(height: 5.0),
            Wrap(
              spacing: 5.0,
              // Facility - enum 으로 정리
              children: Facility.values.map((Facility exercise) {
                return FilterChip(
                  label: Text(exercise.name),
                  // true , false로 불 들어옴
                  selected: _filters.contains(exercise.name),
                  // selected -> true, false -> onSelected 콜백
                  onSelected: (bool value) {
                    FacilityInfoReqDTO fDTO;
                    if (value) {
                      // 선택된다면
                      if (!_filters.contains(exercise.name)) {
                        _filters.add(exercise.name);
                        fDTO = FacilityInfoReqDTO(facilityName: exercise.name);
                        facility.add(fDTO);
                        vm.notifyChangeFacility(facility!);
                      }
                    } else {
                      // 선택 해제 된다면 해당 이름만 제거
                      _filters.removeWhere((String name) {
                        return name == exercise.name;
                      });
                      facility!
                          .removeWhere((e) => e.facilityName == exercise.name);
                      vm.notifyChangeFacility(facility!);
                    }
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

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/core/constants/style.dart';
import 'package:village/model/category/confirm.dart';

class ConfirmChip extends ConsumerWidget {
  const ConfirmChip({
    super.key,
    required this.vm,
    required this.isConfirmed,
  });
  final vm;
  final isConfirmed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String confirmString = isConfirmed ? '승인 필요' : '승인 필요 없음';
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
            const Text(
              '승인 여부 확인',
              style: mblack_text,
            ),
            const SizedBox(height: 10.0),
            Wrap(
              spacing: 5.0,
              children: Confirm.values.map((confirm) {
                return ChoiceChip(
                  label: Text(confirm.name),
                  selected: confirmString == confirm.name,
                  onSelected: (bool selected) {
                    if (selected) {
                      vm.notifyChangeConfirm(!isConfirmed);
                    }
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

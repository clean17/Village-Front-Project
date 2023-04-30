import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/core/constants/style.dart';
import 'package:village/model/category/category.dart';

class CategoryTable extends ConsumerWidget {
  const CategoryTable({
    super.key,
    required this.vm,
    required this.categoryName,
  });
  final vm;
  final categoryName;

  // Category? _selectedCategory;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              '카테고리를 선택하세요',
              style: mblack_text,
            ),
            const SizedBox(height: 10.0),
            Wrap(
              spacing: 5.0,
              children: Category.values.map((category) {
                return ChoiceChip(
                  label: Text(category.name),
                  selected: categoryName == category.name,
                  onSelected: (bool selected) {
                    if (selected) {
                      vm.notifyChangeCategory(category.name);
                    } else {
                      vm.notifyChangeCategory();
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

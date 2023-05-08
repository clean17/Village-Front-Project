import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/core/constants/style.dart';
import 'package:village/dummy/category_list.dart';
import 'package:village/view/pages/search/result_page/search_result_page_view_model.dart';

class PlaceCatetoryApp extends AppBar {
  PlaceCatetoryApp({
    super.key,
  });

  @override
  State<PlaceCatetoryApp> createState() => _PlaceCatetoryAppState();
}

class _PlaceCatetoryAppState extends State<PlaceCatetoryApp> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: IconButton(
          icon: mback_icon,
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
          statusBarIconBrightness: Brightness.light, // 최상단
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Consumer(
          builder: (context, ref, child) {
            final pm = ref.watch(searchResultPageProvider);
            final vm = ref.read(searchResultPageProvider.notifier);
            return pm?.keyword != null
                ? DropdownButton(
                    value: pm?.keyword ?? "스터디룸",
                    items: categories
                        .map((e) => DropdownMenuItem(
                              value: e, // 선택 시 onChanged 를 통해 반환할 value
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: (value) {
                      vm.notifyKeyword(value.toString());
                    },
                  )
                : DropdownButton(
                    value: categories[0],
                    items: categories
                        .map((e) => DropdownMenuItem(
                              value: e, // 선택 시 onChanged 를 통해 반환할 value
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: (value) {
                      vm.notifyKeyword(value.toString());
                    },
                  );
          },
        ));
  }
}

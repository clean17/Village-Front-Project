import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:village/core/constants/style.dart';

class PlaceCatetoryApp extends AppBar {
  PlaceCatetoryApp({super.key});

  @override
  State<PlaceCatetoryApp> createState() => _PlaceCatetoryAppState();
}

class _PlaceCatetoryAppState extends State<PlaceCatetoryApp> {
  final _cities = ['연습실', '공유오피스', '사무실'];

  dynamic _selectedCity = '연습실';

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
      title: DropdownButton(
        value: _selectedCity,
        items: _cities
            .map((e) => DropdownMenuItem(
                  value: e, // 선택 시 onChanged 를 통해 반환할 value
                  child: Text(e),
                ))
            .toList(),
        onChanged: (value) {
          // items 의 DropdownMenuItem 의 value 반환
          setState(() {
            _selectedCity = value!;
          });
        },
      ),
    );
  }
}

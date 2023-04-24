import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:village/core/constants/style.dart';
import 'package:village/main.dart';

final mContext = navigatorKey.currentContext;

class ResisterAppbar extends AppBar {
  ResisterAppbar({super.key})
      : super(
          systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
            statusBarIconBrightness: Brightness.dark,
          ), // 최상단
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.pop(mContext!);
            },
            color: Colors.black,
          ),
          centerTitle: true,
          title: const Text(
            '공간 등록',
            style: mlarge_black_text,
          ),
          elevation: 0.0,
        );
}

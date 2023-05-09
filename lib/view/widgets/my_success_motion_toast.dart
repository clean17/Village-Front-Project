import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

import '../../main.dart';

final mContext = navigatorKey.currentContext;

void MySuccessMotionToast(String title, String subtitle) {
  MotionToast.success(
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          width: 300,
          height: 80,
          description: Text(subtitle),
          animationType: AnimationType.fromTop,
          position: MotionToastPosition.top,
          animationDuration: const Duration(milliseconds: 700),
          toastDuration: Duration(seconds: 2))
      .show(mContext!);
}

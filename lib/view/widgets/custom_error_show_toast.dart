import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:village/core/constants/color.dart';

void CustomErrorShowToast(String msg){
  Fluttertoast.showToast(
      msg: msg,//메세지입력
      toastLength: Toast.LENGTH_SHORT, //메세지를 보여주는 시간(길이)
      gravity: ToastGravity.CENTER,//위치지정
      timeInSecForIosWeb: 1, //ios및웹용 시간
      backgroundColor: Colors.red,//배경색
      textColor: Colors.black,//글자색
      fontSize: 16.0 //폰트사이즈
  );
}
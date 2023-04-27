import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class BookMarkAlertDialog extends StatelessWidget {
  const BookMarkAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // title: Text("로그인이 필요합니다"),
      content: Text("로그인을 하시겠습니까?"),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.popAndPushNamed(context, '/oAuth'),
          child: const Text('확인'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('취소'),
        ),
      ],
    );
  }
}

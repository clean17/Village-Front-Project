import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/controller/user_controller.dart';

class LogoutAlertDialog extends ConsumerWidget {
  const LogoutAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      // title: Text("로그아웃"),
      content: Text("로그아웃을 하시겠습니까?"),
      actions: <Widget>[
        TextButton(
          onPressed: () => ref.read(userControllerProvider).logout(),
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

import 'package:flutter/material.dart';
import 'package:village/dummy/notice.dart';

class NoticeDetailBody extends StatelessWidget {
  final Notice notice;

  const NoticeDetailBody({Key? key, required this.notice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(notice.title),
            subtitle: Text(notice.subtitle),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            child: Text(notice.body),
          ),
        ],
      ),
    );
  }
}

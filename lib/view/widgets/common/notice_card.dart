import 'package:flutter/material.dart';
import 'package:village/dummy/notice.dart';
import 'package:village/view/pages/common/notice_detail_page.dart';

class NoticeCard extends StatelessWidget {
  const NoticeCard({required this.notice ,Key? key}) : super(key: key);

  final Notice notice;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => NoticeDetailPage(notice: notice),));
      },
      title: Text(notice.title),
      subtitle: Text(notice.subtitle),
    );
  }
}

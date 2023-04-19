import 'package:flutter/material.dart';
import 'package:village/dummy/notice.dart';
import 'package:village/view/pages/common/notice_detail_page/widgets/notice_detail_body.dart';
import 'package:village/view/widgets/simple_text_appbar.dart';

class NoticeDetailPage extends StatelessWidget {
  const NoticeDetailPage({required this.notice,Key? key}) : super(key: key);

  final Notice notice;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleTextAppbar("공지사항"),
      body: NoticeDetailBody(notice: notice),
    );
  }

}

import 'package:flutter/material.dart';
import 'package:village/dummy/notice.dart';
import 'package:village/view/pages/common/notice_page/widgets/notice_card.dart';
import 'package:village/view/widgets/simple_text_appbar.dart';

class NoticePage extends StatelessWidget {
  const NoticePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleTextAppbar("공지사항"),
      body: ListView.builder(
        itemCount: notices.length,
        itemBuilder: (context, index) => NoticeCard(notice: notices[index]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:village/dummy/notice.dart';
import 'package:village/view/pages/common/notice_page/widgets/notice_card.dart';

class NoticeBody extends StatelessWidget {
  const NoticeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notices.length,
      itemBuilder: (context, index) => NoticeCard(notice: notices[index]),
    );
  }
}

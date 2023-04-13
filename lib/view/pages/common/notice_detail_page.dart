import 'package:flutter/material.dart';
import 'package:village/dummy/notice.dart';

class NoticeDetailPage extends StatelessWidget {
  const NoticeDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("공지사항", style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Text("$buildNotices()")
          ],
        ),
      ),
    );
  }
}

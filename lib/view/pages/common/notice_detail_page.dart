import 'package:flutter/material.dart';
import 'package:village/dummy/notice.dart';

class NoticeDetailPage extends StatelessWidget {
  const NoticeDetailPage({required this.notice,Key? key}) : super(key: key);

  final Notice notice;


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
      ),
    );
  }
}

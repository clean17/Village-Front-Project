import 'package:flutter/material.dart';
import 'package:village/view/pages/user/scrap_page/widgets/user_scrap_body.dart';

class UserScarpPage extends StatelessWidget {
  const UserScarpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "스크랩",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: const UserScrapBody(),
    );
  }
}

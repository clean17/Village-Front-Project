import 'package:flutter/material.dart';
import 'package:village/view/pages/main/home_page/widgets/place_container.dart';
import 'package:village/view/pages/user/my_scrap_page/widgets/body.dart';
import 'package:village/view/widgets/place_appbar.dart';
import 'package:village/view/widgets/simple_appbar.dart';

class MyScrapPage extends StatelessWidget {
  const MyScrapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("스크랩", style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}

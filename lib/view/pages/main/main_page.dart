import 'package:flutter/material.dart';
import 'package:village/core/color.dart';
import 'package:village/view/pages/main/home_page.dart';
import 'package:village/view/widgets/main/custom_bottom_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:village/core/color.dart';
import 'package:village/core/style.dart';
import 'package:village/view/pages/main/home_page.dart';
import 'package:village/view/widgets/chat/chat_icon_button.dart';
import 'package:village/view/widgets/main/custom_bottom_navigation_bar.dart';
import 'package:village/view/widgets/round_icon_button.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "VILLAGE",
          style: TextStyle(
              color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.chat_outlined),
            color: Colors.black,
            iconSize: 30,
          )
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          HomePage(),
          Center(child: Text("내근처")),
          Center(child: Text("검색페이지")),
          Center(child: Text("마이페이지")),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onTabTapped: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

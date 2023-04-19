import 'package:flutter/material.dart';
import 'package:village/core/constants/color.dart';
import 'package:village/view/pages/main/home_page/home_page.dart';
import 'package:village/view/pages/main/main_page/widgets/custom_bottom_navigation_bar.dart';
import 'package:village/view/pages/user/my_page/my_page.dart';

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
        title: const Text(
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
          MyPage(),
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

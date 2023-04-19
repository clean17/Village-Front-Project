import 'package:flutter/material.dart';
import 'package:village/view/pages/main/home_page/home_page.dart';
import 'package:village/view/pages/main/main_page/widgets/custom_bottom_navigation_bar.dart';
import 'package:village/view/pages/search/keyword_page/search_keyword_page.dart';
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
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          HomePage(),
          Center(child: Text("내근처")),
          SearchKeywordPage(),
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

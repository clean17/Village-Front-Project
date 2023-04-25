import 'package:flutter/material.dart';
import 'package:village/view/pages/main/home_page/home_page.dart';
import 'package:village/view/pages/main/main_page/widgets/custom_bottom_navigation_bar.dart';
import 'package:village/view/pages/map/nearby_place_page/map_nearby_place_page.dart';
import 'package:village/view/pages/search/keyword_page/search_keyword_page.dart';
import 'package:village/view/pages/user/my_page/my_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(), // 스와이프 막아줌
        children: [
          HomePage(),
          MapNearbyPlacePage(),
          SearchKeywordPage(),
          MyPage(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onTabTapped: (int index) {
          setState(() {
            _selectedIndex = index;
            _pageController.jumpToPage(index);
          });
        },
      ),
    );
  }
}

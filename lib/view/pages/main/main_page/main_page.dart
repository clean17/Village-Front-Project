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
    return WillPopScope(
        onWillPop: () async {
          if (_selectedIndex != 0) {
            setState(() {
              _selectedIndex = 0;
              _pageController.jumpToPage(0);
            });
            return false;
          } else {
            final exit = await showDialog<bool>(
              context: context,
              builder: (context) => AlertDialog(
                content: const Text("앱을 종료하시겠습니까?"),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: const Text('확인'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: const Text('취소'),
                  ),
                ],
              ),
            );

            // showDialog의 결과로부터 뒤로 가기 버튼의 동작을 결정합니다.
            return exit ?? false;
          }
        },
        child: Scaffold(
          body: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(), // 스와이프 막아줌
            children: [
              const HomePage(),
              const MapNearbyPlacePage(),
              SearchKeywordPage(),
              const MyPage(),
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
        ));
  }
}

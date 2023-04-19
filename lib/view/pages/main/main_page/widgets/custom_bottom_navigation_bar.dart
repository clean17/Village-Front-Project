import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:village/core/constants/color.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabTapped;

  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onTabTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: Colors.grey[50],
      selectedItemColor: kPrimaryColor,
      unselectedItemColor: Colors.grey[400],
      onTap: onTabTapped,
      currentIndex: selectedIndex,
      items: const [
        BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.home), label: ""),
        BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.map), label: ""),
        BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.search), label: ""),
        BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.user), label: ""),
      ],
    );
  }
}
